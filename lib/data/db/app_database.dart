import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../models/enums.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Profiles,
    Conditions,
    Medications,
    DoseSchedules,
    DoseLogs,
    Snoozes,
    Vitals,
    SymptomLogs,
    SyncOutbox,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_dose_logs_sched ON dose_logs (schedule_id, scheduled_at)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_dose_logs_time ON dose_logs (scheduled_at)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_vitals_time ON vitals (type, recorded_at)',
      );
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  /// Records a local change for the future Supabase sync worker.
  Future<void> enqueue(String table, String id, [SyncOp op = SyncOp.upsert]) {
    return into(syncOutbox).insert(
      SyncOutboxCompanion.insert(entityTable: table, entityId: id, op: op),
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'remedi');
  }
}
