import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/models/dose_occurrence.dart';
import '../../data/models/enums.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import '../../widgets/remi.dart';
import '../common/care_actions.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final summary = ref.watch(todaySummaryProvider);
    final meds = ref.watch(activeMedicationsProvider);
    final profile = ref.watch(profileProvider).value;
    final now = ref.watch(clockProvider).value ?? DateTime.now();

    return Scaffold(
      appBar: RemediHeader(subtitle: l.navSchedule),
      body: summary.when(
        loading: () => const RemiLoader(),
        error: (e, _) => Center(child: Text('$e')),
        data: (s) {
          final firstName = (profile?.fullName ?? '').trim().split(' ').first;
          final hasMeds = (meds.value ?? const []).isNotEmpty;
          return PageBody(
            spacing: Space.md,
            children: [
              _Greeting(now: now, name: firstName, progress: s.progress),
              if (!hasMeds)
                EmptyState(
                  icon: Symbols.medication,
                  title: l.emptyScheduleTitle,
                  body: l.emptyScheduleBody,
                  action: AppButton(label: l.addMedicine, icon: Symbols.add, expand: false, onPressed: () => context.go('/log')),
                )
              else ...[
                _ProgressBanner(summary: s),
                if (s.next != null) ...[
                  _UpNextHeader(occurrence: s.next!, now: now),
                  _HeroDoseCard(key: ValueKey(s.next!.key), occurrence: s.next!, now: now),
                ] else if (s.all.isNotEmpty)
                  const _AllDoneCard(),
                if (s.later.isNotEmpty) ...[
                  SectionTitle(l.laterToday, trailing: Text(l.dosesPending(s.later.length.toString()), style: AppText.labelSm.copyWith(color: AppColors.secondary))),
                  for (final o in s.later) _LaterCard(occurrence: o, now: now),
                ],
                if (s.resolved.isNotEmpty) _CompletedAccordion(items: s.resolved, now: now),
                if (s.next?.medication.instructions?.trim().isNotEmpty ?? false) _DoctorDirective(occurrence: s.next!),
                _PrnQuickLog(),
              ],
              AppButton(
                label: l.sosButton,
                icon: Symbols.contact_emergency,
                tone: ButtonTone.danger,
                height: 48,
                textStyle: AppText.labelMd,
                onPressed: () => showSosSheet(context, ref),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting({required this.now, required this.name, required this.progress});
  final DateTime now;
  final String name;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final greeting = now.hour < 12
        ? l.goodMorning(name)
        : now.hour < 17
        ? l.goodAfternoon(name)
        : l.goodEvening(name);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Symbols.calendar_today, size: 16, color: AppColors.primary),
                  const SizedBox(width: 6),
                  Text(
                    formatDayLong(context, now).toUpperCase(),
                    style: AppText.labelMd.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(name.isEmpty ? greeting.replaceAll(RegExp(r',\s*$'), '') : greeting, style: AppText.headlineLg),
            ],
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: AppColors.primaryFixed.withValues(alpha: 0.3), shape: BoxShape.circle),
          alignment: Alignment.center,
          child: ProgressRing(value: progress, size: 28, stroke: 3.5),
        ),
      ],
    );
  }
}

