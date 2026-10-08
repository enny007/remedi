import 'package:drift/drift.dart';

import '../../core/utils/ids.dart';
import '../../core/utils/time_utils.dart';
import '../db/app_database.dart';
import '../models/dose_occurrence.dart';
import '../models/enums.dart';
import 'medication_repository.dart' show startWith;

const maxSnoozes = 3;

class DayAdherence {
  DayAdherence(this.day, this.expected, this.taken, this.late, this.skippedOrMissed);
  final DateTime day;
  final int expected;
  final int taken;
  final int late;
  final int skippedOrMissed;

  bool get perfect => expected > 0 && taken == expected && late == 0;
  bool get complete => expected > 0 && taken == expected;
}

class AdherenceStats {
  AdherenceStats({
    required this.expected,
    required this.taken,
    required this.onTime,
    required this.streakDays,
    required this.days,
    required this.perMedication,
  });

  final int expected;
  final int taken;
  final int onTime;
  final int streakDays;
  final List<DayAdherence> days;

  /// medicationId → (expected, taken)
  final Map<String, ({int expected, int taken})> perMedication;

  double get rate => expected == 0 ? 1 : taken / expected;
  double get onTimeRate => expected == 0 ? 1 : onTime / expected;
}

/// A dose counts as on time when taken within this window of its scheduled time.
const onTimeWindow = Duration(minutes: 60);

class DoseRepository {
  DoseRepository(this.db);
  final AppDatabase db;

  List<TableInfo> get _watched => [db.medications, db.doseSchedules, db.doseLogs, db.snoozes];

  Stream<List<DoseOccurrence>> watchDay(DateTime day) {
    final updates = db.tableUpdates(TableUpdateQuery.onAllTables(_watched)).asyncMap((_) => occurrencesForDay(day));
    return startWith(() => occurrencesForDay(day), updates);
  }

  /// All scheduled doses for [day], including those of medications that were
  /// active on that day but have since been edited or stopped.
  Future<List<DoseOccurrence>> occurrencesForDay(DateTime day) async {
    final start = dayStart(day);
    final end = start.add(const Duration(days: 1));
    return _occurrencesBetween(start, end);
  }

