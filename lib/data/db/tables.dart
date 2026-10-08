import 'package:drift/drift.dart';

import '../models/enums.dart';

/// Columns shared by every synced table. Mirrors the Supabase row shape:
/// `id uuid primary key, created_at, updated_at, deleted_at`.
mixin SyncedColumns on Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  /// Soft delete so deletions can be pushed to the server.
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// The person taking the medicines. A single local row today; becomes the
/// `profiles` table keyed by `auth.uid()` once Supabase auth is wired in.
class Profiles extends Table with SyncedColumns {
  TextColumn get fullName => text()();
  TextColumn get title => text().nullable()();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  TextColumn get sex => text().nullable()();
  TextColumn get bloodGroup => text().nullable()();
  TextColumn get genotype => text().nullable()();
  TextColumn get allergies => text().nullable()();
  TextColumn get avatarPath => text().nullable()();
  TextColumn get caregiverName => text().nullable()();
  TextColumn get caregiverRelation => text().nullable()();
  TextColumn get caregiverPhone => text().nullable()();
  BoolColumn get caregiverAlertsEnabled => boolean().withDefault(const Constant(true))();
  IntColumn get caregiverDelayMinutes => integer().withDefault(const Constant(20))();
}

class Conditions extends Table with SyncedColumns {
  TextColumn get name => text()();
  DateTimeColumn get diagnosedAt => dateTime().nullable()();
  TextColumn get doctorName => text().nullable()();
  TextColumn get facility => text().nullable()();
  TextColumn get notes => text().nullable()();
}

class Medications extends Table with SyncedColumns {
  TextColumn get name => text()();
  TextColumn get strength => text()();
  TextColumn get form => textEnum<DoseForm>()();
  TextColumn get drugClass => text().nullable()();
  TextColumn get route => text().withDefault(const Constant('oral'))();
  RealColumn get doseAmount => real().withDefault(const Constant(1))();
  TextColumn get frequency => textEnum<Frequency>()();
  TextColumn get mealRelation => textEnum<MealRelation>()();
  TextColumn get instructions => text().nullable()();
  TextColumn get pillDescription => text().nullable()();
  TextColumn get conditionId => text().nullable().references(Conditions, #id)();
  TextColumn get prescriberName => text().nullable()();
  TextColumn get prescriberSpecialty => text().nullable()();
  TextColumn get facility => text().nullable()();
  TextColumn get prescriberPhone => text().nullable()();
  TextColumn get rxNumber => text().nullable()();
  TextColumn get prescriptionImagePath => text().nullable()();
  RealColumn get stockCount => real().nullable()();
  RealColumn get refillThreshold => real().withDefault(const Constant(5))();

  /// JSON array of symptom keys the prescriber asked the patient to watch.
  TextColumn get sideEffectWatch => text().withDefault(const Constant('[]'))();
  DateTimeColumn get startDate => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get endDate => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

/// One daily reminder time for a medication.
class DoseSchedules extends Table with SyncedColumns {
  TextColumn get medicationId => text().references(Medications, #id)();
  IntColumn get hour => integer()();
  IntColumn get minute => integer()();
  RealColumn get doseAmount => real().withDefault(const Constant(1))();

  /// breakfast | lunch | dinner | bedtime | custom
  TextColumn get slot => text().withDefault(const Constant('custom'))();
}

/// What actually happened to a scheduled (or as-needed) dose.
class DoseLogs extends Table with SyncedColumns {
  TextColumn get medicationId => text().references(Medications, #id)();
  TextColumn get scheduleId => text().nullable().references(DoseSchedules, #id)();

  /// The planned time. For PRN doses this equals [actionAt].
  DateTimeColumn get scheduledAt => dateTime()();
  DateTimeColumn get actionAt => dateTime()();
  TextColumn get status => textEnum<DoseStatus>()();
  TextColumn get skipReason => textEnum<SkipReason>().nullable()();
  RealColumn get doseAmount => real().withDefault(const Constant(1))();
  TextColumn get note => text().nullable()();
}

/// Snooze state for a dose occurrence, kept separate so a snooze never counts
/// as an outcome in adherence maths.
class Snoozes extends Table with SyncedColumns {
  TextColumn get scheduleId => text().references(DoseSchedules, #id)();
  DateTimeColumn get scheduledAt => dateTime()();
  IntColumn get count => integer().withDefault(const Constant(0))();
  DateTimeColumn get snoozedUntil => dateTime()();
}

class Vitals extends Table with SyncedColumns {
  TextColumn get type => textEnum<VitalType>()();
  RealColumn get value => real()();

  /// Diastolic for blood pressure.
  RealColumn get value2 => real().nullable()();
  TextColumn get unit => text()();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get source => textEnum<VitalSource>()();
  TextColumn get note => text().nullable()();
}

class SymptomLogs extends Table with SyncedColumns {
  TextColumn get medicationId => text().nullable().references(Medications, #id)();
  TextColumn get symptom => text()();

  /// 1 mild – 3 severe.
  IntColumn get severity => integer().withDefault(const Constant(1))();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get note => text().nullable()();
  BoolColumn get resolved => boolean().withDefault(const Constant(false))();
}

/// Local change journal. Every write to a synced table appends a row here;
/// a future Supabase sync worker drains it in order and deletes pushed rows.
class SyncOutbox extends Table {
  IntColumn get seq => integer().autoIncrement()();
  TextColumn get entityTable => text()();
  TextColumn get entityId => text()();
  TextColumn get op => textEnum<SyncOp>()();
  DateTimeColumn get queuedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
}
