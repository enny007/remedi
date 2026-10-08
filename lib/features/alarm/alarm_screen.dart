import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/catalog/drug_catalog.dart';
import '../../data/db/app_database.dart';
import '../../data/models/dose_occurrence.dart';
import '../../data/models/enums.dart';
import '../../data/repositories/dose_repository.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import '../../widgets/remi.dart';
import '../common/care_actions.dart';

/// Full-screen dose prompt opened from an alarm notification (or a schedule
/// card). Requires an explicit swallow confirmation before logging.
class AlarmScreen extends ConsumerWidget {
  const AlarmScreen({super.key, required this.scheduleId, this.scheduledAt, this.caregiverPrompt = false});
  final String scheduleId;
  final DateTime? scheduledAt;
  final bool caregiverPrompt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final day = dayStart(scheduledAt ?? DateTime.now());
    final occ = ref.watch(dayOccurrencesProvider(day));
    final now = ref.watch(clockProvider).value ?? DateTime.now();
    return Scaffold(
      appBar: RemediHeader(subtitle: l.alarmAlert, showBack: true),
      body: occ.when(
        loading: () => const RemiLoader(),
        error: (e, _) => Center(child: Text('$e')),
        data: (list) {
          final forSchedule = list.where((o) => o.schedule.id == scheduleId).toList();
          DoseOccurrence? o;
          if (scheduledAt != null) {
            o = forSchedule.where((x) => x.scheduledAt == scheduledAt).firstOrNull;
          } else if (forSchedule.isNotEmpty) {
            // Pick the dose closest to now.
            forSchedule.sort((a, b) => a.scheduledAt.difference(now).abs().compareTo(b.scheduledAt.difference(now).abs()));
            o = forSchedule.first;
          }
          if (o == null) {
            return EmptyState(icon: Symbols.alarm_off, title: l.doseNotFound, body: l.doseNotFoundBody);
          }
          final index = list.indexOf(o) + 1;
          return _AlarmBody(occurrence: o, index: index, total: list.length, now: now, caregiverPrompt: caregiverPrompt);
        },
      ),
    );
  }
}

class _AlarmBody extends ConsumerStatefulWidget {
  const _AlarmBody({required this.occurrence, required this.index, required this.total, required this.now, required this.caregiverPrompt});
  final DoseOccurrence occurrence;
  final int index;
  final int total;
  final DateTime now;
  final bool caregiverPrompt;

  @override
  ConsumerState<_AlarmBody> createState() => _AlarmBodyState();
}

class _AlarmBodyState extends ConsumerState<_AlarmBody> {
  bool _swallowed = false;
  bool _busy = false;

  DoseOccurrence get o => widget.occurrence;

  Future<void> _confirm() async {
    setState(() => _busy = true);
    await ref.read(doseActionsProvider).markTaken(o);
    HapticFeedback.heavyImpact();
    if (!mounted) return;
    showToast(context, context.l10n.toastDoseLogged(o.medication.name), icon: Symbols.task_alt);
    context.canPop() ? context.pop() : context.go('/schedule');
  }

