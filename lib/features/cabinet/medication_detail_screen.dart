import 'dart:io';

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
import '../../data/models/dose_occurrence.dart';
import '../../data/models/enums.dart';
import '../../data/models/medication_draft.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import '../../widgets/remi.dart';
import '../common/care_actions.dart';
import '../intake/draft_controller.dart';
import 'cabinet_screen.dart';

class MedicationDetailScreen extends ConsumerWidget {
  const MedicationDetailScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final async = ref.watch(medicationProvider(id));
    return Scaffold(
      appBar: RemediHeader(subtitle: l.medicationDetail, showBack: true),
      body: async.when(
        loading: () => const RemiLoader(),
        error: (e, _) => Center(child: Text('$e')),
        data: (med) => med == null
            ? EmptyState(icon: Symbols.medication, title: l.medicineNotFound, body: l.doseNotFoundBody)
            : _Detail(med: med),
      ),
    );
  }
}

class _Detail extends ConsumerWidget {
  const _Detail({required this.med});
  final MedicationWithSchedules med;

  Future<void> _logNow(BuildContext context, WidgetRef ref) async {
    final l = context.l10n;
    final m = med.medication;
    final today = await ref.read(doseRepoProvider).occurrencesForDay(DateTime.now());
    final now = DateTime.now();
    final pending = today
        .where((o) => o.medication.id == m.id && o.log == null && o.scheduledAt.difference(now).inMinutes < 120)
        .toList();
    if (pending.isNotEmpty) {
      await ref.read(doseActionsProvider).markTaken(pending.first);
    } else {
      await ref.read(doseActionsProvider).takeAsNeeded(m);
    }
    HapticFeedback.mediumImpact();
    if (context.mounted) showToast(context, l.toastDoseLogged(m.name), icon: Symbols.task_alt);
  }