class _ProgressBanner extends StatelessWidget {
  const _ProgressBanner({required this.summary});
  final TodaySummary summary;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final done = summary.taken.length;
    final total = summary.all.length;
    final pct = (summary.progress * 100).round();
    final mood = total == 0 ? '' : done == total ? l.moodAllDone : done > 0 ? l.moodGood : l.moodStart;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(Radii.xl),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          IconTile(icon: Symbols.spa, size: 28, iconSize: 17, circle: true, background: AppColors.primary.withValues(alpha: 0.1)),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: total == 0 ? l.noDosesToday : l.dosesDoneOf(done.toString(), total.toString())),
                  if (mood.isNotEmpty) TextSpan(text: ' $mood', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                ],
              ),
              style: AppText.bodySm.copyWith(color: AppColors.onSurface),
            ),
          ),
          Pill(label: '$pct%', background: AppColors.primaryFixed, foreground: AppColors.onPrimaryFixed, style: AppText.labelSm.copyWith(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

String dueLabel(BuildContext context, DoseOccurrence o, DateTime now) {
  final l = context.l10n;
  final state = o.stateAt(now);
  final t = o.effectiveTime;
  final mins = t.difference(now).inMinutes;
  return switch (state) {
    OccurrenceState.snoozed => l.snoozedUntil(formatTime(context, t)),
    OccurrenceState.overdue => l.overdueBy(now.difference(o.scheduledAt).inMinutes.toString()),
    OccurrenceState.due when mins <= 1 => l.dueNow,
    OccurrenceState.due => l.dueInMinutes(mins.toString()),
    _ => l.dueAt(formatTime(context, t)),
  };
}

Color urgencyColor(OccurrenceState s) => switch (s) {
  OccurrenceState.overdue => AppColors.tertiaryContainer,
  OccurrenceState.due || OccurrenceState.snoozed => AppColors.tertiaryFixedDim,
  _ => AppColors.primaryContainer,
};

class _UpNextHeader extends StatelessWidget {
  const _UpNextHeader({required this.occurrence, required this.now});
  final DoseOccurrence occurrence;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final state = occurrence.stateAt(now);
    final urgent = state == OccurrenceState.overdue;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          PulseDot(color: urgent ? AppColors.tertiaryContainer : AppColors.primaryContainer),
          const SizedBox(width: 6),
          Expanded(child: Text(context.l10n.upNext, style: AppText.labelLg)),
          Pill(
            label: dueLabel(context, occurrence, now),
            background: urgent ? AppColors.tertiaryContainer : AppColors.tertiaryFixed,
            foreground: urgent ? AppColors.onTertiary : AppColors.tertiary,
            style: AppText.labelSm.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _HeroDoseCard extends ConsumerStatefulWidget {
  const _HeroDoseCard({super.key, required this.occurrence, required this.now});
  final DoseOccurrence occurrence;
  final DateTime now;

  @override
  ConsumerState<_HeroDoseCard> createState() => _HeroDoseCardState();
}

class _HeroDoseCardState extends ConsumerState<_HeroDoseCard> {
  bool _busy = false;

  Future<void> _take() async {
    setState(() => _busy = true);
    final o = widget.occurrence;
    final logId = await ref.read(doseActionsProvider).markTaken(o);
    HapticFeedback.mediumImpact();
    if (!mounted) return;
    final l = context.l10n;
    showToast(
      context,
      l.toastDoseLogged(o.medication.name),
      action: SnackBarAction(label: l.undo, onPressed: () => ref.read(doseActionsProvider).undo(logId)),
    );
  }

  Future<void> _snooze() async {
    final until = await ref.read(doseActionsProvider).snooze(widget.occurrence);
    if (!mounted) return;
    final l = context.l10n;
    showToast(context, until == null ? l.snoozeLimitReached : l.toastSnoozedUntil(formatTime(context, until)), icon: Symbols.snooze);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final o = widget.occurrence;
    final m = o.medication;
    final state = o.stateAt(widget.now);
    final canSnooze = o.snoozeCount < 3;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(Radii.xxl),
        boxShadow: AppColors.raisedShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 6, color: urgencyColor(state)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(Radii.lg),
                      onTap: () => context.push('/medication/${m.id}'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconTile(
                            icon: formIcon(m.form),
                            size: 56,
                            iconSize: 32,
                            radius: Radii.xl,
                            background: AppColors.primaryFixed.withValues(alpha: 0.4),
                          ),
                          const SizedBox(width: Space.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(m.name, style: AppText.headlineLg.copyWith(height: 1.15)),
                                const SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: m.strength,
                                    children: [
                                      TextSpan(
                                        text: ' • ${l.doseUnits(o.schedule.doseAmount, m.form)}',
                                        style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                                      ),
                                    ],
                                  ),
                                  style: AppText.bodyLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Symbols.schedule, size: 15, color: AppColors.secondary),
                                    const SizedBox(width: 4),
                                    Flexible(
                                      child: Text(
                                        '${formatTime(context, o.scheduledAt)} • ${l.routineOf(l.slot(o.schedule.slot))}',
                                        style: AppText.bodySm.copyWith(color: AppColors.secondary),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Space.md),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (m.mealRelation != MealRelation.any)
                          _InfoChip(icon: mealIcon(m.mealRelation), label: l.meal(m.mealRelation), warm: true),
                        if (m.form != DoseForm.cream && m.form != DoseForm.injection && m.form != DoseForm.inhaler)
                          _InfoChip(icon: Symbols.local_drink, label: l.fullGlassWater),
                      ],
                    ),
                    const SizedBox(height: Space.lg),
                    AppButton(
                      label: l.markAsTaken,
                      icon: Symbols.check_circle,
                      tone: ButtonTone.primaryContainer,
                      textStyle: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700),
                      busy: _busy,
                      onPressed: _take,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            label: canSnooze ? l.snooze15 : l.noSnoozesLeft,
                            icon: Symbols.snooze,
                            tone: ButtonTone.tonal,
                            height: 48,
                            onPressed: canSnooze ? _snooze : null,
                          ),
                        ),
                        const SizedBox(width: Space.sm),
                        Expanded(
                          child: AppButton(
                            label: l.skipOrSideEffect,
                            icon: Symbols.report_problem,
                            tone: ButtonTone.low,
                            height: 48,
                            onPressed: () => showSkipSheet(context, ref, o),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label, this.warm = false});
  final IconData icon;
  final String label;
  final bool warm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: warm ? AppColors.tertiaryFixed : AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(Radii.lg),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: warm ? AppColors.tertiary : AppColors.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(label, style: AppText.labelMd.copyWith(color: warm ? AppColors.onTertiaryFixed : AppColors.onSurfaceVariant)),
        ],
      ),
    );
  }
}

