import 'dart:math';

import 'package:drift/drift.dart';

import '../core/utils/ids.dart';
import '../core/utils/time_utils.dart';
import 'db/app_database.dart';
import 'models/enums.dart';

/// Loads a realistic sample regimen (the one shown in the Stitch designs) with
/// 30 days of history so every screen can be explored immediately.
Future<void> seedSampleData(AppDatabase db, {String? patientName}) async {
  final rnd = Random(42);
  final now = DateTime.now();
  final start = dayStart(now).subtract(const Duration(days: 30));

  await db.transaction(() async {
    final existing = await (db.select(db.profiles)..limit(1)).getSingleOrNull();
    final profileId = existing?.id ?? newId();
    await db.into(db.profiles).insertOnConflictUpdate(ProfilesCompanion(
      id: Value(profileId),
      fullName: Value(patientName?.trim().isNotEmpty ?? false ? patientName!.trim() : existing?.fullName ?? 'Folashade Adeleke'),
      title: Value(existing?.title ?? 'Mrs.'),
      dateOfBirth: Value(existing?.dateOfBirth ?? DateTime(now.year - 54, 3, 14)),
      sex: Value(existing?.sex ?? 'Female'),
      bloodGroup: Value(existing?.bloodGroup ?? 'O+'),
      genotype: Value(existing?.genotype ?? 'AA'),
      caregiverName: Value(existing?.caregiverName ?? 'Kunle Adeleke'),
      caregiverRelation: Value(existing?.caregiverRelation ?? 'Son'),
      caregiverPhone: Value(existing?.caregiverPhone ?? '08025550194'),
      updatedAt: Value(now),
    ));
    await db.enqueue('profiles', profileId);

    Future<String> condition(String name, DateTime diagnosed, String doctor) async {
      final id = newId();
      await db.into(db.conditions).insert(ConditionsCompanion.insert(
        id: id,
        name: name,
        diagnosedAt: Value(diagnosed),
        doctorName: Value(doctor),
        facility: const Value('Lagoon Hospital, Ikoyi'),
        createdAt: Value(start),
      ));
      await db.enqueue('conditions', id);
      return id;
    }

    final htn = await condition('Hypertension', DateTime(2024, 2), 'Dr. Babatunde Adeleke');
    final dm = await condition('Type 2 Diabetes', DateTime(2023, 11), 'Dr. Sarah Lin');

    Future<void> med({
      required String name,
      required String strength,
      required String cls,
      required Frequency freq,
      required MealRelation meal,
      required List<(int, int, String)> times,
      required String conditionId,
      required String doctor,
      required String specialty,
      required double stock,
      String? instructions,
      String? pill,
      String? rx,
    }) async {
      final id = newId();
      await db.into(db.medications).insert(MedicationsCompanion.insert(
        id: id,
        name: name,
        strength: strength,
        form: DoseForm.tablet,
        frequency: freq,
        mealRelation: meal,
        drugClass: Value(cls),
        conditionId: Value(conditionId),
        prescriberName: Value(doctor),
        prescriberSpecialty: Value(specialty),
        facility: const Value('Lagoon Hospital, Ikoyi'),
        prescriberPhone: const Value('+2348032345678'),
        instructions: Value(instructions),
        pillDescription: Value(pill),
        rxNumber: Value(rx),
        stockCount: Value(stock),
        startDate: Value(start),
        createdAt: Value(start),
        sideEffectWatch: const Value('["nausea","fatigue"]'),
      ));
      await db.enqueue('medications', id);
      for (final (h, m, slot) in times) {
        final sid = newId();
        await db.into(db.doseSchedules).insert(DoseSchedulesCompanion.insert(
          id: sid,
          medicationId: id,
          hour: h,
          minute: m,
          slot: Value(slot),
          createdAt: Value(start),
        ));
        await db.enqueue('dose_schedules', sid);
        // History: ~94% taken, a few late, a couple skipped.
        for (var d = start; d.isBefore(dayStart(now)); d = d.add(const Duration(days: 1))) {
          final at = atTime(d, h, m);
          final r = rnd.nextDouble();
          if (r < 0.04) continue; // missed (no log)
          final skipped = r < 0.06;
          final lateMins = r > 0.9 ? 70 + rnd.nextInt(40) : rnd.nextInt(20);
          final lid = newId();
          await db.into(db.doseLogs).insert(DoseLogsCompanion.insert(
            id: lid,
            medicationId: id,
            scheduleId: Value(sid),
            scheduledAt: at,
            actionAt: at.add(Duration(minutes: lateMins)),
            status: skipped ? DoseStatus.skipped : DoseStatus.taken,
            skipReason: Value(skipped ? SkipReason.stomachUpset : null),
          ));
        }
      }
    }

    await med(
      name: 'Amlodipine',
      strength: '5mg',
      cls: 'Antihypertensive (calcium channel blocker)',
      freq: Frequency.once,
      meal: MealRelation.any,
      times: [(8, 0, 'breakfast')],
      conditionId: htn,
      doctor: 'Dr. Babatunde Adeleke',
      specialty: 'Cardiology',
      stock: 28,
      rx: 'RX-8840-NG',
    );
    await med(
      name: 'Metformin',
      strength: '500mg',
      cls: 'Anti-diabetic (biguanide)',
      freq: Frequency.twice,
      meal: MealRelation.withMeal,
      times: [(8, 0, 'breakfast'), (20, 0, 'dinner')],
      conditionId: dm,
      doctor: 'Dr. Sarah Lin',
      specialty: 'Endocrinology',
      stock: 12,
      instructions: 'Drink at least 2 full glasses of clean water with Metformin to prevent stomach irritation.',
      pill: "White oblong tablet, bisected, marked 'M 500'",
      rx: 'RX-8842-NG',
    );
    await med(
      name: 'Atorvastatin',
      strength: '20mg',
      cls: 'Cholesterol-lowering (statin)',
      freq: Frequency.once,
      meal: MealRelation.any,
      times: [(21, 0, 'bedtime')],
      conditionId: htn,
      doctor: 'Dr. Babatunde Adeleke',
      specialty: 'Cardiology',
      stock: 60,
    );

    // Vitals: morning BP trending down, resting HR, glucose.
    for (var i = 14; i >= 1; i--) {
      final d = dayStart(now).subtract(Duration(days: i));
      final sys = 138 - (14 - i) * 1.2 + rnd.nextInt(5);
      final dia = 86 - (14 - i) * 0.5 + rnd.nextInt(3);
      for (final (type, v, v2, unit, at) in [
        (VitalType.bloodPressure, sys.roundToDouble(), dia.roundToDouble(), 'mmHg', atTime(d, 9, 15)),
        (VitalType.heartRate, (66 + rnd.nextInt(14)).toDouble(), null, 'bpm', atTime(d, 9, 20)),
        (VitalType.bloodGlucose, (105 + rnd.nextInt(35)).toDouble(), null, 'mg/dL', atTime(d, 7, 30)),
        (VitalType.steps, (3500 + rnd.nextInt(4500)).toDouble(), null, 'steps', d),
      ]) {
        final vid = newId();
        await db.into(db.vitals).insert(VitalsCompanion.insert(
          id: vid,
          type: type,
          value: v,
          value2: Value(v2),
          unit: unit,
          recordedAt: at,
          source: VitalSource.manual,
        ));
      }
    }

    for (final daysAgo in [24, 19]) {
      await db.into(db.symptomLogs).insert(SymptomLogsCompanion.insert(
        id: newId(),
        symptom: 'nausea',
        recordedAt: now.subtract(Duration(days: daysAgo)),
        note: const Value('Resolved when Metformin was taken after meals'),
        resolved: const Value(true),
      ));
    }
  });
}
