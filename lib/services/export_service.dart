import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../core/utils/time_utils.dart';
import '../data/catalog/drug_catalog.dart';
import '../data/db/app_database.dart';
import '../data/models/dose_occurrence.dart';
import '../data/models/medication_draft.dart';
import '../data/repositories/dose_repository.dart';

/// Everything a clinician needs at a handover, built entirely from local data.
class ClinicalSummary {
  ClinicalSummary({
    required this.generatedAt,
    required this.profile,
    required this.conditions,
    required this.medications,
    required this.adherence,
    required this.bloodPressure,
    required this.heartRate,
    required this.glucose,
    required this.symptoms,
  });

  final DateTime generatedAt;
  final Profile? profile;
  final List<Condition> conditions;
  final List<MedicationWithSchedules> medications;
  final AdherenceStats adherence;
  final List<Vital> bloodPressure;
  final List<Vital> heartRate;
  final List<Vital> glucose;
  final List<SymptomLog> symptoms;

  int? get age {
    final dob = profile?.dateOfBirth;
    if (dob == null) return null;
    final now = generatedAt;
    var a = now.year - dob.year;
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) a--;
    return a;
  }

  ({double sys, double dia})? get bpAverage {
    final withDia = bloodPressure.where((v) => v.value2 != null).toList();
    if (withDia.isEmpty) return null;
    final sys = withDia.map((v) => v.value).reduce((a, b) => a + b) / withDia.length;
    final dia = withDia.map((v) => v.value2!).reduce((a, b) => a + b) / withDia.length;
    return (sys: sys, dia: dia);
  }

  ({double avg, double min, double max})? get heartRateSummary {
    if (heartRate.isEmpty) return null;
    final vals = heartRate.map((v) => v.value).toList();
    return (
      avg: vals.reduce((a, b) => a + b) / vals.length,
      min: vals.reduce((a, b) => a < b ? a : b),
      max: vals.reduce((a, b) => a > b ? a : b),
    );
  }

  String get recordId {
    final base = profile?.id ?? 'local';
    return 'RM-${base.replaceAll('-', '').substring(0, 4).toUpperCase()}';
  }

  /// Compact JSON snapshot for the QR code. Field names follow FHIR resource
  /// naming where practical so a clinic system can map it.
  Map<String, dynamic> toQrJson() {
    final df = DateFormat('yyyy-MM-dd');
    final bp = bpAverage;
    final hr = heartRateSummary;
    return {
      'rt': 'RemediSummary',
      'v': 1,
      'gen': generatedAt.toUtc().toIso8601String(),
      'exp': generatedAt.add(const Duration(hours: 48)).toUtc().toIso8601String(),
      'patient': {
        'name': profile?.fullName,
        if (profile?.dateOfBirth != null) 'dob': df.format(profile!.dateOfBirth!),
        if (profile?.sex != null) 'sex': profile!.sex,
        if (profile?.bloodGroup != null) 'blood': profile!.bloodGroup,
        if (profile?.genotype != null) 'geno': profile!.genotype,
        if ((profile?.allergies ?? '').isNotEmpty) 'allergies': profile!.allergies,
      },
      'conditions': conditions.map((c) => c.name).toList(),
      'meds': [
        for (final m in medications)
          {
            'n': m.medication.displayName,
            'f': m.medication.form.name,
            'd': formatAmount(m.medication.doseAmount),
            't': m.schedules.map((s) => '${s.hour.toString().padLeft(2, '0')}:${s.minute.toString().padLeft(2, '0')}').toList(),
            if (adherence.perMedication[m.medication.id] case final p?)
              'adh': p.expected == 0 ? null : (p.taken * 100 / p.expected).round(),
          },
      ],
      'adh30': (adherence.rate * 100).round(),
      if (bp != null) 'bp': '${bp.sys.round()}/${bp.dia.round()}',
      if (hr != null) 'hr': hr.avg.round(),
      'sx': symptoms.take(10).map((s) => {'s': s.symptom, 'at': df.format(s.recordedAt)}).toList(),
    };
  }

  String get qrData => jsonEncode(toQrJson());

  String get checksum {
    final digest = sha256.convert(utf8.encode(qrData)).toString().toUpperCase();
    return '#${digest.substring(0, 4)}-${digest.substring(4, 8)}';
  }
}

class ExportService {
  Future<pw.ThemeData> _theme() async {
    final regular = pw.Font.ttf(await rootBundle.load('assets/fonts/PlusJakartaSans-Regular.ttf'));
    final bold = pw.Font.ttf(await rootBundle.load('assets/fonts/PlusJakartaSans-Bold.ttf'));
    final fallback = pw.Font.ttf(await rootBundle.load('assets/fonts/NotoSansExt-Regular.ttf'));
    return pw.ThemeData.withFont(base: regular, bold: bold, fontFallback: [fallback]);
  }