class _AllDoneCard extends StatelessWidget {
  const _AllDoneCard();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return SurfaceCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const IconTile(icon: Symbols.task_alt, size: 56, iconSize: 30, radius: Radii.xl, background: AppColors.primaryFixed, fill: 1),
          const SizedBox(width: Space.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l.allDoneTitle, style: AppText.headlineMd),
                Text(l.allDoneBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LaterCard extends StatelessWidget {
  const _LaterCard({required this.occurrence, required this.now});
  final DoseOccurrence occurrence;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final o = occurrence;
    final m = o.medication;
    final state = o.stateAt(now);
    final urgent = state == OccurrenceState.overdue || state == OccurrenceState.due;
    return SurfaceCard(
      radius: Radii.xl,
      onTap: () => context.push('/alarm/${o.schedule.id}?at=${Uri.encodeComponent(o.scheduledAt.toIso8601String())}'),
      child: Row(
        children: [
          IconTile(
            icon: timeIcon(o.scheduledAt.hour),
            size: 44,
            iconSize: 24,
            radius: Radii.lg,
            background: urgent ? AppColors.tertiaryFixed : AppColors.surfaceContainer,
            foreground: urgent ? AppColors.tertiary : AppColors.secondary,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text(m.name, style: AppText.headlineSm, overflow: TextOverflow.ellipsis)),
                    const SizedBox(width: 8),
                    Text(m.strength, style: AppText.labelSm.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${urgent ? dueLabel(context, o, now) : formatTime(context, o.effectiveTime)} • ${l.slot(o.schedule.slot)} • ${l.doseUnits(o.schedule.doseAmount, m.form)}',
                  style: AppText.bodySm.copyWith(color: urgent ? AppColors.tertiary : AppColors.secondary),
                ),
              ],
            ),
          ),
          const Icon(Symbols.chevron_right, color: AppColors.outline, size: 20),
        ],
      ),
    );
  }
}

class _CompletedAccordion extends ConsumerStatefulWidget {
  const _CompletedAccordion({required this.items, required this.now});
  final List<DoseOccurrence> items;
  final DateTime now;

  @override
  ConsumerState<_CompletedAccordion> createState() => _CompletedAccordionState();
}