  Future<void> _adjustStock(BuildContext context, WidgetRef ref) async {
    final l = context.l10n;
    final m = med.medication;
    final c = TextEditingController(text: m.stockCount == null ? '' : formatAmount(m.stockCount!));
    final result = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.updateStock),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.updateStockHint, style: AppText.bodySm),
            const SizedBox(height: Space.md),
            TextField(
              controller: c,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(suffixText: l.doseUnits(2, m.form).split(' ').last),
            ),
            const SizedBox(height: Space.sm),
            Wrap(
              spacing: 6,
              children: [
                for (final add in const [14, 28, 30, 60])
                  ActionChip(
                    label: Text('+$add'),
                    side: BorderSide.none,
                    backgroundColor: AppColors.surfaceContainer,
                    onPressed: () => c.text = formatAmount((double.tryParse(c.text) ?? 0) + add),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(MaterialLocalizations.of(ctx).cancelButtonLabel)),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(88, 44)),
            onPressed: () => Navigator.pop(ctx, double.tryParse(c.text.trim())),
            child: Text(l.save),
          ),
        ],
      ),
    );
    if (result != null) {
      await ref.read(medicationRepoProvider).setStock(m.id, result);
      if (context.mounted) showToast(context, l.stockUpdated);
    }
  }

  Future<void> _stop(BuildContext context, WidgetRef ref) async {
    final l = context.l10n;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.stopMedicineTitle(med.medication.name)),
        content: Text(l.stopMedicineBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(MaterialLocalizations.of(ctx).cancelButtonLabel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.error, minimumSize: const Size(88, 44)),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.stopMedicine),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await ref.read(medicationRepoProvider).archive(med.medication.id);
    await ref.read(alarmSyncProvider).resync();
    if (context.mounted) {
      showToast(context, l.medicineStopped(med.medication.name));
      context.go('/meds');
    }
  }

  void _edit(BuildContext context, WidgetRef ref) {
    ref.read(draftProvider.notifier).start(MedicationDraft.fromExisting(med));
    context.push('/add/routine');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final m = med.medication;
    final catalog = findCatalogDrug(m.name);
    final others = (ref.watch(activeMedicationsProvider).value ?? const [])
        .where((x) => x.medication.id != m.id)
        .map((x) => x.medication.name)
        .toList();
    final interactions = interactionsFor(m.name, others);
    final profile = ref.watch(profileProvider).value;
    final dailyUnits = med.dailyUnits;
    final mgPerDay = _mgPerDay(m.strength, dailyUnits);

    return PageBody(
      bottomPadding: 40,
      children: [
        Row(
          children: [
            TextButton.icon(
              onPressed: () => context.canPop() ? context.pop() : context.go('/meds'),
              style: TextButton.styleFrom(backgroundColor: AppColors.surfaceContainer, minimumSize: const Size(0, 44)),
              icon: const Icon(Symbols.arrow_back, size: 18),
              label: Text(l.backToCabinet, style: AppText.labelMd),
            ),
            const Spacer(),
            Pill(label: l.encryptedLocalRecord, icon: Symbols.offline_pin, background: AppColors.secondaryFixed),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(m.displayName, style: AppText.headlineLg.copyWith(fontWeight: FontWeight.w800)),
                Pill(
                  label: l.activeRx.toUpperCase(),
                  background: AppColors.primaryFixed,
                  foreground: AppColors.onPrimaryFixed,
                  style: AppText.labelSm.copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Text(
              [l.doseForm(m.form), m.drugClass ?? catalog?.drugClass].whereType<String>().join(' • '),
              style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        // Supply card
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  _PillVisual(form: m.form, label: m.strength),
                  const SizedBox(width: Space.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.remainingSupply.toUpperCase(), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w700)),
                        Text.rich(
                          TextSpan(
                            text: m.stockCount == null ? l.notTracked : l.doseUnits(m.stockCount!, m.form),
                            children: [
                              if (med.daysLeft != null)
                                TextSpan(text: '  (${l.daysLeft(med.daysLeft.toString())})', style: AppText.bodySm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
                            ],
                          ),
                          style: AppText.headlineMd.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: LinearProgressIndicator(
                            value: m.stockCount == null || dailyUnits == 0 ? 0 : (m.stockCount! / (dailyUnits * 30)).clamp(0, 1),
                            minHeight: 10,
                            backgroundColor: AppColors.surfaceContainerHigh,
                            color: med.lowStock ? AppColors.tertiaryContainer : AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        InkWell(
                          onTap: () => _adjustStock(context, ref),
                          child: Row(
                            children: [
                              const Icon(Symbols.edit, size: 16, color: AppColors.primary),
                              const SizedBox(width: 4),
                              Text(l.updateStock, style: AppText.labelSm.copyWith(color: AppColors.primary)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (m.pillDescription != null || m.prescriptionImagePath != null) ...[
                const SizedBox(height: Space.md),
                Row(
                  children: [
                    if (m.prescriptionImagePath != null && File(m.prescriptionImagePath!).existsSync()) ...[
                      GestureDetector(
                        onTap: () => _viewImage(context, m.prescriptionImagePath!),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Radii.md),
                          child: Image.file(File(m.prescriptionImagePath!), width: 112, height: 64, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: Space.sm),
                    ],
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(Radii.md)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Symbols.shield, size: 14, color: AppColors.primary),
                                const SizedBox(width: 4),
                                Text(l.pillIdentifier, style: AppText.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
                              ],
                            ),
                            Text(m.pillDescription ?? l.seePrescriptionPhoto, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant), maxLines: 2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        // Routine card
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const IconTile(icon: Symbols.alarm, size: 32, iconSize: 18, circle: true, background: AppColors.primaryContainer, foreground: AppColors.onPrimary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.dosageRoutine, style: AppText.headlineSm.copyWith(fontWeight: FontWeight.w800)),
                        Text(
                          '${l.frequency(m.frequency)} • ${l.perIntake(l.doseUnits(m.doseAmount, m.form))}',
                          style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                  if (mgPerDay != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.secondaryFixed, borderRadius: BorderRadius.circular(6)),
                      child: Text(l.perDay(mgPerDay), style: AppText.labelSm.copyWith(color: AppColors.onSecondaryFixed, fontWeight: FontWeight.w700)),
                    ),
                ],
              ),
              const SizedBox(height: Space.md),
              if (med.schedules.isEmpty)
                Text(l.prnNoReminders, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant))
              else
                TwoColumnGrid(
                  gap: Space.sm,
                  children: [
                    for (final s in med.schedules)
                      Container(
                        constraints: const BoxConstraints(minHeight: 104),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(Radii.lg)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(timeIcon(s.hour), size: 18, color: AppColors.primary),
                                const SizedBox(width: 6),
                                Expanded(child: Text(l.partOfDay(s.hour).toUpperCase(), style: AppText.labelMd.copyWith(color: AppColors.primary))),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(formatHm(context, s.hour, s.minute), style: AppText.headlineSm.copyWith(fontWeight: FontWeight.w800)),
                            Text(
                              '${l.slot(s.slot)} • ${l.doseUnits(s.doseAmount, m.form)}',
                              style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w500),
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
                      Icon(mealIcon(m.mealRelation), size: 20, color: AppColors.primary),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          [if (m.mealRelation != MealRelation.any) '${l.meal(m.mealRelation)}: ${l.mealHint(m.mealRelation)}.', m.instructions].whereType<String>().join(' '),
                          style: AppText.bodySm.copyWith(fontWeight: FontWeight.w600, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        // Safety card
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const IconTile(icon: Symbols.verified_user, size: 32, iconSize: 18, circle: true, background: AppColors.secondaryContainer, foreground: AppColors.onSecondaryContainer),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.safetyInteractions, style: AppText.headlineSm.copyWith(fontWeight: FontWeight.w800)),
                        Text(l.offlineSafetyDb, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Space.md),
              if (interactions.isEmpty)
                _SafetyRow(
                  icon: Symbols.check_circle,
                  iconColor: AppColors.primary,
                  title: catalog == null ? l.notInReference : l.noKnownClash,
                  body: others.isEmpty ? l.noOtherMeds : l.checkedAgainst(others.join(', ')),
                  badge: catalog == null ? null : l.checked,
                  background: AppColors.surfaceContainer,
                )
              else
                for (final hit in interactions) ...[
                  _SafetyRow(
                    icon: Symbols.warning,
                    iconColor: hit.interaction.severe ? AppColors.error : AppColors.tertiary,
                    title: l.interactionWith(hit.other),
                    body: hit.interaction.note,
                    badge: hit.interaction.severe ? l.askDoctor : l.caution,
                    background: hit.interaction.severe ? AppColors.errorContainer : AppColors.tertiaryFixed,
                  ),
                  const SizedBox(height: Space.sm),
                ],
              if (catalog?.dietWarning != null) ...[
                const SizedBox(height: Space.sm),
                _SafetyRow(icon: Symbols.no_drinks, iconColor: AppColors.tertiary, title: l.dietWarning, body: catalog!.dietWarning!),
              ],
              const SizedBox(height: Space.sm),
              _SafetyRow(
                icon: Symbols.help,
                iconColor: AppColors.primary,
                title: l.missedDoseTitle,
                body: catalog?.missedDose ?? l.missedDoseGeneric,
              ),
              if (catalog != null) ...[
                const SizedBox(height: Space.sm),
                _SafetyRow(icon: Symbols.inventory_2, iconColor: AppColors.primary, title: l.storageUse, body: catalog.storage),
              ],
              const SizedBox(height: Space.sm),
              Text(l.referenceDisclaimer, style: AppText.labelSm.copyWith(color: AppColors.outline, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        // Prescriber card
        SurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(child: Text(l.prescriptionOrigin.toUpperCase(), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w700))),
                  if (m.rxNumber != null) Text('Rx #${m.rxNumber}', style: AppText.labelSm.copyWith(color: AppColors.primary, fontFamily: 'monospace')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.surfaceContainerHigh,
                    child: Text(
                      _initials(m.prescriberName ?? '?'),
                      style: AppText.headlineSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(m.prescriberName ?? l.prescriberUnknown, style: AppText.labelLg),
                        if (m.prescriberSpecialty != null || m.facility != null || med.condition != null)
                          Text(
                            [m.prescriberSpecialty, m.facility, med.condition?.name].whereType<String>().join(' • '),
                            style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                          ),
                      ],
                    ),
                  ),
                  if ((m.prescriberPhone ?? '').isNotEmpty)
                    IconButton.filledTonal(
                      tooltip: l.callClinic,
                      style: IconButton.styleFrom(backgroundColor: AppColors.surfaceContainer, minimumSize: const Size(44, 44)),
                      onPressed: () => openDialer(m.prescriberPhone!),
                      icon: const Icon(Symbols.call, color: AppColors.primary, size: 20),
                    )
                  else
                    TextButton(onPressed: () => _edit(context, ref), child: Text(l.add)),
                ],
              ),
              if ((profile?.caregiverPhone ?? '').isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(Radii.md)),
                  child: Row(
                    children: [
                      const Icon(Symbols.contact_phone, color: AppColors.primary, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l.emergencyResponder.toUpperCase(), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w700)),
                            Text(
                              [profile!.caregiverName, if (profile.caregiverRelation != null) '(${profile.caregiverRelation})'].whereType<String>().join(' '),
                              style: AppText.labelMd,
                            ),
                          ],
                        ),
                      ),
                      Pill(label: l.smsLinked, background: AppColors.secondaryFixed, foreground: AppColors.onSecondaryFixed),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        AppButton(label: l.logDoseNow(l.doseUnits(m.doseAmount, m.form)), icon: Symbols.check_circle, onPressed: () => _logNow(context, ref)),
        TwoColumnGrid(
          gap: Space.sm,
          children: [
            AppButton(label: l.refillSms, icon: Symbols.sms, tone: ButtonTone.surface, height: 48, onPressed: () => requestRefill(context, ref, med)),
            AppButton(label: l.editRoutineBtn, icon: Symbols.edit_calendar, tone: ButtonTone.surface, height: 48, onPressed: () => _edit(context, ref)),
            AppButton(label: l.logSideEffect, icon: Symbols.sick, tone: ButtonTone.surface, height: 48, onPressed: () => showSymptomSheet(context, ref, medication: m)),
            AppButton(label: l.stopMedicine, icon: Symbols.do_not_disturb_on, tone: ButtonTone.danger, height: 48, onPressed: () => _stop(context, ref)),
          ],
        ),
      ],
    );
  }

  static String _initials(String name) {
    final parts = name.replaceAll(RegExp(r'^(Dr\.?|Prof\.?)\s+', caseSensitive: false), '').trim().split(RegExp(r'\s+'));
    return parts.where((p) => p.isNotEmpty).take(2).map((p) => p[0].toUpperCase()).join();
  }

  /// "1000 mg/day" when the strength is a simple mg/mcg value.
  static String? _mgPerDay(String strength, double units) {
    final m = RegExp(r'^\s*(\d+(?:\.\d+)?)\s*(mg|mcg|g|iu)\s*$', caseSensitive: false).firstMatch(strength);
    if (m == null || units <= 0) return null;
    final total = double.parse(m.group(1)!) * units;
    return '${formatAmount(total)} ${m.group(2)!.toLowerCase()}';
  }

  void _viewImage(BuildContext context, String path) {
    showDialog<void>(
      context: context,
      builder: (ctx) => Dialog(
        clipBehavior: Clip.antiAlias,
        child: InteractiveViewer(child: Image.file(File(path))),
      ),
    );
  }
}

class _PillVisual extends StatelessWidget {
  const _PillVisual({required this.form, required this.label});
  final DoseForm form;
  final String label;

  @override
  Widget build(BuildContext context) {
    final isRoundish = form == DoseForm.tablet || form == DoseForm.caplet || form == DoseForm.capsule || form == DoseForm.softgel;
    return Container(
      width: 112,
      height: 80,
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.lg)),
      alignment: Alignment.center,
      child: isRoundish
          ? Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
                boxShadow: const [BoxShadow(color: Color(0x220F172A), blurRadius: 6, offset: Offset(0, 2))],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 1, color: const Color(0xFFCBD5E1)),
                  Text(
                    label.replaceAll(' ', ''),
                    style: AppText.labelSm.copyWith(color: const Color(0xFF94A3B8), fontWeight: FontWeight.w800, fontSize: 10),
                  ),
                ],
              ),
            )
          : Icon(formIcon(form), size: 40, color: AppColors.primary, fill: 1),
    );
  }
}

class _SafetyRow extends StatelessWidget {
  const _SafetyRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.body,
    this.badge,
    this.background = AppColors.surfaceContainerLow,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String body;
  final String? badge;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(Radii.md)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.labelLg),
                const SizedBox(height: 2),
                Text(body, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          if (badge != null) ...[
            const SizedBox(width: 8),
            Pill(label: badge!, background: iconColor, foreground: Colors.white),
          ],
        ],
      ),
    );
  }
}
