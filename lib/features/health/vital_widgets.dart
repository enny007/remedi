import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/enums.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';

enum BpCategory { normal, elevated, stage1, stage2, crisis }

/// ACC/AHA adult blood pressure categories.
BpCategory classifyBp(double sys, double dia) {
  if (sys > 180 || dia > 120) return BpCategory.crisis;
  if (sys >= 140 || dia >= 90) return BpCategory.stage2;
  if (sys >= 130 || dia >= 80) return BpCategory.stage1;
  if (sys >= 120) return BpCategory.elevated;
  return BpCategory.normal;
}

extension BpLabel on AppLocalizations {
  String bpCategory(BpCategory c) => switch (c) {
    BpCategory.normal => bpNormal,
    BpCategory.elevated => bpElevated,
    BpCategory.stage1 => bpStage1,
    BpCategory.stage2 => bpStage2,
    BpCategory.crisis => bpCrisis,
  };
}

Color bpColor(BpCategory c) => switch (c) {
  BpCategory.normal => AppColors.primary,
  BpCategory.elevated => AppColors.primaryContainer,
  BpCategory.stage1 => AppColors.tertiary,
  BpCategory.stage2 || BpCategory.crisis => AppColors.error,
};

Future<void> showLogVitalSheet(BuildContext context, {VitalType initial = VitalType.bloodPressure}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _LogVitalSheet(initial: initial),
  );
}

class _LogVitalSheet extends ConsumerStatefulWidget {
  const _LogVitalSheet({required this.initial});
  final VitalType initial;

  @override
  ConsumerState<_LogVitalSheet> createState() => _LogVitalSheetState();
}

class _LogVitalSheetState extends ConsumerState<_LogVitalSheet> {
  late VitalType _type = widget.initial;
  final _a = TextEditingController();
  final _b = TextEditingController();
  bool _mmol = false;

  @override
  void dispose() {
    _a.dispose();
    _b.dispose();
    super.dispose();
  }

  String? _error(AppLocalizations l) {
    final a = double.tryParse(_a.text.trim());
    final b = double.tryParse(_b.text.trim());
    switch (_type) {
      case VitalType.bloodPressure:
        if (a == null || b == null) return l.enterBothValues;
        if (a < 60 || a > 260 || b < 30 || b > 160 || b >= a) return l.valueLooksWrong;
      case VitalType.bloodGlucose:
        if (a == null) return l.enterValue;
        final mg = _mmol ? a * 18 : a;
        if (mg < 20 || mg > 700) return l.valueLooksWrong;
      case VitalType.heartRate:
        if (a == null) return l.enterValue;
        if (a < 25 || a > 250) return l.valueLooksWrong;
      case VitalType.weight:
        if (a == null) return l.enterValue;
        if (a < 2 || a > 400) return l.valueLooksWrong;
      case VitalType.steps:
        if (a == null) return l.enterValue;
    }
    return null;
  }

