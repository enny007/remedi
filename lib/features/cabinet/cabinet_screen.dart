import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/models/dose_occurrence.dart';
import '../../data/models/enums.dart';
import '../../data/models/medication_draft.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import '../../widgets/remi.dart';
import '../common/care_actions.dart';
import '../intake/draft_controller.dart';

enum _Filter { all, morning, afternoon, night, prn }

class CabinetScreen extends ConsumerStatefulWidget {
  const CabinetScreen({super.key});

  @override
  ConsumerState<CabinetScreen> createState() => _CabinetScreenState();
}

class _CabinetScreenState extends ConsumerState<CabinetScreen> {
  _Filter _filter = _Filter.all;
  bool _searching = false;
  String _query = '';

  bool _matches(MedicationWithSchedules m) {
    if (_query.isNotEmpty && !m.medication.displayName.toLowerCase().contains(_query.toLowerCase())) return false;
    final hours = m.schedules.map((s) => s.hour);
    return switch (_filter) {
      _Filter.all => true,
      _Filter.morning => hours.any((h) => h < 12),
      _Filter.afternoon => hours.any((h) => h >= 12 && h < 17),
      _Filter.night => hours.any((h) => h >= 17),
      _Filter.prn => m.medication.frequency == Frequency.prn,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final meds = ref.watch(activeMedicationsProvider);
    return Scaffold(
      appBar: RemediHeader(subtitle: l.navMyMeds),
      body: meds.when(
        loading: () => const RemiLoader(),
        error: (e, _) => Center(child: Text('$e')),
        data: (all) {
          final list = all.where(_matches).toList();
          return Stack(
            children: [
              PageBody(
                bottomPadding: 100,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(child: Text(l.medicineCabinet, style: AppText.headlineLg)),
                          const SizedBox(width: Space.xs),
                          Pill(label: l.activeCount(all.length.toString()), background: AppColors.primaryFixed, foreground: AppColors.onPrimaryFixed),
                          const Spacer(),
                          IconButton.filledTonal(
                            tooltip: l.search,
                            style: IconButton.styleFrom(backgroundColor: AppColors.surfaceContainer),
                            onPressed: () => setState(() {
                              _searching = !_searching;
                              if (!_searching) _query = '';
                            }),
                            icon: Icon(_searching ? Symbols.close : Symbols.search, size: 20, color: AppColors.onSurfaceVariant),
                          ),
                        ],
                      ),
                      Text(l.cabinetHint, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                      if (_searching) ...[
                        const SizedBox(height: Space.sm),
                        TextField(
                          autofocus: true,
                          onChanged: (v) => setState(() => _query = v),
                          decoration: InputDecoration(hintText: l.searchCabinet, prefixIcon: const Icon(Symbols.search)),
                        ),
                      ],
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Row(
                      children: [
                        for (final f in _Filter.values) ...[
                          ChoiceChip(
                            selected: _filter == f,
                            showCheckmark: false,
                            label: Text(switch (f) {
                              _Filter.all => l.filterAll(all.length.toString()),
                              _Filter.morning => l.partMorning,
                              _Filter.afternoon => l.partAfternoon,
                              _Filter.night => l.partNight,
                              _Filter.prn => l.freqPrn,
                            }),
                            labelStyle: AppText.labelMd.copyWith(color: _filter == f ? AppColors.onPrimary : AppColors.onSurfaceVariant),
                            selectedColor: AppColors.primary,
                            backgroundColor: AppColors.surfaceContainerLow,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            onSelected: (_) => setState(() => _filter = f),
                          ),
                          const SizedBox(width: Space.xs),
                        ],
                      ],
                    ),
                  ),
                  if (all.isEmpty)
                    EmptyState(icon: Symbols.medication, title: l.emptyCabinetTitle, body: l.emptyScheduleBody)
                  else if (list.isEmpty)
                    EmptyState(icon: Symbols.medication, title: l.noMedsInCategory, body: l.noMedsInCategoryBody)
                  else
                    for (final m in list) _MedCard(med: m),
                  SurfaceCard(
                    color: AppColors.surfaceContainerLow,
                    shadow: false,
                    child: Row(
                      children: [
                        const IconTile(icon: Symbols.verified_user, size: 48, iconSize: 24, circle: true, background: AppColors.primaryFixed),
                        const SizedBox(width: Space.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l.offlineSynchronized, style: AppText.headlineSm),
                              Text(l.offlineSynchronizedBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: Space.margin,
                right: Space.margin,
                bottom: Space.md,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: DecoratedBox(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Radii.lg), boxShadow: AppColors.raisedShadow),
                      child: AppButton(label: l.addMedicine, icon: Symbols.add, height: 56, onPressed: () => context.go('/log')),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SupplyPill extends StatelessWidget {
  const SupplyPill({super.key, required this.med});
  final MedicationWithSchedules med;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final days = med.daysLeft;
    if (med.medication.stockCount == null) {
      return Pill(label: l.supplyNotTracked, background: AppColors.surfaceContainer, foreground: AppColors.onSurfaceVariant);
    }
    if (med.lowStock || (days != null && days <= 7)) {
      return Pill(
        label: days == null ? l.lowSupply : l.daysLeft(days.toString()),
        dot: AppColors.tertiary,
        background: AppColors.tertiaryFixed,
        foreground: AppColors.onTertiaryFixedVariant,
      );
    }
    if (days != null && days <= 30) {
      return Pill(label: l.daysLeft(days.toString()), dot: AppColors.primary, background: AppColors.surfaceContainerHigh, foreground: AppColors.onSurface);
    }
    return Pill(label: l.goodSupply, icon: Symbols.check_circle, background: AppColors.primaryFixed, foreground: AppColors.onPrimaryFixedVariant);
  }
}

class _MedCard extends StatelessWidget {
  const _MedCard({required this.med});
  final MedicationWithSchedules med;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final m = med.medication;
    final firstHour = med.schedules.isEmpty ? null : med.schedules.first.hour;
    final times = med.schedules.map((s) => formatHm(context, s.hour, s.minute)).join(', ');
    final footerIcon = m.prescriberName != null ? Symbols.stethoscope : m.facility != null ? Symbols.local_hospital : Symbols.sync_saved_locally;
    final footer = m.prescriberName != null
        ? '${m.prescriberName}${m.prescriberSpecialty == null ? '' : ' (${m.prescriberSpecialty})'}'
        : m.facility ?? med.condition?.name ?? l.savedOnDevice;
    return SurfaceCard(
      onTap: () => _showQuickSheet(context, med),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconTile(
                icon: formIcon(m.form),
                size: 48,
                iconSize: 28,
                radius: Radii.lg,
                fill: 1,
                background: m.frequency == Frequency.prn ? AppColors.tertiaryFixed : AppColors.surfaceContainerLow,
                foreground: m.frequency == Frequency.prn ? AppColors.tertiaryContainer : AppColors.primary,
              ),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m.displayName, style: AppText.headlineSm, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(firstHour == null ? Symbols.healing : timeIcon(firstHour), size: 15, color: AppColors.primary),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            [
                              l.frequency(m.frequency), if (times.isNotEmpty) times, if (m.mealRelation != MealRelation.any) l.meal(m.mealRelation)
                              ].join(' • '),
                            style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Space.sm),
              SupplyPill(med: med),
            ],
          ),
          const SizedBox(height: Space.sm),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(Radii.md)),
            child: Row(
              children: [
                Icon(footerIcon, size: 16, color: AppColors.onSurfaceVariant),
                const SizedBox(width: 8),
                Expanded(child: Text(footer, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant), overflow: TextOverflow.ellipsis)),
                Text(l.details, style: AppText.labelSm.copyWith(color: AppColors.primary)),
                const Icon(Symbols.chevron_right, size: 16, color: AppColors.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Builds the refill request text and sends it by SMS (to the clinic, when a
/// number is known) or through the share sheet.
Future<void> requestRefill(BuildContext context, WidgetRef ref, MedicationWithSchedules med) async {
  final l = context.l10n;
  final profile = await ref.read(healthRepoProvider).getProfile();
  final m = med.medication;
  final msg = l.refillMessage(
    m.displayName,
    m.rxNumber == null ? '' : ' (Rx ${m.rxNumber})',
    profile?.fullName ?? '',
  );
  final phone = m.prescriberPhone?.trim() ?? '';
  if (phone.isNotEmpty) {
    await openSms(phone, msg);
  } else {
    await SharePlus.instance.share(ShareParams(text: msg, subject: l.refillSubject(m.displayName)));
  }
}

void _showQuickSheet(BuildContext context, MedicationWithSchedules med) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => Consumer(
      builder: (ctx, ref, _) {
        final l = ctx.l10n;
        final m = med.medication;
        final days = med.daysLeft;
        final refillBy = days == null ? null : DateTime.now().add(Duration(days: days));
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(Space.lg, 0, Space.lg, Space.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l.activeRx.toUpperCase(), style: AppText.labelSm.copyWith(color: AppColors.primary)),
                Text(m.displayName, style: AppText.headlineMd),
                Text(
                  [l.frequency(m.frequency), l.meal(m.mealRelation)].join(' • '),
                  style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                ),
                const SizedBox(height: Space.md),
                TwoColumnGrid(
                  gap: Space.sm,
                  children: [
                    _SheetStat(
                      label: l.supplyTracker,
                      value: m.stockCount == null ? '—' : (days == null ? l.doseUnits(m.stockCount!, m.form) : l.daysRemaining(days.toString())),
                      note: refillBy == null ? null : l.refillBy(formatDate(ctx, refillBy)),
                      noteColor: AppColors.tertiary,
                    ),
                    _SheetStat(
                      label: l.prescriber,
                      value: m.prescriberName ?? '—',
                      note: m.prescriberSpecialty ?? m.facility,
                    ),
                  ],
                ),
                if ((m.instructions ?? '').isNotEmpty) ...[
                  const SizedBox(height: Space.sm),
                  Container(
                    padding: const EdgeInsets.all(Space.sm),
                    decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Symbols.info, size: 20, color: AppColors.primary),
                            const SizedBox(width: 8),
                            Text(l.clinicalInstructions, style: AppText.labelMd),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(m.instructions!, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: Space.md),
                AppButton(label: l.requestRefill, icon: Symbols.local_pharmacy, height: 48, onPressed: () => requestRefill(ctx, ref, med)),
                const SizedBox(height: Space.sm),
                AppButton(
                  label: l.openFullDetails,
                  icon: Symbols.open_in_full,
                  tone: ButtonTone.tonal,
                  height: 48,
                  onPressed: () {
                    Navigator.pop(ctx);
                    context.push('/medication/${m.id}');
                  },
                ),
                const SizedBox(height: Space.sm),
                AppButton(
                  label: l.editMedicationDetails,
                  icon: Symbols.edit,
                  tone: ButtonTone.low,
                  height: 48,
                  onPressed: () {
                    Navigator.pop(ctx);
                    ref.read(draftProvider.notifier).start(MedicationDraft.fromExisting(med));
                    context.push('/add/routine');
                  },
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

class _SheetStat extends StatelessWidget {
  const _SheetStat({required this.label, required this.value, this.note, this.noteColor});
  final String label;
  final String value;
  final String? note;
  final Color? noteColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Space.sm),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text(value, style: AppText.headlineSm),
          if (note != null) Text(note!, style: AppText.labelSm.copyWith(color: noteColor ?? AppColors.onSurfaceVariant)),
        ],
      ),
    );
  }
}
