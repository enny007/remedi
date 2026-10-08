/// Domain enums. Stored in SQLite by `name`, so never rename a value without
/// a migration (and a matching change in the Supabase schema).
library;

enum DoseForm { tablet, capsule, caplet, softgel, liquid, drops, injection, inhaler, cream, sachet }

enum Frequency { once, twice, thrice, prn }

enum MealRelation { withMeal, beforeFood, afterFood, emptyStomach, waterOnly, any }

enum DoseStatus { taken, skipped, missed }

enum SkipReason { stomachUpset, outOfStock, doctorHold, other }

enum VitalType { bloodPressure, bloodGlucose, heartRate, steps, weight }

enum VitalSource { manual, healthKit, healthConnect }

enum SyncOp { upsert, delete }

extension FrequencyX on Frequency {
  /// Default reminder times (hour, minute) and routine labels for a frequency.
  List<({int hour, int minute, String slot})> get defaultTimes => switch (this) {
    Frequency.once => [(hour: 8, minute: 0, slot: 'breakfast')],
    Frequency.twice => [
      (hour: 8, minute: 0, slot: 'breakfast'),
      (hour: 20, minute: 0, slot: 'dinner'),
    ],
    Frequency.thrice => [
      (hour: 8, minute: 0, slot: 'breakfast'),
      (hour: 13, minute: 0, slot: 'lunch'),
      (hour: 20, minute: 0, slot: 'dinner'),
    ],
    Frequency.prn => const [],
  };
}
