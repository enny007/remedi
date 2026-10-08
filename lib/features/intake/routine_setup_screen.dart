import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/models/enums.dart';
import '../../data/models/medication_draft.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import 'draft_controller.dart';
import 'medicine_edit_sheet.dart';

class RoutineSetupScreen extends ConsumerStatefulWidget {
  const RoutineSetupScreen({super.key});

  @override
  ConsumerState<RoutineSetupScreen> createState() => _RoutineSetupScreenState();
}

class _RoutineSetupScreenState extends ConsumerState<RoutineSetupScreen> {
  bool _saving = false;

  Future<void> _save() async {
    final l = context.l10n;
    final d = ref.read(draftProvider);
    if (!d.isValid) {
      await _edit();
      return;
    }
    if (d.frequency != Frequency.prn && d.times.isEmpty) {
      showToast(context, l.addAtLeastOneTime, icon: Symbols.error);
      return;
    }
    setState(() => _saving = true);
    final isNew = d.id == null;
    final id = await ref.read(draftProvider.notifier).save();
    await ref.read(notificationServiceProvider).requestPermissions();
    await ref.read(alarmSyncProvider).resync();
    if (!mounted) return;
    showToast(context, isNew ? l.remindersSet(d.name) : l.changesSaved);
    if (isNew) {
      context.go('/schedule');
    } else {
      context.go('/medication/$id');
    }
  }

  Future<void> _edit() async {
    final d = ref.read(draftProvider);
    final edited = await showMedicineEditSheet(context, d);
    if (edited != null) ref.read(draftProvider.notifier).start(edited);
  }

  Future<void> _pickTime(int index, DraftTime t) async {
    final picked = await showTimePicker(context: context, initialTime: TimeOfDay(hour: t.hour, minute: t.minute));
    if (picked != null) ref.read(draftProvider.notifier).setTime(index, picked.hour, picked.minute);
  }