class _CompletedAccordionState extends ConsumerState<_CompletedAccordion> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final taken = widget.items.where((o) => o.stateAt(widget.now) == OccurrenceState.taken).length;
    return SurfaceCard(
      padding: EdgeInsets.zero,
      radius: Radii.xl,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _open = !_open),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 52),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconTile(icon: Symbols.check, size: 24, iconSize: 16, circle: true, background: AppColors.primaryFixed.withValues(alpha: 0.4)),
                    const SizedBox(width: 10),
                    Expanded(child: Text(l.completedEarlier, style: AppText.headlineSm)),
                    Pill(label: l.takenCount(taken.toString()), background: AppColors.surfaceContainer, foreground: AppColors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    AnimatedRotation(
                      turns: _open ? 0.5 : 0,
                      duration: const Duration(milliseconds: 250),
                      child: const Icon(Symbols.expand_more, color: AppColors.secondary),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: _open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              child: Column(
                children: [
                  for (final o in widget.items) ...[
                    _CompletedRow(occurrence: o, now: widget.now),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompletedRow extends ConsumerWidget {
  const _CompletedRow({required this.occurrence, required this.now});
  final DoseOccurrence occurrence;
  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final o = occurrence;
    final state = o.stateAt(now);
    final (icon, color, label) = switch (state) {
      OccurrenceState.taken => (Symbols.task_alt, AppColors.primary, l.statusDone),
      OccurrenceState.skipped => (Symbols.block, AppColors.secondary, l.statusSkipped),
      _ => (Symbols.error, AppColors.tertiary, l.statusMissed),
    };
    final when = o.log != null ? formatTime(context, o.log!.actionAt) : formatTime(context, o.scheduledAt);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.lg)),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(o.medication.name, style: AppText.bodyMd.copyWith(fontWeight: FontWeight.w600)),
                Text('$when • ${l.doseUnits(o.schedule.doseAmount, o.medication.form)}', style: AppText.bodySm.copyWith(color: AppColors.secondary)),
              ],
            ),
          ),
          if (state == OccurrenceState.missed)
            TextButton(
              onPressed: () async {
                await ref.read(doseActionsProvider).markTaken(o);
                if (context.mounted) showToast(context, l.toastDoseLogged(o.medication.name));
              },
              child: Text(l.tookItLate),
            )
          else
            Text(label, style: AppText.labelSm.copyWith(color: color, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _DoctorDirective extends StatelessWidget {
  const _DoctorDirective({required this.occurrence});
  final DoseOccurrence occurrence;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final m = occurrence.medication;
    return SurfaceCard(
      color: AppColors.surfaceContainer,
      shadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Symbols.stethoscope, size: 20, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(l.doctorDirective, style: AppText.headlineSm.copyWith(color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 6),
          Text.rich(
            TextSpan(
              children: [
                if (m.prescriberName != null)
                  TextSpan(
                    text: '${m.prescriberName}${m.facility == null ? '' : ' (${m.facility})'}: ',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                TextSpan(text: '“${m.instructions!.trim()}”'),
              ],
            ),
            style: AppText.bodyMd,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(child: Text(l.forMedication(m.name), style: AppText.labelSm.copyWith(color: AppColors.secondary))),
              TextButton(onPressed: () => context.push('/medication/${m.id}'), child: Text(l.viewDetails)),
            ],
          ),
        ],
      ),
    );
  }
}

/// One-tap logging for as-needed medicines (no reminders).
class _PrnQuickLog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final prn = (ref.watch(activeMedicationsProvider).value ?? const [])
        .where((m) => m.medication.frequency == Frequency.prn)
        .toList();
    if (prn.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(l.asNeededMeds),
        const SizedBox(height: Space.sm),
        Wrap(
          spacing: Space.sm,
          runSpacing: Space.sm,
          children: [
            for (final m in prn)
              ActionChip(
                avatar: Icon(formIcon(m.medication.form), size: 18, color: AppColors.primary),
                label: Text(l.tookPrn(m.medication.name)),
                labelStyle: AppText.labelMd,
                backgroundColor: AppColors.surfaceContainerLowest,
                side: BorderSide.none,
                elevation: 1,
                shadowColor: const Color(0x220F172A),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.lg)),
                onPressed: () async {
                  await ref.read(doseActionsProvider).takeAsNeeded(m.medication);
                  if (context.mounted) showToast(context, l.toastDoseLogged(m.medication.name));
                },
              ),
          ],
        ),
      ],
    );
  }
}