  Future<void> _save() async {
    final l = context.l10n;
    final err = _error(l);
    if (err != null) {
      showToast(context, err, icon: Symbols.error);
      return;
    }
    final a = double.parse(_a.text.trim());
    final repo = ref.read(healthRepoProvider);
    switch (_type) {
      case VitalType.bloodPressure:
        await repo.addVital(type: _type, value: a, value2: double.parse(_b.text.trim()), unit: 'mmHg');
      case VitalType.bloodGlucose:
        await repo.addVital(type: _type, value: _mmol ? a * 18 : a, unit: 'mg/dL');
      case VitalType.heartRate:
        await repo.addVital(type: _type, value: a, unit: 'bpm');
      case VitalType.weight:
        await repo.addVital(type: _type, value: a, unit: 'kg');
      case VitalType.steps:
        await repo.addVital(type: _type, value: a, unit: 'steps');
    }
    if (!mounted) return;
    Navigator.pop(context);
    if (_type == VitalType.bloodPressure) {
      final cat = classifyBp(a, double.parse(_b.text.trim()));
      showToast(context, cat == BpCategory.crisis ? l.bpCrisisAdvice : l.vitalSaved, icon: cat == BpCategory.crisis ? Symbols.emergency : Symbols.check_circle);
    } else {
      showToast(context, l.vitalSaved);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final types = [VitalType.bloodPressure, VitalType.bloodGlucose, VitalType.heartRate, VitalType.weight];
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(Space.margin, 0, Space.margin, Space.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l.logVitalTitle, style: AppText.headlineMd),
              const SizedBox(height: Space.md),
              Wrap(
                spacing: Space.sm,
                runSpacing: Space.sm,
                children: [
                  for (final t in types)
                    ChoiceChip(
                      selected: _type == t,
                      showCheckmark: false,
                      label: Text(vitalName(l, t)),
                      labelStyle: AppText.labelMd.copyWith(color: _type == t ? AppColors.onPrimary : AppColors.onSurface),
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.surfaceContainerLow,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                      onSelected: (_) => setState(() {
                        _type = t;
                        _a.clear();
                        _b.clear();
                      }),
                    ),
                ],
              ),
              const SizedBox(height: Space.lg),
              if (_type == VitalType.bloodPressure)
                Row(
                  children: [
                    Expanded(child: _NumField(controller: _a, label: l.systolic, suffix: 'mmHg', autofocus: true)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('/', style: AppText.displayLgMobile.copyWith(color: AppColors.outline)),
                    ),
                    Expanded(child: _NumField(controller: _b, label: l.diastolic, suffix: 'mmHg')),
                  ],
                )
              else
                _NumField(
                  controller: _a,
                  autofocus: true,
                  label: vitalName(l, _type),
                  suffix: switch (_type) {
                    VitalType.bloodGlucose => _mmol ? 'mmol/L' : 'mg/dL',
                    VitalType.heartRate => 'bpm',
                    VitalType.weight => 'kg',
                    _ => '',
                  },
                ),
              if (_type == VitalType.bloodGlucose) ...[
                const SizedBox(height: Space.sm),
                SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: false, label: Text('mg/dL')),
                    ButtonSegment(value: true, label: Text('mmol/L')),
                  ],
                  selected: {_mmol},
                  onSelectionChanged: (s) => setState(() => _mmol = s.first),
                ),
              ],
              const SizedBox(height: Space.lg),
              AppButton(label: l.saveReading, icon: Symbols.check, onPressed: _save),
            ],
          ),
        ),
      ),
    );
  }
}

String vitalName(AppLocalizations l, VitalType t) => switch (t) {
  VitalType.bloodPressure => l.bloodPressure,
  VitalType.bloodGlucose => l.bloodSugar,
  VitalType.heartRate => l.heartRate,
  VitalType.weight => l.weight,
  VitalType.steps => l.steps,
};

class _NumField extends StatelessWidget {
  const _NumField({required this.controller, required this.label, required this.suffix, this.autofocus = false});
  final TextEditingController controller;
  final String label;
  final String suffix;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      style: AppText.headlineMd,
      decoration: InputDecoration(labelText: label, suffixText: suffix),
    );
  }
}

/// Minimal line sparkline for vitals trends.
class Sparkline extends StatelessWidget {
  const Sparkline({super.key, required this.values, this.color = AppColors.primary, this.height = 48});
  final List<double> values;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(painter: _SparkPainter(values, color)),
    );
  }
}

class _SparkPainter extends CustomPainter {
  _SparkPainter(this.values, this.color);
  final List<double> values;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;
    final min = values.reduce((a, b) => a < b ? a : b);
    final max = values.reduce((a, b) => a > b ? a : b);
    final range = (max - min).abs() < 1e-6 ? 1.0 : max - min;
    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = size.width * i / (values.length - 1);
      final y = size.height - 4 - (size.height - 8) * (values[i] - min) / range;
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }
    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.18), color.withValues(alpha: 0)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
    final last = Offset(size.width, size.height - 4 - (size.height - 8) * (values.last - min) / range);
    canvas.drawCircle(last, 3.5, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_SparkPainter old) => old.values != values;
}