  Future<List<DoseOccurrence>> _occurrencesBetween(DateTime start, DateTime end) async {
    final meds = await (db.select(db.medications)..where((m) => m.deletedAt.isNull())).get();
    final medById = {for (final m in meds) m.id: m};
    final schedules = await (db.select(db.doseSchedules)
          ..where((s) => s.createdAt.isSmallerThanValue(end) & (s.deletedAt.isNull() | s.deletedAt.isBiggerThanValue(start))))
        .get();
    final logs = await (db.select(db.doseLogs)
          ..where((l) => l.deletedAt.isNull() & l.scheduledAt.isBetweenValues(start, end) & l.scheduleId.isNotNull()))
        .get();
    final snoozes = await (db.select(db.snoozes)
          ..where((s) => s.deletedAt.isNull() & s.scheduledAt.isBetweenValues(start, end)))
        .get();

    final logByKey = {for (final l in logs) '${l.scheduleId}@${l.scheduledAt.toIso8601String()}': l};
    final snoozeByKey = {for (final s in snoozes) '${s.scheduleId}@${s.scheduledAt.toIso8601String()}': s};

    final result = <DoseOccurrence>[];
    for (var d = start; d.isBefore(end); d = d.add(const Duration(days: 1))) {
      final day = dayStart(d);
      for (final s in schedules) {
        final med = medById[s.medicationId];
        if (med == null) continue;
        final at = atTime(day, s.hour, s.minute);
        if (at.isBefore(start) || !at.isBefore(end)) continue;
        // A reminder time only applies from the moment it was created, so a
        // medicine added at 9 AM never shows an 8 AM dose as missed.
        if (at.isBefore(s.createdAt)) continue;
        if (s.deletedAt != null && !s.deletedAt!.isAfter(at)) continue;
        if (dayStart(med.startDate).isAfter(day)) continue;
        if (med.endDate != null && med.endDate!.isBefore(at)) continue;
        final key = '${s.id}@${at.toIso8601String()}';
        result.add(DoseOccurrence(
          medication: med,
          schedule: s,
          scheduledAt: at,
          log: logByKey[key],
          snooze: snoozeByKey[key],
        ));
      }
    }
    result.sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));
    return result;
  }

  Future<DoseOccurrence?> findOccurrence(String scheduleId, DateTime scheduledAt) async {
    final all = await occurrencesForDay(scheduledAt);
    return all.where((o) => o.schedule.id == scheduleId && o.scheduledAt == scheduledAt).firstOrNull;
  }

  /// Logs a dose as taken and deducts it from stock. Returns the log id so the
  /// action can be undone.
  Future<String> markTaken(DoseOccurrence o, {DateTime? at}) {
    return _log(
      medicationId: o.medication.id,
      scheduleId: o.schedule.id,
      scheduledAt: o.scheduledAt,
      status: DoseStatus.taken,
      amount: o.schedule.doseAmount,
      at: at,
    );
  }

  Future<String> skip(DoseOccurrence o, SkipReason reason, {String? note}) {
    return _log(
      medicationId: o.medication.id,
      scheduleId: o.schedule.id,
      scheduledAt: o.scheduledAt,
      status: DoseStatus.skipped,
      amount: o.schedule.doseAmount,
      reason: reason,
      note: note,
    );
  }

  /// Logs an as-needed (PRN) or extra dose taken right now.
  Future<String> logAsNeeded(Medication med, {double amount = 1}) {
    final now = DateTime.now();
    return _log(medicationId: med.id, scheduleId: null, scheduledAt: now, status: DoseStatus.taken, amount: amount, at: now);
  }

  Future<String> _log({
    required String medicationId,
    required String? scheduleId,
    required DateTime scheduledAt,
    required DoseStatus status,
    required double amount,
    DateTime? at,
    SkipReason? reason,
    String? note,
  }) {
    return db.transaction(() async {
      final id = newId();
      // Replace any previous outcome for this occurrence.
      if (scheduleId != null) {
        final prev = await (db.select(db.doseLogs)
              ..where((l) => l.scheduleId.equals(scheduleId) & l.scheduledAt.equals(scheduledAt) & l.deletedAt.isNull()))
            .get();
        for (final p in prev) {
          await _softDeleteLog(p);
        }
      }
      await db.into(db.doseLogs).insert(DoseLogsCompanion.insert(
        id: id,
        medicationId: medicationId,
        scheduleId: Value(scheduleId),
        scheduledAt: scheduledAt,
        actionAt: at ?? DateTime.now(),
        status: status,
        skipReason: Value(reason),
        doseAmount: Value(amount),
        note: Value(note),
      ));
      await db.enqueue('dose_logs', id);
      if (status == DoseStatus.taken) await _adjustStock(medicationId, -amount);
      return id;
    });
  }

  Future<void> undo(String logId) {
    return db.transaction(() async {
      final log = await (db.select(db.doseLogs)..where((l) => l.id.equals(logId))).getSingleOrNull();
      if (log != null && log.deletedAt == null) await _softDeleteLog(log);
    });
  }

  Future<void> _softDeleteLog(DoseLog log) async {
    final now = DateTime.now();
    await (db.update(db.doseLogs)..where((l) => l.id.equals(log.id)))
        .write(DoseLogsCompanion(deletedAt: Value(now), updatedAt: Value(now)));
    await db.enqueue('dose_logs', log.id, SyncOp.delete);
    if (log.status == DoseStatus.taken) await _adjustStock(log.medicationId, log.doseAmount);
  }

  Future<void> _adjustStock(String medicationId, double delta) async {
    final med = await (db.select(db.medications)..where((m) => m.id.equals(medicationId))).getSingleOrNull();
    if (med?.stockCount == null) return;
    final next = (med!.stockCount! + delta).clamp(0, 100000).toDouble();
    await (db.update(db.medications)..where((m) => m.id.equals(medicationId)))
        .write(MedicationsCompanion(stockCount: Value(next), updatedAt: Value(DateTime.now())));
    await db.enqueue('medications', medicationId);
  }

  /// Snoozes an occurrence. Returns the new ring time, or null when the snooze
  /// limit has been reached.
  Future<DateTime?> snooze(DoseOccurrence o, {Duration by = const Duration(minutes: 15)}) async {
    if (o.snoozeCount >= maxSnoozes) return null;
    final until = DateTime.now().add(by);
    final existing = o.snooze;
    if (existing == null) {
      final id = newId();
      await db.into(db.snoozes).insert(SnoozesCompanion.insert(
        id: id,
        scheduleId: o.schedule.id,
        scheduledAt: o.scheduledAt,
        count: const Value(1),
        snoozedUntil: until,
      ));
      await db.enqueue('snoozes', id);
    } else {
      await (db.update(db.snoozes)..where((s) => s.id.equals(existing.id))).write(SnoozesCompanion(
        count: Value(existing.count + 1),
        snoozedUntil: Value(until),
        updatedAt: Value(DateTime.now()),
      ));
      await db.enqueue('snoozes', existing.id);
    }
    return until;
  }

  Stream<List<DoseLog>> watchRecentLogs({int days = 30}) {
    final from = dayStart(DateTime.now()).subtract(Duration(days: days));
    return (db.select(db.doseLogs)
          ..where((l) => l.deletedAt.isNull() & l.actionAt.isBiggerOrEqualValue(from))
          ..orderBy([(l) => OrderingTerm.desc(l.actionAt)]))
        .watch();
  }

  Stream<AdherenceStats> watchAdherence({int days = 30}) {
    final updates = db.tableUpdates(TableUpdateQuery.onAllTables(_watched)).asyncMap((_) => adherence(days: days));
    return startWith(() => adherence(days: days), updates);
  }

  /// Adherence over the last [days] days, including today's doses that are
  /// already resolved (taken, skipped, or past the missed window).
  Future<AdherenceStats> adherence({int days = 30, DateTime? now}) async {
    final n = now ?? DateTime.now();
    final today = dayStart(n);
    final start = today.subtract(Duration(days: days - 1));
    final occ = await _occurrencesBetween(start, today.add(const Duration(days: 1)));

    var expected = 0, taken = 0, onTime = 0;
    final per = <String, ({int expected, int taken})>{};
    final byDay = <DateTime, List<DoseOccurrence>>{};
    for (final o in occ) {
      byDay.putIfAbsent(dayStart(o.scheduledAt), () => []).add(o);
      final isToday = isSameDay(o.scheduledAt, n);
      if (isToday && !o.isResolved(n)) continue;
      expected++;
      final p = per[o.medication.id] ?? (expected: 0, taken: 0);
      final wasTaken = o.log?.status == DoseStatus.taken;
      per[o.medication.id] = (expected: p.expected + 1, taken: p.taken + (wasTaken ? 1 : 0));
      if (wasTaken) {
        taken++;
        if (o.log!.actionAt.difference(o.scheduledAt).abs() <= onTimeWindow) onTime++;
      }
    }

    final dayList = <DayAdherence>[];
    for (var i = 0; i < days; i++) {
      final d = start.add(Duration(days: i));
      final list = byDay[d] ?? const [];
      var e = 0, t = 0, late = 0, bad = 0;
      for (final o in list) {
        if (isSameDay(d, n) && !o.isResolved(n)) continue;
        e++;
        if (o.log?.status == DoseStatus.taken) {
          t++;
          if (o.log!.actionAt.difference(o.scheduledAt).abs() > onTimeWindow) late++;
        } else {
          bad++;
        }
      }
      dayList.add(DayAdherence(d, e, t, late, bad));
    }

    // Streak: consecutive complete days ending today (today counts only when
    // nothing resolved today was missed).
    var streak = 0;
    for (final d in dayList.reversed) {
      if (d.expected == 0) continue;
      if (d.skippedOrMissed > 0) break;
      if (d.complete) streak++;
    }

    return AdherenceStats(
      expected: expected,
      taken: taken,
      onTime: onTime,
      streakDays: streak,
      days: dayList,
      perMedication: per,
    );
  }
}
