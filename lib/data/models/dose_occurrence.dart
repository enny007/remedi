import '../db/app_database.dart';
import 'enums.dart';

enum OccurrenceState { taken, skipped, snoozed, upcoming, due, overdue, missed }

/// Grace window after the scheduled time before an unlogged dose counts as missed.
const missedAfter = Duration(hours: 2);

/// Window before the scheduled time during which a dose is "due soon".
const dueWindow = Duration(minutes: 60);

/// One planned intake of a medication on a specific day.
class DoseOccurrence {
  DoseOccurrence({
    required this.medication,
    required this.schedule,
    required this.scheduledAt,
    this.log,
    this.snooze,
  });

  final Medication medication;
  final DoseSchedule schedule;
  final DateTime scheduledAt;
  final DoseLog? log;
  final Snooze? snooze;

  String get key => '${schedule.id}@${scheduledAt.toIso8601String()}';

  int get snoozeCount => snooze?.count ?? 0;

  OccurrenceState stateAt(DateTime now) {
    if (log != null) {
      return log!.status == DoseStatus.taken
          ? OccurrenceState.taken
          : log!.status == DoseStatus.skipped
          ? OccurrenceState.skipped
          : OccurrenceState.missed;
    }
    if (snooze != null && snooze!.snoozedUntil.isAfter(now)) return OccurrenceState.snoozed;
    if (now.isBefore(scheduledAt.subtract(dueWindow))) return OccurrenceState.upcoming;
    if (now.isBefore(scheduledAt)) return OccurrenceState.due;
    if (now.isBefore(scheduledAt.add(missedAfter))) return OccurrenceState.overdue;
    return OccurrenceState.missed;
  }

  bool isResolved(DateTime now) {
    final s = stateAt(now);
    return s == OccurrenceState.taken || s == OccurrenceState.skipped || s == OccurrenceState.missed;
  }

  /// When the dose should ring next (the scheduled time or the snooze end).
  DateTime get effectiveTime =>
      snooze != null && snooze!.snoozedUntil.isAfter(scheduledAt) ? snooze!.snoozedUntil : scheduledAt;
}

class MedicationWithSchedules {
  MedicationWithSchedules(this.medication, this.schedules, {this.condition});
  final Medication medication;
  final List<DoseSchedule> schedules;
  final Condition? condition;

  double get dailyUnits => schedules.fold(0.0, (a, s) => a + s.doseAmount);

  /// Whole days of supply left, or null when stock is not tracked.
  int? get daysLeft {
    final stock = medication.stockCount;
    if (stock == null) return null;
    final perDay = dailyUnits;
    if (perDay <= 0) return null;
    return (stock / perDay).floor();
  }

  bool get lowStock {
    final stock = medication.stockCount;
    return stock != null && stock <= medication.refillThreshold;
  }
}
