import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/labels.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/models/enums.dart';
import '../../providers/providers.dart';
import '../../services/export_service.dart';
import '../../widgets/common.dart';
import '../../widgets/remi.dart';

final clinicalSummaryProvider = FutureProvider.autoDispose<ClinicalSummary>((ref) async {
  final health = ref.read(healthRepoProvider);
  final since = DateTime.now().subtract(const Duration(days: 30));
  final meds = await ref.read(medicationRepoProvider).loadActive();
  final conditions = await ref.read(conditionsProvider.future);
  final symptoms = await ref.read(symptomsProvider.future);
  return ClinicalSummary(
    generatedAt: DateTime.now(),
    profile: await health.getProfile(),
    conditions: conditions,
    medications: meds,
    adherence: await ref.read(doseRepoProvider).adherence(days: 30),
    bloodPressure: await health.vitalsSince(VitalType.bloodPressure, since),
    heartRate: await health.vitalsSince(VitalType.heartRate, since),
    glucose: await health.vitalsSince(VitalType.bloodGlucose, since),
    symptoms: symptoms,
  );
});

class DoctorSummaryScreen extends ConsumerWidget {
  const DoctorSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final summary = ref.watch(clinicalSummaryProvider);
    return Scaffold(
      appBar: RemediHeader(subtitle: l.doctorVisitTitle, showBack: true),
      body: summary.when(
        loading: () => const RemiLoader(),
        error: (e, _) => Center(child: Text('$e')),
        data: (s) => _SummaryBody(s: s),
      ),
    );
  }
}

class _SummaryBody extends ConsumerStatefulWidget {
  const _SummaryBody({required this.s});
  final ClinicalSummary s;

  @override
  ConsumerState<_SummaryBody> createState() => _SummaryBodyState();
}

class _SummaryBodyState extends ConsumerState<_SummaryBody> {
  bool _busy = false;

