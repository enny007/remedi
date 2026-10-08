import 'package:drift/drift.dart';

import '../../core/utils/ids.dart';
import '../db/app_database.dart';
import '../models/enums.dart';
import 'medication_repository.dart' show startWith;

/// Profile, conditions, vitals and symptom logs.
class HealthRepository {
  HealthRepository(this.db);
  final AppDatabase db;

  // ── Profile ────────────────────────────────────────────────────────────────

  Stream<Profile?> watchProfile() =>
      (db.select(db.profiles)..where((p) => p.deletedAt.isNull())..limit(1)).watchSingleOrNull();

  Future<Profile?> getProfile() =>
      (db.select(db.profiles)..where((p) => p.deletedAt.isNull())..limit(1)).getSingleOrNull();

  Future<void> saveProfile(ProfilesCompanion data) async {
    final existing = await getProfile();
    final id = existing?.id ?? newId();
    final row = data.copyWith(id: Value(id), updatedAt: Value(DateTime.now()));
    if (existing == null) {
      await db.into(db.profiles).insert(row);
    } else {
      await (db.update(db.profiles)..where((p) => p.id.equals(id))).write(row);
    }
    await db.enqueue('profiles', id);
  }

  // ── Conditions ─────────────────────────────────────────────────────────────

  Stream<List<Condition>> watchConditions() => (db.select(db.conditions)
        ..where((c) => c.deletedAt.isNull())
        ..orderBy([(c) => OrderingTerm.asc(c.name)]))
      .watch();

  Future<String> upsertCondition(ConditionsCompanion data) async {
    final id = data.id.present ? data.id.value : newId();
    await db.into(db.conditions).insertOnConflictUpdate(data.copyWith(id: Value(id), updatedAt: Value(DateTime.now())));
    await db.enqueue('conditions', id);
    return id;
  }

  Future<void> deleteCondition(String id) async {
    final now = DateTime.now();
    await (db.update(db.conditions)..where((c) => c.id.equals(id)))
        .write(ConditionsCompanion(deletedAt: Value(now), updatedAt: Value(now)));
    await db.enqueue('conditions', id, SyncOp.delete);
  }

  // ── Vitals ─────────────────────────────────────────────────────────────────

  Future<String> addVital({
    required VitalType type,
    required double value,
    double? value2,
    required String unit,
    DateTime? at,
    VitalSource source = VitalSource.manual,
    String? note,
  }) async {
    final id = newId();
    await db.into(db.vitals).insert(VitalsCompanion.insert(
      id: id,
      type: type,
      value: value,
      value2: Value(value2),
      unit: unit,
      recordedAt: at ?? DateTime.now(),
      source: source,
      note: Value(note),
    ));
    await db.enqueue('vitals', id);
    return id;
  }

  /// Inserts readings imported from HealthKit / Health Connect, skipping any
  /// already stored for the same type, source and timestamp.
  Future<int> importVitals(List<VitalsCompanion> rows) async {
    var added = 0;
    await db.transaction(() async {
      for (final r in rows) {
        final dup = await (db.select(db.vitals)
              ..where((v) =>
                  v.type.equalsValue(r.type.value) &
                  v.source.equalsValue(r.source.value) &
                  v.recordedAt.equals(r.recordedAt.value))
              ..limit(1))
            .getSingleOrNull();
        if (dup != null) {
          if (dup.value != r.value.value) {
            await (db.update(db.vitals)..where((v) => v.id.equals(dup.id)))
                .write(VitalsCompanion(value: r.value, updatedAt: Value(DateTime.now())));
            await db.enqueue('vitals', dup.id);
          }
          continue;
        }
        final id = newId();
        await db.into(db.vitals).insert(r.copyWith(id: Value(id)));
        await db.enqueue('vitals', id);
        added++;
      }
    });
    return added;
  }

  Stream<List<Vital>> watchVitals(VitalType type, {DateTime? since, int? limit}) {
    final q = db.select(db.vitals)
      ..where((v) => v.deletedAt.isNull() & v.type.equalsValue(type))
      ..orderBy([(v) => OrderingTerm.desc(v.recordedAt)]);
    if (since != null) q.where((v) => v.recordedAt.isBiggerOrEqualValue(since));
    if (limit != null) q.limit(limit);
    return q.watch();
  }

  Future<List<Vital>> vitalsSince(VitalType type, DateTime since) => (db.select(db.vitals)
        ..where((v) => v.deletedAt.isNull() & v.type.equalsValue(type) & v.recordedAt.isBiggerOrEqualValue(since))
        ..orderBy([(v) => OrderingTerm.asc(v.recordedAt)]))
      .get();

  Future<int> countVitals() async {
    final c = db.vitals.id.count();
    final row = await (db.selectOnly(db.vitals)..addColumns([c])..where(db.vitals.deletedAt.isNull())).getSingle();
    return row.read(c) ?? 0;
  }

  // ── Symptoms ───────────────────────────────────────────────────────────────

  Future<void> logSymptom({required String symptom, String? medicationId, int severity = 1, String? note}) async {
    final id = newId();
    await db.into(db.symptomLogs).insert(SymptomLogsCompanion.insert(
      id: id,
      symptom: symptom,
      medicationId: Value(medicationId),
      severity: Value(severity),
      recordedAt: DateTime.now(),
      note: Value(note),
    ));
    await db.enqueue('symptom_logs', id);
  }

  Stream<List<SymptomLog>> watchSymptoms({int days = 30}) {
    final since = DateTime.now().subtract(Duration(days: days));
    return (db.select(db.symptomLogs)
          ..where((s) => s.deletedAt.isNull() & s.recordedAt.isBiggerOrEqualValue(since))
          ..orderBy([(s) => OrderingTerm.desc(s.recordedAt)]))
        .watch();
  }
}

/// Local change journal state, shown as "N pending" until Supabase sync lands.
class SyncRepository {
  SyncRepository(this.db);
  final AppDatabase db;

  Stream<int> watchPendingCount() {
    final c = db.syncOutbox.seq.count();
    final q = db.selectOnly(db.syncOutbox)..addColumns([c]);
    final updates = db.tableUpdates(TableUpdateQuery.onTable(db.syncOutbox)).asyncMap((_) => _count(q, c));
    return startWith(() => _count(q, c), updates);
  }

  Future<int> _count(JoinedSelectStatement q, Expression<int> c) async =>
      (await q.getSingle()).read(c) ?? 0;

  /// Oldest-first batch of distinct pending changes for the sync worker.
  Future<List<SyncOutboxData>> pendingBatch({int limit = 200}) =>
      (db.select(db.syncOutbox)..orderBy([(o) => OrderingTerm.asc(o.seq)])..limit(limit)).get();

  Future<void> markPushed(Iterable<int> seqs) =>
      (db.delete(db.syncOutbox)..where((o) => o.seq.isIn(seqs))).go();
}
