import 'dart:convert';

import 'package:drift/drift.dart';

import '../../core/utils/ids.dart';
import '../db/app_database.dart';
import '../models/dose_occurrence.dart';
import '../models/enums.dart';
import '../models/medication_draft.dart';

class MedicationRepository {
  MedicationRepository(this.db);
  final AppDatabase db;

  Stream<List<MedicationWithSchedules>> watchActive() {
    final stream = db
        .tableUpdates(TableUpdateQuery.onAllTables([db.medications, db.doseSchedules, db.conditions]))
        .asyncMap((_) => loadActive());
    return _startWith(loadActive, stream);
  }

  Future<List<MedicationWithSchedules>> loadActive() async {
    final meds = await (db.select(db.medications)
          ..where((m) => m.deletedAt.isNull() & m.isActive.equals(true))
          ..orderBy([(m) => OrderingTerm.asc(m.name)]))
        .get();
    return _withSchedules(meds);
  }

  Stream<MedicationWithSchedules?> watchOne(String id) {
    final stream = db
        .tableUpdates(TableUpdateQuery.onAllTables([db.medications, db.doseSchedules, db.conditions]))
        .asyncMap((_) => loadOne(id));
    return _startWith(() => loadOne(id), stream);
  }

  Future<MedicationWithSchedules?> loadOne(String id) async {
    final med = await (db.select(db.medications)..where((m) => m.id.equals(id))).getSingleOrNull();
    if (med == null) return null;
    return (await _withSchedules([med])).first;
  }

  Future<List<MedicationWithSchedules>> _withSchedules(List<Medication> meds) async {
    if (meds.isEmpty) return [];
    final ids = meds.map((m) => m.id).toList();
    final schedules = await (db.select(db.doseSchedules)
          ..where((s) => s.medicationId.isIn(ids) & s.deletedAt.isNull())
          ..orderBy([(s) => OrderingTerm.asc(s.hour), (s) => OrderingTerm.asc(s.minute)]))
        .get();
    final condIds = meds.map((m) => m.conditionId).whereType<String>().toSet();
    final conditions = condIds.isEmpty
        ? <Condition>[]
        : await (db.select(db.conditions)..where((c) => c.id.isIn(condIds))).get();
    return [
      for (final m in meds)
        MedicationWithSchedules(
          m,
          schedules.where((s) => s.medicationId == m.id).toList(),
          condition: conditions.where((c) => c.id == m.conditionId).firstOrNull,
        ),
    ];
  }

  /// Inserts or updates a medication and replaces its reminder times.
  /// Returns the medication id.
  Future<String> save(MedicationDraft d) {
    return db.transaction(() async {
      final now = DateTime.now();
      final id = d.id ?? newId();
      String? conditionId = d.conditionId;
      if (conditionId == null && (d.conditionName?.trim().isNotEmpty ?? false)) {
        final existing = await (db.select(db.conditions)
              ..where((c) => c.name.lower().equals(d.conditionName!.trim().toLowerCase()) & c.deletedAt.isNull()))
            .getSingleOrNull();
        if (existing != null) {
          conditionId = existing.id;
        } else {
          conditionId = newId();
          await db.into(db.conditions).insert(
            ConditionsCompanion.insert(
              id: conditionId,
              name: d.conditionName!.trim(),
              doctorName: Value(d.prescriberName),
              facility: Value(d.facility),
              diagnosedAt: Value(now),
            ),
          );
          await db.enqueue('conditions', conditionId);
        }
      }

      final companion = MedicationsCompanion(
        id: Value(id),
        name: Value(d.name.trim()),
        strength: Value(d.strength.trim()),
        form: Value(d.form),
        drugClass: Value(d.drugClass),
        doseAmount: Value(d.doseAmount),
        frequency: Value(d.frequency),
        mealRelation: Value(d.meal),
        instructions: Value(d.instructions),
        pillDescription: Value(d.pillDescription),
        conditionId: Value(conditionId),
        prescriberName: Value(d.prescriberName),
        prescriberSpecialty: Value(d.prescriberSpecialty),
        facility: Value(d.facility),
        prescriberPhone: Value(d.prescriberPhone),
        rxNumber: Value(d.rxNumber),
        prescriptionImagePath: Value(d.prescriptionImagePath),
        stockCount: Value(d.stockCount),
        refillThreshold: Value(d.refillThreshold),
        sideEffectWatch: Value(jsonEncode(d.sideEffectWatch.toList())),
        isActive: const Value(true),
        updatedAt: Value(now),
      );
      await db.into(db.medications).insertOnConflictUpdate(companion);
      await db.enqueue('medications', id);

      // Replace schedules: soft-delete old rows so history keeps the times that
      // were in force when past doses were due.
      final old = await (db.select(db.doseSchedules)
            ..where((s) => s.medicationId.equals(id) & s.deletedAt.isNull()))
          .get();
      final keep = <String>{};
      for (final t in d.times) {
        final match = old.where((o) => o.hour == t.hour && o.minute == t.minute).firstOrNull;
        if (match != null && !keep.contains(match.id)) {
          keep.add(match.id);
          if (match.doseAmount != t.amount || match.slot != t.slot) {
            await (db.update(db.doseSchedules)..where((s) => s.id.equals(match.id))).write(
              DoseSchedulesCompanion(doseAmount: Value(t.amount), slot: Value(t.slot), updatedAt: Value(now)),
            );
            await db.enqueue('dose_schedules', match.id);
          }
          continue;
        }
        final sid = newId();
        await db.into(db.doseSchedules).insert(
          DoseSchedulesCompanion.insert(
            id: sid,
            medicationId: id,
            hour: t.hour,
            minute: t.minute,
            doseAmount: Value(t.amount),
            slot: Value(t.slot),
          ),
        );
        await db.enqueue('dose_schedules', sid);
      }
      for (final o in old.where((o) => !keep.contains(o.id))) {
        await (db.update(db.doseSchedules)..where((s) => s.id.equals(o.id)))
            .write(DoseSchedulesCompanion(deletedAt: Value(now), updatedAt: Value(now)));
        await db.enqueue('dose_schedules', o.id, SyncOp.delete);
      }
      return id;
    });
  }

  Future<void> archive(String id) async {
    final now = DateTime.now();
    await db.transaction(() async {
      await (db.update(db.medications)..where((m) => m.id.equals(id)))
          .write(MedicationsCompanion(isActive: const Value(false), endDate: Value(now), updatedAt: Value(now)));
      await db.enqueue('medications', id);
      final scheds = await (db.select(db.doseSchedules)
            ..where((s) => s.medicationId.equals(id) & s.deletedAt.isNull()))
          .get();
      for (final s in scheds) {
        await (db.update(db.doseSchedules)..where((x) => x.id.equals(s.id)))
            .write(DoseSchedulesCompanion(deletedAt: Value(now), updatedAt: Value(now)));
        await db.enqueue('dose_schedules', s.id, SyncOp.delete);
      }
    });
  }

  Future<void> setStock(String id, double stock) async {
    await (db.update(db.medications)..where((m) => m.id.equals(id)))
        .write(MedicationsCompanion(stockCount: Value(stock), updatedAt: Value(DateTime.now())));
    await db.enqueue('medications', id);
  }
}

/// Emits [initial] first, then every value of [updates].
Stream<T> _startWith<T>(Future<T> Function() initial, Stream<T> updates) async* {
  yield await initial();
  yield* updates;
}

Stream<T> startWith<T>(Future<T> Function() initial, Stream<T> updates) => _startWith(initial, updates);
