import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/models/dose_occurrence.dart';
import '../../data/models/enums.dart';
import '../../data/repositories/dose_repository.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import '../cabinet/cabinet_screen.dart';
import '../common/care_actions.dart';
import 'vital_widgets.dart';

class HealthScreen extends ConsumerWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final stats = ref.watch(adherenceProvider).value;
    return Scaffold(
      appBar: RemediHeader(subtitle: l.myHealth),
      body: PageBody(
        children: [
          const _VaultBanner(),
          if (stats != null) _MetricsRow(stats: stats),
          if (stats != null) _WeekCard(stats: stats),
          const _LanguageCard(),
          const _VitalsLogger(),
          const _Conditions(),
          const _Symptoms(),
          SurfaceCard(
            color: AppColors.surfaceContainerLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const IconTile(icon: Symbols.qr_code_scanner, circle: true, iconSize: 24, background: AppColors.surfaceContainerLowest),
                    const SizedBox(width: Space.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.doctorVisitTitle, style: AppText.headlineSm),
                          Text(l.doctorVisitBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Space.md),
                AppButton(label: l.generateSummary, icon: Symbols.picture_as_pdf, onPressed: () => context.push('/summary')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VaultBanner extends ConsumerWidget {
  const _VaultBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final pending = ref.watch(pendingSyncProvider).value ?? 0;
    return SurfaceCard(
      color: AppColors.surfaceContainerLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconTile(icon: Symbols.cloud_sync, size: 32, iconSize: 20, circle: true, fill: 1, background: AppColors.primaryFixed),
              const SizedBox(width: Space.xs + 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.offlineDataVault, style: AppText.headlineSm),
                    Text(l.localAndPrivate, style: AppText.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Pill(label: l.pendingCount(pending.toString()), background: AppColors.surfaceContainer),
            ],
          ),
          const SizedBox(height: Space.xs),
          Text(l.vaultBody(pending.toString()), style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: Space.sm),
          AppButton(
            label: l.attemptSync,
            icon: Symbols.sync,
            tone: ButtonTone.surface,
            expand: false,
            height: 44,
            onPressed: () => showToast(context, l.cloudSyncNotConfigured, icon: Symbols.cloud_off),
          ),
        ],
      ),
    );
  }
}

class _MetricsRow extends StatelessWidget {
  const _MetricsRow({required this.stats});
  final AdherenceStats stats;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final pct = (stats.rate * 100).round();
    final label = stats.expected == 0
        ? l.noDataYet
        : pct >= 90
        ? l.excellent
        : pct >= 75
        ? l.good
        : l.needsAttention;
    return TwoColumnGrid(
      gap: Space.sm,
      children: [
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(l.adherence30.toUpperCase(), style: AppText.labelMd.copyWith(color: AppColors.onSurfaceVariant))),
                  const Icon(Symbols.verified, size: 20, color: AppColors.primary),
                ],
              ),
              const SizedBox(height: Space.xs),
              Text.rich(
                TextSpan(
                  text: stats.expected == 0 ? '—' : '$pct%',
                  children: [TextSpan(text: '  ${l.target90}', style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant))],
                ),
                style: AppText.displayLgMobile.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: Space.xs),
              Row(
                children: [
                  ProgressRing(value: stats.rate, size: 24, stroke: 3.5),
                  const SizedBox(width: 8),
                  Flexible(child: Text(label, style: AppText.labelSm.copyWith(color: pct >= 75 ? AppColors.primary : AppColors.tertiary, fontWeight: FontWeight.w700))),
                ],
              ),
            ],
          ),
        ),
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(l.currentStreak.toUpperCase(), style: AppText.labelMd.copyWith(color: AppColors.onSurfaceVariant))),
                  const Icon(Symbols.local_fire_department, size: 20, fill: 1, color: AppColors.tertiary),
                ],
              ),
              const SizedBox(height: Space.xs),
              Text.rich(
                TextSpan(
                  text: '${stats.streakDays}',
                  children: [TextSpan(text: '  ${l.days}', style: AppText.labelMd.copyWith(color: AppColors.onSurfaceVariant))],
                ),
                style: AppText.displayLgMobile.copyWith(color: AppColors.tertiary),
              ),
              const SizedBox(height: Space.xs),
              Row(
                children: [
                  const Icon(Symbols.trending_up, size: 14, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      l.onTimeRate((stats.onTimeRate * 100).round().toString()),
                      style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WeekCard extends StatelessWidget {
  const _WeekCard({required this.stats});
  final AdherenceStats stats;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final week = stats.days.length >= 7 ? stats.days.sublist(stats.days.length - 7) : stats.days;
    final missed = week.fold<int>(0, (a, d) => a + d.skippedOrMissed);
    final loc = MaterialLocalizations.of(context);
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.weeklyRoutine, style: AppText.headlineSm),
                    Text(l.missedThisWeek(missed.toString()), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
              ),
              Pill(label: l.last7Days, background: AppColors.surfaceContainerLow),
            ],
          ),
          const SizedBox(height: Space.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final d in week)
                Builder(
                  builder: (context) {
                    final today = isSameDay(d.day, DateTime.now());
                    final (icon, color) = d.expected == 0
                        ? (Symbols.remove, AppColors.outlineVariant)
                        : d.skippedOrMissed > 0
                        ? (Symbols.cancel, AppColors.error)
                        : d.late > 0
                        ? (Symbols.schedule, AppColors.tertiary)
                        : (Symbols.check_circle, AppColors.primary);
                    return Column(
                      children: [
                        Text(
                          loc.narrowWeekdays[d.day.weekday % 7],
                          style: AppText.labelSm.copyWith(color: today ? AppColors.primary : AppColors.onSurfaceVariant, fontWeight: today ? FontWeight.w800 : null),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 36,
                          height: 44,
                          decoration: BoxDecoration(
                            color: today ? AppColors.primaryFixed : AppColors.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(Radii.md),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${d.day.day}', style: AppText.labelSm.copyWith(color: today ? AppColors.primary : AppColors.onSurface)),
                              Icon(icon, size: 16, fill: 1, color: color),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
          const SizedBox(height: Space.sm),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: Space.md,
            runSpacing: 4,
            children: [
              _Legend(color: AppColors.primary, label: l.legendOnTime),
              _Legend(color: AppColors.tertiary, label: l.legendLate),
              _Legend(color: AppColors.error, label: l.legendMissed),
            ],
          ),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 4),
      Text(label, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
    ],
  );
}

class _LanguageCard extends ConsumerWidget {
  const _LanguageCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final current = ref.watch(localeProvider).languageCode;
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Symbols.translate, color: AppColors.primary, size: 20),
              const SizedBox(width: 6),
              Expanded(child: Text(l.languageCardTitle, style: AppText.headlineSm)),
            ],
          ),
          const SizedBox(height: 4),
          Text(l.languageCardBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: Space.sm),
          Wrap(
            spacing: Space.xs,
            runSpacing: Space.xs,
            children: [
              for (final code in supportedLanguageCodes)
                ChoiceChip(
                  selected: code == current,
                  showCheckmark: false,
                  avatar: Icon(code == current ? Symbols.check : Symbols.record_voice_over, size: 16, color: code == current ? AppColors.onPrimary : AppColors.secondary),
                  label: Text(languageNativeNames[code]!),
                  labelStyle: AppText.labelMd.copyWith(color: code == current ? AppColors.onPrimary : AppColors.onSurface),
                  selectedColor: AppColors.primary,
                  backgroundColor: AppColors.surfaceContainerLow,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  onSelected: (_) => ref.read(localeProvider.notifier).set(code),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VitalsLogger extends ConsumerWidget {
  const _VitalsLogger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final bp = ref.watch(vitalsProvider(VitalType.bloodPressure)).value ?? const [];
    final sugar = ref.watch(vitalsProvider(VitalType.bloodGlucose)).value ?? const [];
    final latestBp = bp.where((v) => v.value2 != null).firstOrNull;
    final latestSugar = sugar.firstOrNull;
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(Symbols.monitor_heart, color: AppColors.primary, size: 20),
              const SizedBox(width: 6),
              Expanded(child: Text(l.vitalsQuickLogger, style: AppText.headlineSm)),
              TextButton(onPressed: () => context.go('/health/vitals'), child: Text(l.seeTrends)),
            ],
          ),
          const SizedBox(height: Space.xs),
          if (latestBp != null) ...[
            _LatestRow(
              icon: Symbols.cardiology,
              label: '${l.bloodPressure} • ${formatTime(context, latestBp.recordedAt)}',
              value: '${latestBp.value.round()} / ${latestBp.value2!.round()}',
              unit: 'mmHg',
              badge: l.bpCategory(classifyBp(latestBp.value, latestBp.value2!)),
              badgeColor: bpColor(classifyBp(latestBp.value, latestBp.value2!)),
            ),
            const SizedBox(height: Space.sm),
          ],
          if (latestSugar != null) ...[
            _LatestRow(
              icon: Symbols.bloodtype,
              label: '${l.bloodSugar} • ${formatTime(context, latestSugar.recordedAt)}',
              value: latestSugar.value.round().toString(),
              unit: latestSugar.unit,
            ),
            const SizedBox(height: Space.sm),
          ],
          if (latestBp == null && latestSugar == null) ...[
            Text(l.noVitalsYet, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: Space.sm),
          ],
          AppButton(label: l.logBpOrSugar, icon: Symbols.add_circle, tone: ButtonTone.tonal, height: 48, onPressed: () => showLogVitalSheet(context)),
        ],
      ),
    );
  }
}