  Future<void> _snooze() async {
    final until = await ref.read(doseActionsProvider).snooze(o);
    if (!mounted) return;
    final l = context.l10n;
    showToast(context, until == null ? l.snoozeLimitReached : l.toastSnoozedUntil(formatTime(context, until)), icon: Symbols.snooze);
    if (until != null) context.canPop() ? context.pop() : context.go('/schedule');
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final m = o.medication;
    final state = o.stateAt(widget.now);
    final ringing = state == OccurrenceState.due || state == OccurrenceState.overdue;
    final resolved = o.log != null;
    final profile = ref.watch(profileProvider).value;
    final catalog = findCatalogDrug(m.name);
    final units = l.doseUnits(o.schedule.doseAmount, m.form);

    return PageBody(
      children: [
        if (ringing && !resolved) _RingingBanner(overdue: state == OccurrenceState.overdue),
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l.scheduledDose.toUpperCase(),
                      style: AppText.labelMd.copyWith(color: AppColors.tertiary, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Pill(
                    label: l.doseXofY(widget.index.toString(), widget.total.toString()),
                    background: AppColors.surfaceContainerHigh,
                    foreground: AppColors.onSurfaceVariant,
                  ),
                ],
              ),
              Text(formatTime(context, o.scheduledAt), style: AppText.displayLgMobile),
              if (profile != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Symbols.person, size: 18, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          text: '${l.prescribedFor} ',
                          children: [
                            TextSpan(
                              text: [profile.title, profile.fullName].whereType<String>().where((s) => s.isNotEmpty).join(' '),
                              style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.onSurface),
                            ),
                          ],
                        ),
                        style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(Radii.lg)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(formIcon(m.form), size: 32, fill: 1, color: AppColors.primary),
                        Text(
                          String.fromCharCodes(l.doseForm(m.form).runes.take(3)).toUpperCase(),
                          style: AppText.labelSm.copyWith(color: AppColors.primaryContainer, fontWeight: FontWeight.w800, height: 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(m.name, style: AppText.headlineMd, overflow: TextOverflow.ellipsis)),
                            Pill(label: l.routeOral, background: AppColors.primaryFixed, foreground: AppColors.onPrimaryFixed),
                          ],
                        ),
                        Text('${m.strength} • $units', style: AppText.headlineSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
                        if (m.drugClass != null || m.pillDescription != null)
                          Text(
                            [m.drugClass, m.pillDescription].whereType<String>().join(' • '),
                            style: AppText.bodySm.copyWith(color: AppColors.secondary),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (m.mealRelation != MealRelation.any || (m.instructions?.isNotEmpty ?? false)) ...[
                const SizedBox(height: Space.md),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(Radii.md)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Symbols.warning, fill: 1, color: AppColors.tertiary, size: 22),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l.criticalDirective.toUpperCase(), style: AppText.labelMd.copyWith(color: AppColors.tertiary, fontWeight: FontWeight.w800)),
                            if (m.mealRelation != MealRelation.any)
                              Text(_mealDirective(context, m.mealRelation), style: AppText.bodyMd.copyWith(fontWeight: FontWeight.w700)),
                            if (m.instructions?.isNotEmpty ?? false)
                              Text(m.instructions!, style: AppText.bodySm.copyWith(color: AppColors.secondary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (catalog?.dietWarning != null) ...[
                const SizedBox(height: Space.sm),
                _NoteRow(icon: Symbols.no_drinks, text: catalog!.dietWarning!),
              ],
            ],
          ),
        ),
        if (resolved)
          _ResolvedCard(occurrence: o)
        else
          SurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l.accountabilityTitle, style: AppText.headlineSm),
                Text(l.accountabilityBody, style: AppText.bodySm.copyWith(color: AppColors.secondary)),
                const SizedBox(height: Space.md),
                Material(
                  color: _swallowed ? AppColors.surfaceContainer : AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(Radii.md),
                  child: CheckboxListTile(
                    value: _swallowed,
                    onChanged: (v) {
                      HapticFeedback.selectionClick();
                      setState(() => _swallowed = v ?? false);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.md)),
                    title: Text(
                      _swallowText(context, m.form, units),
                      style: AppText.bodyMd.copyWith(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(l.preventsEscalation, style: AppText.labelSm.copyWith(color: AppColors.secondary)),
                  ),
                ),
                const SizedBox(height: Space.md),
                AppButton(
                  label: l.iHaveTakenThisDose,
                  icon: Symbols.task_alt,
                  textStyle: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700),
                  busy: _busy,
                  onPressed: _swallowed ? _confirm : null,
                ),
                const SizedBox(height: Space.sm),
                AppButton(
                  label: o.snoozeCount >= maxSnoozes
                      ? l.noSnoozesLeft
                      : l.snoozeWithRemaining((maxSnoozes - o.snoozeCount - 1).toString()),
                  icon: Symbols.snooze,
                  tone: ButtonTone.low,
                  height: 48,
                  onPressed: o.snoozeCount >= maxSnoozes ? null : _snooze,
                ),
                const SizedBox(height: 4),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: AppColors.tertiary, minimumSize: const Size.fromHeight(44)),
                  onPressed: () async {
                    final done = await showSkipSheet(context, ref, o);
                    if (done && context.mounted) context.canPop() ? context.pop() : context.go('/schedule');
                  },
                  icon: const Icon(Symbols.block, size: 18),
                  label: Text(l.skipDoseRequiresReason, style: AppText.labelMd),
                ),
              ],
            ),
          ),
        if (!resolved) _CaregiverFailSafe(occurrence: o, profile: profile, highlight: widget.caregiverPrompt),
      ],
    );
  }

  String _mealDirective(BuildContext context, MealRelation m) {
    final l = context.l10n;
    return switch (m) {
      MealRelation.withMeal => l.directiveWithMeal,
      MealRelation.afterFood => l.directiveAfterFood,
      MealRelation.beforeFood => l.directiveBeforeFood,
      MealRelation.emptyStomach => l.directiveEmpty,
      MealRelation.waterOnly => l.directiveWater,
      MealRelation.any => '',
    };
  }

  String _swallowText(BuildContext context, DoseForm f, String units) {
    final l = context.l10n;
    return switch (f) {
      DoseForm.cream => l.confirmApplied(units),
      DoseForm.injection => l.confirmInjected(units),
      DoseForm.inhaler => l.confirmInhaled(units),
      _ => l.confirmSwallowed(units),
    };
  }
}

