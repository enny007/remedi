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
import '../../data/models/medication_draft.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import 'draft_controller.dart';

class ClinicalDetailsScreen extends ConsumerStatefulWidget {
  const ClinicalDetailsScreen({super.key});

  @override
  ConsumerState<ClinicalDetailsScreen> createState() => _ClinicalDetailsScreenState();
}

class _ClinicalDetailsScreenState extends ConsumerState<ClinicalDetailsScreen> {
  late final MedicationDraft _initial = ref.read(draftProvider);
  late final _condition = TextEditingController(text: _initial.conditionName ?? '');
  late final _facility = TextEditingController(text: _initial.facility ?? '');
  late final _doctor = TextEditingController(text: _initial.prescriberName ?? '');
  late final _specialty = TextEditingController(text: _initial.prescriberSpecialty ?? '');
  late final _phone = TextEditingController(text: _initial.prescriberPhone ?? '');
  late final _instructions = TextEditingController(text: _initial.instructions ?? '');
  late final _pill = TextEditingController(text: _initial.pillDescription ?? '');
  late final _rx = TextEditingController(text: _initial.rxNumber ?? '');
  late final _stock = TextEditingController(text: _initial.stockCount == null ? '' : formatAmount(_initial.stockCount!));
  late final _threshold = TextEditingController(text: formatAmount(_initial.refillThreshold));
  bool _saving = false;