  Future<void> _addTime() async {
    final picked = await showTimePicker(context: context, initialTime: const TimeOfDay(hour: 12, minute: 0));
    if (picked != null) ref.read(draftProvider.notifier).addTime(picked.hour, picked.minute);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final d = ref.watch(draftProvider);
    final ctrl = ref.read(draftProvider.notifier);
    final editing = d.id != null;

    return Scaffold(
      appBar: RemediHeader(subtitle: editing ? l.editRoutine : l.addMedicine, showBack: true),
      body: PageBody(
        spacing: Space.lg,
        bottomPadding: 40,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StepPill(label: l.stepScheduleFood),
              const SizedBox(height: Space.sm),
              SurfaceCard(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    IconTile(icon: formIcon(d.form), size: 44, iconSize: 26, fill: 1, background: AppColors.surfaceContainer),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d.name.isEmpty ? l.unnamedMedicine : d.name, style: AppText.headlineSm, overflow: TextOverflow.ellipsis),
                          Text(
                            [if (d.strength.isNotEmpty) d.strength, l.doseForm(d.form)].join(' • '),
                            style: AppText.labelMd.copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                    TextButton(onPressed: _edit, child: Text(l.edit)),
                  ],
                ),
              ),
            ],
          ),
          _Section(
            title: l.howOften,
            hint: l.tapToSelect,
            child: TwoColumnGrid(
              children: [
                for (final f in Frequency.values)
                  ChoiceTile(
                    selected: d.frequency == f,
                    title: l.frequency(f),
                    subtitle: l.frequencyHint(f),
                    icon: switch (f) {
                      Frequency.once => Symbols.wb_sunny,
                      Frequency.twice => Symbols.wb_twilight,
                      Frequency.thrice => Symbols.repeat,
                      Frequency.prn => Symbols.healing,
                    },
                    onTap: () => ctrl.setFrequency(f),
                  ),
              ],
            ),
          ),
          _Section(
            title: l.foodRoutine,
            hint: l.preventsNausea,
            hintColor: AppColors.primary,
            child: TwoColumnGrid(
              children: [
                for (final m in MealRelation.values)
                  ChoiceTile(
                    selected: d.meal == m,
                    title: l.meal(m),
                    subtitle: l.mealHint(m),
                    icon: mealIcon(m),
                    minHeight: 92,
                    selectedColor: AppColors.primaryContainer,
                    onTap: () => ctrl.update((x) => x.copyWith(meal: m)),
                  ),
              ],
            ),
          ),
          if (d.frequency == Frequency.prn)
            SurfaceCard(
              color: AppColors.surfaceContainerLow,
              child: Row(
                children: [
                  const Icon(Symbols.info, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Expanded(child: Text(l.prnNoReminders, style: AppText.bodySm)),
                ],
              ),
            )
          else
            _Section(
              title: l.reminderTimes,
              hint: l.basedOnRoutine,
              child: Column(
                children: [
                  for (var i = 0; i < d.times.length; i++) ...[
                    _TimeRow(
                      index: i,
                      time: d.times[i],
                      form: d.form,
                      onPickTime: () => _pickTime(i, d.times[i]),
                      onAmount: (a) => ctrl.setAmount(i, a),
                      onRemove: d.times.length > 1 ? () => ctrl.removeTime(i) : null,
                    ),
                    const SizedBox(height: 10),
                  ],
                  AppButton(label: l.addReminderTime, icon: Symbols.add_alarm, tone: ButtonTone.low, height: 48, onPressed: _addTime),
                ],
              ),
            ),
          SurfaceCard(
            color: AppColors.surfaceContainerLow,
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Symbols.verified_user, color: AppColors.primary, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l.offlineAlarmsTitle, style: AppText.labelLg),
                      Text(l.offlineAlarmsBody, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              AppButton(
                label: editing ? l.saveChanges : l.saveSetReminders,
                trailingIcon: Symbols.check,
                textStyle: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700),
                busy: _saving,
                onPressed: _save,
              ),
              const SizedBox(height: Space.sm),
              TextButton(
                onPressed: () => context.push('/add/details'),
                style: TextButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                child: Text.rich(
                  TextSpan(
                    text: l.moreClinicalDetails,
                    style: AppText.labelLg.copyWith(color: AppColors.onSurfaceVariant),
                    children: [
                      TextSpan(text: '  ${l.moreClinicalDetailsHint}', style: AppText.labelSm.copyWith(color: AppColors.secondary)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepPill extends StatelessWidget {
  const _StepPill({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(999), boxShadow: AppColors.cardShadow),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _dot(8, AppColors.primary),
          const SizedBox(width: 4),
          _dot(16, AppColors.primary),
          const SizedBox(width: 4),
          _dot(8, AppColors.surfaceVariant),
          const SizedBox(width: 8),
          Text(label.toUpperCase(), style: AppText.labelMd.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _dot(double w, Color c) => Container(width: w, height: 8, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(999)));
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child, this.hint, this.hintColor});
  final String title;
  final String? hint;
  final Color? hintColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: AppText.headlineSm)),
            if (hint != null)
              Text(hint!, style: AppText.labelSm.copyWith(color: hintColor ?? AppColors.onSurfaceVariant, fontWeight: hintColor != null ? FontWeight.w700 : null)),
          ],
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow({
    required this.index,
    required this.time,
    required this.form,
    required this.onPickTime,
    required this.onAmount,
    this.onRemove,
  });

  final int index;
  final DraftTime time;
  final DoseForm form;
  final VoidCallback onPickTime;
  final ValueChanged<double> onAmount;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final night = time.hour >= 17 || time.hour < 5;
    return SurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          IconTile(
            icon: timeIcon(time.hour),
            circle: true,
            fill: 1,
            iconSize: 20,
            background: night ? AppColors.surfaceContainer : AppColors.secondaryContainer,
            foreground: night ? AppColors.primary : AppColors.onSecondaryContainer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: InkWell(
              onTap: onPickTime,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.doseSlotLabel((index + 1).toString(), l.slot(time.slot)).toUpperCase(),
                    style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  Text(formatHm(context, time.hour, time.minute), style: AppText.headlineMd.copyWith(fontWeight: FontWeight.w800)),
                ],
              ),
            ),
          ),
          _SquareButton(icon: Symbols.schedule, tooltip: l.adjustTime, onTap: onPickTime),
          const SizedBox(width: 6),
          PopupMenuButton<double>(
            tooltip: l.doseAmount,
            onSelected: onAmount,
            itemBuilder: (_) => [
              for (final a in const [0.5, 1.0, 1.5, 2.0, 3.0, 5.0, 10.0]) PopupMenuItem(value: a, child: Text(l.doseUnits(a, form))),
            ],
            child: Container(
              constraints: const BoxConstraints(minHeight: 44),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l.doseUnits(time.amount, form), style: AppText.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
                  const Icon(Symbols.expand_more, size: 16, color: AppColors.onSurfaceVariant),
                ],
              ),
            ),
          ),
          if (onRemove != null)
            IconButton(
              tooltip: l.removeTime,
              onPressed: onRemove,
              icon: const Icon(Symbols.close, size: 18, color: AppColors.outline),
            ),
        ],
      ),
    );
  }
}

class _SquareButton extends StatelessWidget {
  const _SquareButton({required this.icon, required this.tooltip, required this.onTap});
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(Radii.md),
        child: InkWell(
          borderRadius: BorderRadius.circular(Radii.md),
          onTap: onTap,
          child: SizedBox(width: 44, height: 44, child: Icon(icon, size: 20, color: AppColors.primary)),
        ),
      ),
    );
  }
}