class _NoteRow extends StatelessWidget {
  const _NoteRow({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.tertiary),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant))),
      ],
    ),
  );
}

class _RingingBanner extends StatelessWidget {
  const _RingingBanner({required this.overdue});
  final bool overdue;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.tertiaryContainer,
        borderRadius: BorderRadius.circular(Radii.lg),
        boxShadow: AppColors.raisedShadow,
      ),
      child: Row(
        children: [
          const IconTile(icon: Symbols.alarm_on, size: 32, iconSize: 20, circle: true, background: AppColors.tertiary, foreground: AppColors.onTertiary, fill: 1),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (overdue ? l.overdueAlarm : l.urgentAlarm).toUpperCase(),
                  style: AppText.labelMd.copyWith(color: AppColors.onTertiaryContainer, fontWeight: FontWeight.w800),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(l.offlineVerified, style: AppText.labelSm.copyWith(color: AppColors.onTertiaryContainer.withValues(alpha: 0.9))),
              ],
            ),
          ),
          Pill(
            label: l.ringing,
            dot: AppColors.onTertiaryContainer,
            background: AppColors.onTertiaryContainer.withValues(alpha: 0.12),
            foreground: AppColors.onTertiaryContainer,
            style: AppText.labelSm.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _ResolvedCard extends ConsumerWidget {
  const _ResolvedCard({required this.occurrence});
  final DoseOccurrence occurrence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final log = occurrence.log!;
    final taken = log.status == DoseStatus.taken;
    return SurfaceCard(
      child: Row(
        children: [
          IconTile(
            icon: taken ? Symbols.task_alt : Symbols.block,
            fill: 1,
            size: 48,
            background: taken ? AppColors.primaryFixed : AppColors.surfaceContainerHigh,
            foreground: taken ? AppColors.primary : AppColors.secondary,
          ),
          const SizedBox(width: Space.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taken ? l.alreadyTaken : l.alreadySkipped, style: AppText.headlineSm),
                Text(l.loggedAt(formatTime(context, log.actionAt)), style: AppText.bodySm.copyWith(color: AppColors.secondary)),
              ],
            ),
          ),
          TextButton(onPressed: () => ref.read(doseActionsProvider).undo(log.id), child: Text(l.undo)),
        ],
      ),
    );
  }
}

class _CaregiverFailSafe extends ConsumerWidget {
  const _CaregiverFailSafe({required this.occurrence, required this.profile, required this.highlight});
  final DoseOccurrence occurrence;
  final Profile? profile;
  final bool highlight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final p = profile;
    final phone = p?.caregiverPhone?.trim() ?? '';
    if (phone.isEmpty) {
      return SurfaceCard(
        color: AppColors.surfaceContainer,
        shadow: false,
        onTap: () => context.push('/profile'),
        child: Row(
          children: [
            const IconTile(icon: Symbols.person_add, circle: true, size: 36, iconSize: 20, background: AppColors.surfaceContainerLowest),
            const SizedBox(width: 12),
            Expanded(child: Text(l.caregiverSetupPrompt, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant))),
            const Icon(Symbols.chevron_right, color: AppColors.outline),
          ],
        ),
      );
    }
    final delay = p!.caregiverDelayMinutes;
    final deadline = occurrence.scheduledAt.add(Duration(minutes: delay));
    final name = [p.caregiverName, if (p.caregiverRelation != null) '(${p.caregiverRelation})'].whereType<String>().join(' ');
    return SurfaceCard(
      color: highlight ? AppColors.tertiaryFixed : AppColors.surfaceContainer,
      shadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IconTile(icon: Symbols.contact_phone, size: 34, iconSize: 20, circle: true, background: AppColors.surfaceContainerLowest),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(l.caregiverFailSafe.toUpperCase(), style: AppText.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
                        Pill(label: l.minutesQueue(delay.toString()), background: AppColors.surfaceContainerLowest, foreground: AppColors.onSurfaceVariant),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      p.caregiverAlertsEnabled ? l.caregiverFailSafeBody(formatTime(context, deadline)) : l.caregiverAlertsOff,
                      style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                    const SizedBox(height: 4),
                    Text('$name  •  $phone', style: AppText.labelMd.copyWith(color: AppColors.onSurface)),
                  ],
                ),
              ),
            ],
          ),
          if (highlight || DateTime.now().isAfter(deadline)) ...[
            const SizedBox(height: Space.md),
            AppButton(
              label: l.sosSendSms(p.caregiverName ?? phone),
              icon: Symbols.sms,
              tone: ButtonTone.tertiary,
              height: 48,
              onPressed: () => showSosSheet(context, ref, occurrence: occurrence),
            ),
          ],
        ],
      ),
    );
  }
}