class _LatestRow extends StatelessWidget {
  const _LatestRow({required this.icon, required this.label, required this.value, required this.unit, this.badge, this.badgeColor});
  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final String? badge;
  final Color? badgeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Space.sm),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
      child: Row(
        children: [
          IconTile(icon: icon, circle: true, background: AppColors.surfaceContainerLowest),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                Text.rich(
                  TextSpan(
                    text: value,
                    children: [TextSpan(text: ' $unit', style: AppText.labelSm.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w400))],
                  ),
                  style: AppText.headlineMd,
                ),
              ],
            ),
          ),
          if (badge != null) Pill(label: badge!, background: AppColors.surfaceContainer, foreground: badgeColor ?? AppColors.primary),
        ],
      ),
    );
  }
}

class _Conditions extends ConsumerWidget {
  const _Conditions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final meds = ref.watch(activeMedicationsProvider).value ?? const <MedicationWithSchedules>[];
    if (meds.isEmpty) return const SizedBox.shrink();
    final groups = <String, List<MedicationWithSchedules>>{};
    for (final m in meds) {
      groups.putIfAbsent(m.condition?.name ?? l.otherMedicines, () => []).add(m);
    }
    final colors = [AppColors.primary, AppColors.tertiary, AppColors.primaryContainer, AppColors.secondary];
    var i = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(
          l.activeConditions,
          trailing: Text(l.conditionsCount(groups.length.toString()), style: AppText.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(height: Space.sm),
        for (final e in groups.entries) ...[
          _ConditionCard(name: e.key, meds: e.value, color: colors[i++ % colors.length]),
          const SizedBox(height: Space.sm),
        ],
      ],
    );
  }
}