  /// Builds the doctor-visit PDF (always in English for the clinician) and
  /// writes it to the app documents directory.
  Future<File> buildPdf(ClinicalSummary s) async {
    const teal = PdfColor.fromInt(0xFF0F766E);
    const muted = PdfColor.fromInt(0xFF3E4947);
    const panel = PdfColor.fromInt(0xFFF2F3FF);
    final df = DateFormat('d MMM yyyy, h:mm a');
    final doc = pw.Document(theme: await _theme(), title: 'Remedi Clinical Summary', author: 'Remedi');
    final p = s.profile;
    final bp = s.bpAverage;
    final hr = s.heartRateSummary;

    pw.Widget section(String title, List<pw.Widget> children) => pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 12),
      padding: const pw.EdgeInsets.all(12),
      decoration: const pw.BoxDecoration(color: panel, borderRadius: pw.BorderRadius.all(pw.Radius.circular(8))),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(title, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: teal, fontSize: 12)),
          pw.SizedBox(height: 6),
          ...children,
        ],
      ),
    );

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        header: (_) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Remedi · Clinical Summary', style: pw.TextStyle(color: teal, fontWeight: pw.FontWeight.bold, fontSize: 16)),
            pw.Text('Generated ${df.format(s.generatedAt)}', style: const pw.TextStyle(color: muted, fontSize: 9)),
          ],
        ),
        footer: (ctx) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Patient-reported data from an offline medication diary. Checksum ${s.checksum}',
                style: const pw.TextStyle(color: muted, fontSize: 8)),
            pw.Text('${ctx.pageNumber}/${ctx.pagesCount}', style: const pw.TextStyle(color: muted, fontSize: 8)),
          ],
        ),
        build: (ctx) => [
          pw.SizedBox(height: 12),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: section('Patient', [
                  pw.Text(p?.fullName ?? 'Unnamed patient', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                  pw.SizedBox(height: 4),
                  pw.Text([
                    if (s.age != null) '${s.age} yrs',
                    if (p?.sex != null) p!.sex!,
                    if (p?.bloodGroup != null) 'Blood ${p!.bloodGroup}',
                    if (p?.genotype != null) 'Genotype ${p!.genotype}',
                  ].join(' • ')),
                  if ((p?.allergies ?? '').isNotEmpty) pw.Text('Allergies: ${p!.allergies}'),
                  pw.Text('Record ${s.recordId}', style: const pw.TextStyle(color: muted, fontSize: 9)),
                  pw.SizedBox(height: 6),
                  pw.Text('Diagnoses', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(s.conditions.isEmpty ? 'None recorded' : s.conditions.map((c) => c.name).join(', ')),
                ]),
              ),
              pw.SizedBox(width: 12),
              pw.Container(
                padding: const pw.EdgeInsets.all(8),
                decoration: pw.BoxDecoration(border: pw.Border.all(color: teal, width: 1), borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8))),
                child: pw.Column(children: [
                  pw.BarcodeWidget(barcode: pw.Barcode.qrCode(), data: s.qrData, width: 120, height: 120),
                  pw.SizedBox(height: 4),
                  pw.Text('Scan for data snapshot', style: const pw.TextStyle(fontSize: 8, color: muted)),
                ]),
              ),
            ],
          ),
          section('30-day adherence: ${(s.adherence.rate * 100).round()}% taken, ${(s.adherence.onTimeRate * 100).round()}% on time', [
            pw.TableHelper.fromTextArray(
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
              cellStyle: const pw.TextStyle(fontSize: 10),
              headers: ['Medication', 'Dose', 'Times', 'Food', 'Adherence'],
              data: [
                for (final m in s.medications)
                  [
                    m.medication.displayName,
                    '${formatAmount(m.medication.doseAmount)} ${m.medication.form.name}',
                    m.schedules.map((x) => DateFormat.jm().format(DateTime(2000, 1, 1, x.hour, x.minute))).join(', '),
                    m.medication.mealRelation.name,
                    switch (s.adherence.perMedication[m.medication.id]) {
                      final a? when a.expected > 0 => '${(a.taken * 100 / a.expected).round()}%',
                      _ => '—',
                    },
                  ],
              ],
            ),
          ]),
          section('Vitals (last 30 days)', [
            pw.Text(bp == null ? 'Blood pressure: no readings' : 'Blood pressure average: ${bp.sys.round()}/${bp.dia.round()} mmHg (${s.bloodPressure.length} readings)'),
            pw.Text(hr == null ? 'Heart rate: no readings' : 'Resting heart rate: ${hr.avg.round()} bpm (range ${hr.min.round()}–${hr.max.round()})'),
            if (s.glucose.isNotEmpty)
              pw.Text('Blood glucose: latest ${s.glucose.last.value.round()} ${s.glucose.last.unit} (${s.glucose.length} readings)'),
          ]),
          section('Reported symptoms', [
            if (s.symptoms.isEmpty) pw.Text('None reported'),
            for (final sx in s.symptoms.take(20))
              pw.Text('• ${DateFormat('d MMM').format(sx.recordedAt)} — ${sx.symptom}${sx.note == null ? '' : ': ${sx.note}'}'),
          ]),
          section('Safety checks', [
            ..._interactionLines(s.medications),
          ]),
        ],
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/Remedi_Summary_${DateFormat('yyyyMMdd_HHmm').format(s.generatedAt)}.pdf');
    await file.writeAsBytes(await doc.save());
    return file;
  }

  List<pw.Widget> _interactionLines(List<MedicationWithSchedules> meds) {
    final names = meds.map((m) => m.medication.name).toList();
    final seen = <String>{};
    final lines = <pw.Widget>[];
    for (final m in meds) {
      for (final hit in interactionsFor(m.medication.name, names)) {
        final key = ([m.medication.name, hit.other]..sort()).join('+');
        if (!seen.add(key)) continue;
        lines.add(pw.Text('${hit.interaction.severe ? '⚠ ' : ''}${m.medication.name} + ${hit.other}: ${hit.interaction.note}'));
      }
    }
    if (lines.isEmpty) lines.add(pw.Text('No known interactions between current medicines in the offline reference.'));
    return lines;
  }
}
