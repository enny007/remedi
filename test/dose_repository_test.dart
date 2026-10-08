import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remedi/core/utils/time_utils.dart';
import 'package:remedi/data/db/app_database.dart';
import 'package:remedi/data/models/dose_occurrence.dart';
import 'package:remedi/data/models/enums.dart';
import 'package:remedi/data/models/medication_draft.dart';
import 'package:remedi/data/repositories/dose_repository.dart';
import 'package:remedi/data/repositories/medication_repository.dart';

void main() {
  late AppDatabase db;
  late MedicationRepository meds;
  late DoseRepository doses;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    meds = MedicationRepository(db);
    doses = DoseRepository(db);
  });

  tearDown(() => db.close());

  /// Saves a medication and backdates its schedules so past doses count.
  Future<String> addMed({double? stock, List<DraftTime>? times, int backdateDays = 3}) async {
    final id = await meds.save(MedicationDraft(
      name: 'Metformin',
      strength: '500mg',
      stockCount: stock,
      times: times ?? const [DraftTime(hour: 8, minute: 0), DraftTime(hour: 20, minute: 0)],
    ));
    final past = dayStart(DateTime.now()).subtract(Duration(days: backdateDays));
    await (db.update(db.doseSchedules)).write(DoseSchedulesCompanion(createdAt: Value(past)));
    await (db.update(db.medications)).write(MedicationsCompanion(startDate: Value(past)));
    return id;
  }

  test('save creates schedules and queues sync rows', () async {
    await addMed();
    final active = await meds.loadActive();
    expect(active, hasLength(1));
    expect(active.first.schedules.map((s) => s.hour), [8, 20]);
    final pending = await db.select(db.syncOutbox).get();
    expect(pending.map((p) => p.entityTable), containsAll(['medications', 'dose_schedules']));
  });

  test('occurrences for today follow the reminder times', () async {
    await addMed();
    final occ = await doses.occurrencesForDay(DateTime.now());
    expect(occ.map((o) => o.scheduledAt.hour), [8, 20]);
  });

  test('a new reminder time never produces a missed dose earlier that day', () async {
    await meds.save(const MedicationDraft(name: 'A', strength: '1mg', times: [DraftTime(hour: 0, minute: 0)]));
    final occ = await doses.occurrencesForDay(DateTime.now());
    expect(occ, isEmpty);
  });

  test('markTaken logs the dose and deducts stock; undo restores it', () async {
    final id = await addMed(stock: 10);
    final o = (await doses.occurrencesForDay(DateTime.now())).first;
    final logId = await doses.markTaken(o);

    var med = (await meds.loadOne(id))!;
    expect(med.medication.stockCount, 9);
    final after = (await doses.occurrencesForDay(DateTime.now())).first;
    expect(after.stateAt(DateTime.now()), OccurrenceState.taken);

    await doses.undo(logId);
    med = (await meds.loadOne(id))!;
    expect(med.medication.stockCount, 10);
    final undone = (await doses.occurrencesForDay(DateTime.now())).first;
    expect(undone.log, isNull);
  });

  test('re-logging an occurrence replaces the previous outcome', () async {
    final id = await addMed(stock: 10);
    final o = (await doses.occurrencesForDay(DateTime.now())).first;
    await doses.skip(o, SkipReason.stomachUpset);
    await doses.markTaken(o);
    final logs = await (db.select(db.doseLogs)..where((l) => l.deletedAt.isNull())).get();
    expect(logs, hasLength(1));
    expect(logs.single.status, DoseStatus.taken);
    expect((await meds.loadOne(id))!.medication.stockCount, 9);
  });

  test('snooze is limited to three per dose', () async {
    await addMed();
    var o = (await doses.occurrencesForDay(DateTime.now())).first;
    for (var i = 0; i < maxSnoozes; i++) {
      expect(await doses.snooze(o), isNotNull);
      o = (await doses.occurrencesForDay(DateTime.now())).first;
    }
    expect(await doses.snooze(o), isNull);
  });

  test('state machine: upcoming → due → overdue → missed', () {
    final at = DateTime(2026, 1, 1, 8);
    final o = DoseOccurrence(
      medication: _fakeMed(),
      schedule: _fakeSchedule(),
      scheduledAt: at,
    );
    expect(o.stateAt(at.subtract(const Duration(hours: 3))), OccurrenceState.upcoming);
    expect(o.stateAt(at.subtract(const Duration(minutes: 20))), OccurrenceState.due);
    expect(o.stateAt(at.add(const Duration(minutes: 30))), OccurrenceState.overdue);
    expect(o.stateAt(at.add(const Duration(hours: 3))), OccurrenceState.missed);
  });

  test('adherence counts past doses and ignores unresolved ones today', () async {
    await addMed(backdateDays: 2);
    final yesterday = dayStart(DateTime.now()).subtract(const Duration(days: 1));
    final occ = await doses.occurrencesForDay(yesterday);
    await doses.markTaken(occ[0], at: occ[0].scheduledAt.add(const Duration(minutes: 5)));
    // occ[1] (20:00 yesterday) left unlogged → missed.

    final stats = await doses.adherence(days: 3, now: atTime(DateTime.now(), 6, 0));
    // 2 days ago: 2 missed, yesterday: 1 taken + 1 missed; today at 06:00 nothing resolved.
    expect(stats.expected, 4);
    expect(stats.taken, 1);
    expect(stats.onTime, 1);
    expect(stats.streakDays, 0);
  });

  test('archive stops future reminders but keeps history', () async {
    final id = await addMed();
    final o = (await doses.occurrencesForDay(DateTime.now().subtract(const Duration(days: 1)))).first;
    await doses.markTaken(o);
    await meds.archive(id);
    expect(await meds.loadActive(), isEmpty);
    final tomorrow = await doses.occurrencesForDay(DateTime.now().add(const Duration(days: 1)));
    expect(tomorrow, isEmpty);
    final yesterday = await doses.occurrencesForDay(DateTime.now().subtract(const Duration(days: 1)));
    expect(yesterday.where((x) => x.log != null), hasLength(1));
  });
}

Medication _fakeMed() => Medication(
  id: 'm',
  createdAt: DateTime(2026),
  updatedAt: DateTime(2026),
  name: 'X',
  strength: '1mg',
  form: DoseForm.tablet,
  route: 'oral',
  doseAmount: 1,
  frequency: Frequency.once,
  mealRelation: MealRelation.any,
  refillThreshold: 5,
  sideEffectWatch: '[]',
  startDate: DateTime(2026),
  isActive: true,
);

DoseSchedule _fakeSchedule() => DoseSchedule(
  id: 's',
  createdAt: DateTime(2026),
  updatedAt: DateTime(2026),
  medicationId: 'm',
  hour: 8,
  minute: 0,
  doseAmount: 1,
  slot: 'breakfast',
);