class _ConditionCard extends ConsumerWidget {
  const _ConditionCard({required this.name, required this.meds, required this.color});
  final String name;
  final List<MedicationWithSchedules> meds;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final cond = meds.first.condition;
    final low = meds.where((m) => m.lowStock || (m.daysLeft ?? 999) <= 7).toList();
    final minDays = meds.map((m) => m.daysLeft).whereType<int>().fold<int?>(null, (a, b) => a == null || b < a ? b : a);
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppText.headlineSm),
                    if (cond != null)
                      Text(
                        [
                          if (cond.diagnosedAt != null) l.since(formatMonthYear(context, cond.diagnosedAt!)),
                          cond.doctorName ?? cond.facility,
                        ].whereType<String>().join(' • '),
                        style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                      ),
                  ],
                ),
              ),
              if (minDays != null)
                Pill(
                  label: l.refillInDays(minDays.toString()),
                  icon: minDays <= 7 ? Symbols.warning : null,
                  background: minDays <= 7 ? AppColors.tertiaryContainer : AppColors.surfaceContainerLow,
                  foreground: minDays <= 7 ? AppColors.onTertiaryContainer : AppColors.primary,
                ),
            ],
          ),
          const SizedBox(height: Space.sm),
          for (final m in meds) ...[
            InkWell(
              onTap: () => context.push('/medication/${m.medication.id}'),
              child: Container(
                padding: const EdgeInsets.all(Space.xs + 2),
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(color: AppColors.surfaceContainerLow.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(Radii.sm)),
                child: Row(
                  children: [
                    const Icon(Symbols.medication, size: 16, color: AppColors.secondary),
                    const SizedBox(width: 6),
                    Text(m.medication.name, style: AppText.bodySm.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        '${m.medication.strength} • ${l.frequency(m.medication.frequency)}',
                        style: AppText.labelSm.copyWith(color: AppColors.secondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Symbols.chevron_right, size: 18, color: AppColors.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
          ],
          if (low.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.only(left: Space.sm),
              decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l.lowSupplyNotice(low.first.medication.name, l.doseUnits(low.first.medication.stockCount ?? 0, low.first.medication.form)),
                      style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: AppColors.tertiary, minimumSize: const Size(0, 44)),
                    onPressed: () => requestRefill(context, ref, low.first),
                    child: Text(l.orderRefill),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Symptoms extends ConsumerWidget {
  const _Symptoms();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final list = ref.watch(symptomsProvider).value ?? const [];
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(Symbols.chat_bubble, color: AppColors.tertiary, size: 20),
              const SizedBox(width: 6),
              Expanded(child: Text(l.symptomsNotes, style: AppText.headlineSm)),
              TextButton.icon(onPressed: () => showSymptomSheet(context, ref), icon: const Icon(Symbols.add, size: 18), label: Text(l.add)),
            ],
          ),
          if (list.isEmpty)
            Text(l.noSymptoms, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant))
          else
            for (final s in list.take(5))
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    const Icon(Symbols.info, size: 18, color: AppColors.tertiary),
                    const SizedBox(width: 8),
                    Expanded(child: Text(l.symptom(s.symptom), style: AppText.bodySm.copyWith(fontWeight: FontWeight.w600))),
                    Text(formatDate(context, s.recordedAt), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