  @override
  void dispose() {
    for (final c in [_condition, _facility, _doctor, _specialty, _phone, _instructions, _pill, _rx, _stock, _threshold]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _t(TextEditingController c) => c.text.trim().isEmpty ? null : c.text.trim();

  void _commit() {
    final stock = double.tryParse(_stock.text.trim());
    ref.read(draftProvider.notifier).update(
      (d) => d.copyWith(
        conditionName: _t(_condition) ?? '',
        facility: _t(_facility),
        prescriberName: _t(_doctor),
        prescriberSpecialty: _t(_specialty),
        prescriberPhone: _t(_phone),
        instructions: _t(_instructions),
        pillDescription: _t(_pill),
        rxNumber: _t(_rx),
        stockCount: stock,
        clearStock: stock == null,
        refillThreshold: double.tryParse(_threshold.text.trim()) ?? 5,
      ),
    );
  }

  Future<void> _attachPhoto() async {
    final path = await ref.read(scanServiceProvider).capture(fromCamera: true).catchError((_) => null);
    if (path != null) ref.read(draftProvider.notifier).update((d) => d.copyWith(prescriptionImagePath: path));
  }

  Future<void> _save() async {
    _commit();
    final d = ref.read(draftProvider);
    final l = context.l10n;
    if (!d.isValid) {
      showToast(context, l.nameStrengthRequired, icon: Symbols.error);
      return;
    }
    setState(() => _saving = true);
    final isNew = d.id == null;
    final id = await ref.read(draftProvider.notifier).save();
    await ref.read(notificationServiceProvider).requestPermissions();
    await ref.read(alarmSyncProvider).resync();
    if (!mounted) return;
    showToast(context, isNew ? l.remindersSet(d.name) : l.changesSaved);
    context.go(isNew ? '/schedule' : '/medication/$id');
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final d = ref.watch(draftProvider);
    final conditions = ref.watch(conditionsProvider).value ?? const [];
    final catalog = findCatalogDrug(d.name);
    final suggested = {...?catalog?.sideEffects, ...symptomKeys}.toList();

    return PopScope(
      onPopInvokedWithResult: (_, _) => _commit(),
      child: Scaffold(
        appBar: RemediHeader(subtitle: l.clinicalDetails, showBack: true),
        body: PageBody(
          spacing: Space.lg,
          bottomPadding: 40,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Symbols.verified_user, fill: 1, color: AppColors.primary, size: 20),
                    const SizedBox(width: 4),
                    Text(l.safeIntakeProtocol.toUpperCase(), style: AppText.labelSm.copyWith(color: AppColors.primary)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(l.clinicalDetailsTitle, style: AppText.displayLgMobile),
                Text(l.clinicalDetailsStep(d.name), style: AppText.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
            SurfaceCard(
              color: AppColors.surfaceContainerHigh,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IconTile(icon: Symbols.hourglass_top, circle: true, iconSize: 20, background: AppColors.primary, foreground: AppColors.onPrimary),
                  const SizedBox(width: Space.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.whyExtraTime, style: AppText.headlineSm.copyWith(color: AppColors.primary)),
                        const SizedBox(height: 4),
                        Text(l.whyExtraTimeBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant, height: 1.5)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _Card(
              icon: Symbols.local_hospital,
              title: l.diagnosedContext,
              children: [
                _Field(
                  label: l.conditionLabel,
                  controller: _condition,
                  hint: l.conditionHint,
                  suggestions: conditions.map((c) => c.name).toList(),
                ),
                _Field(label: l.facilityLabel, controller: _facility, hint: l.facilityHint),
                _Field(label: l.prescriberLabel, controller: _doctor, hint: l.prescriberHint),
                _Field(label: l.specialtyLabel, controller: _specialty, hint: l.specialtyHint),
                _Field(label: l.doctorPhoneLabel, controller: _phone, hint: '+234…', keyboard: TextInputType.phone),
              ],
            ),
            _Card(
              icon: Symbols.medication,
              title: l.prescriptionDetails,
              subtitle: '${d.name} ${d.strength}'.trim(),
              children: [
                _Field(label: l.doctorInstructionsLabel, controller: _instructions, hint: l.doctorInstructionsHint, maxLines: 3),
                _Field(label: l.pillDescriptionLabel, controller: _pill, hint: l.pillDescriptionHint),
                _Field(label: l.rxNumberLabel, controller: _rx, hint: 'RX-…'),
                Text(l.prescriptionBackup, style: AppText.labelMd),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(Space.sm),
                  decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.lg)),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(Radii.md)),
                        clipBehavior: Clip.antiAlias,
                        child: d.prescriptionImagePath != null && File(d.prescriptionImagePath!).existsSync()
                            ? Image.file(File(d.prescriptionImagePath!), fit: BoxFit.cover)
                            : const Icon(Symbols.description, color: AppColors.primary),
                      ),
                      const SizedBox(width: Space.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              d.prescriptionImagePath == null ? l.noPrescriptionPhoto : l.prescriptionSaved,
                              style: AppText.bodySm.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(l.storedOnDevice, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: l.attachPhoto,
                        onPressed: _attachPhoto,
                        icon: Icon(d.prescriptionImagePath == null ? Symbols.add_a_photo : Symbols.restart_alt, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _Card(
              icon: Symbols.inventory_2,
              title: l.supplyTracking,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _Field(
                        label: l.stockLabel(l.doseUnits(2, d.form).split(' ').last),
                        controller: _stock,
                        hint: '30',
                        keyboard: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    const SizedBox(width: Space.sm),
                    Expanded(
                      child: _Field(
                        label: l.refillAlertAt,
                        controller: _threshold,
                        hint: '5',
                        keyboard: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ],
                ),
                Text(l.refillExplainer, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
            _Card(
              icon: Symbols.warning,
              iconColor: AppColors.tertiary,
              title: l.sideEffectWatchlist,
              subtitle: l.sideEffectWatchlistHint(d.name),
              children: [
                TwoColumnGrid(
                  gap: Space.sm,
                  children: [
                    for (final key in suggested)
                      Material(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(Radii.lg),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(Radii.lg),
                          onTap: () {
                            HapticFeedback.selectionClick();
                            ref.read(draftProvider.notifier).toggleSideEffect(key);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(Space.sm),
                            child: Row(
                              children: [
                                Icon(
                                  d.sideEffectWatch.contains(key) ? Symbols.check_box : Symbols.check_box_outline_blank,
                                  fill: d.sideEffectWatch.contains(key) ? 1 : 0,
                                  color: d.sideEffectWatch.contains(key) ? AppColors.primary : AppColors.outline,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(child: Text(l.symptom(key), style: AppText.bodyMd.copyWith(fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Symbols.offline_pin, size: 16, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Flexible(child: Text(l.encryptedLocal, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant))),
                  ],
                ),
                const SizedBox(height: Space.sm),
                AppButton(
                  label: d.id == null ? l.saveMedicineSetReminders : l.saveChanges,
                  icon: Symbols.check_circle,
                  busy: _saving,
                  onPressed: _save,
                ),
                const SizedBox(height: Space.sm),
                AppButton(
                  label: l.backToRoutine,
                  icon: Symbols.arrow_back,
                  tone: ButtonTone.surface,
                  onPressed: () {
                    _commit();
                    context.pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.icon, required this.title, required this.children, this.subtitle, this.iconColor = AppColors.primary});
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color iconColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 22),
              const SizedBox(width: 6),
              Expanded(child: Text(title, style: AppText.headlineSm)),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(subtitle!, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
          ],
          const SizedBox(height: Space.md),
          ...children,
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.controller,
    this.hint,
    this.keyboard,
    this.maxLines = 1,
    this.suggestions = const [],
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final TextInputType? keyboard;
  final int maxLines;
  final List<String> suggestions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label, style: AppText.labelMd),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboard,
            maxLines: maxLines,
            textCapitalization: keyboard == null ? TextCapitalization.sentences : TextCapitalization.none,
            style: AppText.bodyLg,
            decoration: InputDecoration(hintText: hint),
          ),
          if (suggestions.isNotEmpty) ...[
            const SizedBox(height: 6),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final s in suggestions)
                  ActionChip(
                    label: Text(s),
                    labelStyle: AppText.labelSm,
                    visualDensity: VisualDensity.compact,
                    side: BorderSide.none,
                    backgroundColor: AppColors.surfaceContainer,
                    onPressed: () => controller.text = s,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