  Future<void> _pdf({required bool share}) async {
    setState(() => _busy = true);
    try {
      final file = await ref.read(exportServiceProvider).buildPdf(widget.s);
      if (share) {
        await SharePlus.instance.share(ShareParams(files: [XFile(file.path, mimeType: 'application/pdf')], subject: 'Remedi Clinical Summary'));
      } else {
        final bytes = await file.readAsBytes();
        await Printing.layoutPdf(onLayout: (_) async => bytes, name: file.uri.pathSegments.last);
      }
      if (mounted) showToast(context, context.l10n.exportPrepared);
    } catch (e) {
      if (mounted) showToast(context, context.l10n.exportFailed, icon: Symbols.error);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = widget.s;
    final p = s.profile;
    final bp = s.bpAverage;
    final hr = s.heartRateSummary;
    final bpBars = s.bloodPressure.length > 14 ? s.bloodPressure.sublist(s.bloodPressure.length - 14) : s.bloodPressure;

    return PageBody(
      spacing: Space.lg,
      bottomPadding: 40,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Pill(label: l.handoverProtocol, icon: Symbols.verified_user, background: AppColors.secondaryFixed, foreground: AppColors.onSecondaryFixed),
            const SizedBox(height: Space.xs),
            Text(l.summaryTitle, style: AppText.headlineLg),
            Text(l.summarySubtitle, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
          ],
        ),
        SurfaceCard(
          color: AppColors.surfaceContainerLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileAvatar(size: 48),
                  const SizedBox(width: Space.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                [p?.title, p?.fullName].whereType<String>().where((x) => x.isNotEmpty).join(' '),
                                style: AppText.headlineSm,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Pill(label: 'ID: ${s.recordId}'),
                          ],
                        ),
                        Text(
                          [
                            if (s.age != null) l.ageYears(s.age.toString()),
                            if (p?.sex != null) p!.sex!,
                            if (p?.bloodGroup != null) l.bloodGroupValue(p!.bloodGroup!),
                            if (p?.genotype != null) l.genotypeValue(p!.genotype!),
                          ].join(' • '),
                          style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Space.sm),
              Container(
                padding: const EdgeInsets.all(Space.sm),
                decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(Radii.md)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.primaryDiagnoses.toUpperCase(), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                    const SizedBox(height: 4),
                    Text(
                      s.conditions.isEmpty ? l.noneRecorded : s.conditions.map((c) => c.name).join(' & '),
                      style: AppText.bodySm.copyWith(fontWeight: FontWeight.w600),
                    ),
                    if ((p?.allergies ?? '').isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(l.allergiesValue(p!.allergies!), style: AppText.bodySm.copyWith(color: AppColors.error, fontWeight: FontWeight.w600)),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(Space.md),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(Radii.lg), boxShadow: AppColors.raisedShadow),
          child: Column(
            children: [
              Row(
                children: [
                  Pill(label: l.generatedOnDevice, dot: AppColors.primary, background: AppColors.surfaceContainer, foreground: AppColors.onSurfaceVariant),
                  const Spacer(),
                  Text(l.generatedAt(formatTime(context, s.generatedAt)), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
              const SizedBox(height: Space.md),
              Semantics(
                label: l.qrSemantics,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(Radii.lg)),
                  child: QrImageView(
                    data: s.qrData,
                    size: 224,
                    gapless: true,
                    eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: AppColors.onSurface),
                    dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: AppColors.onSurface),
                  ),
                ),
              ),
              const SizedBox(height: Space.sm),
              Text(l.cameraDecodable, style: AppText.headlineSm),
              Text(l.cameraDecodableBody, textAlign: TextAlign.center, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              const SizedBox(height: Space.sm),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: Space.sm,
                  runSpacing: 4,
                  children: [
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Symbols.cloud_off, size: 18, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text(l.zeroInternet, style: AppText.labelSm.copyWith(color: AppColors.primary)),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Symbols.timer, size: 18, color: AppColors.tertiary),
                      const SizedBox(width: 4),
                      Text(l.valid48h, style: AppText.labelSm),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionTitle(l.dossierHighlights, trailing: Text(l.last30Days, style: AppText.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700))),
            const SizedBox(height: Space.sm),
            SurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const IconTile(icon: Symbols.pill, iconSize: 24, background: AppColors.surfaceContainer),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l.regimenAdherence.toUpperCase(), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                            Text(l.percentOnTime((s.adherence.onTimeRate * 100).round().toString()), style: AppText.headlineMd),
                          ],
                        ),
                      ),
                      Pill(
                        label: '${(s.adherence.rate * 100).round()}% ${l.takenShort}',
                        background: AppColors.secondaryFixed,
                        style: AppText.labelSm.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  if (s.medications.isNotEmpty) ...[
                    const SizedBox(height: Space.sm),
                    Wrap(
                      spacing: Space.xs,
                      runSpacing: Space.xs,
                      children: [
                        for (final m in s.medications)
                          Container(
                            width: 104,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(m.medication.name, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant), overflow: TextOverflow.ellipsis),
                                Text(
                                  switch (s.adherence.perMedication[m.medication.id]) {
                                    final a? when a.expected > 0 => '${(a.taken * 100 / a.expected).round()}%',
                                    _ => '—',
                                  },
                                  style: AppText.bodyMd.copyWith(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  m.schedules.isEmpty ? l.freqPrn : l.partOfDay(m.schedules.first.hour),
                                  style: AppText.labelSm.copyWith(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: Space.sm),
            SurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const IconTile(icon: Symbols.vital_signs, iconSize: 24, background: AppColors.surfaceContainer),
                      const SizedBox(width: 10),
                      Expanded(child: Text(l.vitalsCorrelation, style: AppText.headlineSm)),
                    ],
                  ),
                  const SizedBox(height: Space.sm),
                  TwoColumnGrid(
                    gap: Space.sm,
                    children: [
                      _Stat(label: l.bpAverage, value: bp == null ? '—' : '${bp.sys.round()}/${bp.dia.round()}', unit: 'mmHg', note: l.readingsCount(s.bloodPressure.length.toString())),
                      _Stat(
                        label: l.restingHeartRate,
                        value: hr == null ? '—' : hr.avg.round().toString(),
                        unit: 'BPM',
                        note: hr == null ? null : l.bpmRange(hr.min.round().toString(), hr.max.round().toString()),
                      ),
                    ],
                  ),
                  if (bpBars.length >= 3) ...[
                    const SizedBox(height: Space.sm),
                    Container(
                      padding: const EdgeInsets.all(Space.sm),
                      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(l.systolicTrend, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                          const SizedBox(height: 6),
                          SizedBox(
                            height: 44,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                for (final v in bpBars) ...[
                                  Expanded(
                                    child: FractionallySizedBox(
                                      heightFactor: ((v.value - 80) / 100).clamp(0.1, 1.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: v.value < 130 ? AppColors.primary : AppColors.tertiaryFixedDim,
                                          borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: Space.sm),
            SurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(Symbols.chat_bubble, color: AppColors.tertiary, size: 20),
                      const SizedBox(width: 8),
                      Text(l.symptomsNotes, style: AppText.headlineSm),
                    ],
                  ),
                  const SizedBox(height: Space.xs),
                  if (s.symptoms.isEmpty)
                    Text(l.noSymptoms, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant))
                  else
                    Container(
                      padding: const EdgeInsets.all(Space.sm),
                      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
                      child: Text(
                        _symptomSummary(context, s),
                        style: AppText.bodySm.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(Space.sm),
          decoration: BoxDecoration(color: AppColors.inverseSurface, borderRadius: BorderRadius.circular(Radii.lg)),
          child: Row(
            children: [
              const Icon(Symbols.verified, size: 18, color: AppColors.inverseOnSurface),
              const SizedBox(width: 8),
              Expanded(child: Text(l.checksumLabel(s.checksum), style: AppText.labelSm.copyWith(color: AppColors.inverseOnSurface))),
            ],
          ),
        ),
        Column(
          children: [
            AppButton(
              label: l.savePrintPdf,
              icon: Symbols.description,
              textStyle: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700),
              busy: _busy,
              onPressed: () => _pdf(share: false),
            ),
            const SizedBox(height: Space.sm),
            AppButton(
              label: l.shareNearby,
              icon: Symbols.bluetooth_searching,
              tone: ButtonTone.tonal,
              textStyle: AppText.headlineSm.copyWith(fontWeight: FontWeight.w700),
              onPressed: _busy ? null : () => _pdf(share: true),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(Space.sm),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Symbols.shield, size: 18, color: AppColors.primary),
              const SizedBox(width: Space.xs + 2),
              Expanded(child: Text(l.privacyNotice, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant))),
            ],
          ),
        ),
      ],
    );
  }

  String _symptomSummary(BuildContext context, ClinicalSummary s) {
    final l = context.l10n;
    final counts = <String, int>{};
    for (final x in s.symptoms) {
      counts[x.symptom] = (counts[x.symptom] ?? 0) + 1;
    }
    return counts.entries.map((e) => '${l.symptom(e.key)} ×${e.value}').join(' • ');
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value, required this.unit, this.note});
  final String label;
  final String value;
  final String unit;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Space.sm),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
          Text.rich(
            TextSpan(text: value, children: [TextSpan(text: ' $unit', style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant))]),
            style: AppText.headlineMd,
          ),
          if (note != null) Text(note!, style: AppText.labelSm.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}
