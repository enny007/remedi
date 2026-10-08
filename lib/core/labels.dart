import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter/widgets.dart';

import '../data/models/enums.dart';
import '../l10n/app_localizations.dart';

extension EnumLabels on AppLocalizations {
  String doseForm(DoseForm f) => switch (f) {
    DoseForm.tablet => formTablet,
    DoseForm.capsule => formCapsule,
    DoseForm.caplet => formCaplet,
    DoseForm.softgel => formSoftgel,
    DoseForm.liquid => formLiquid,
    DoseForm.drops => formDrops,
    DoseForm.injection => formInjection,
    DoseForm.inhaler => formInhaler,
    DoseForm.cream => formCream,
    DoseForm.sachet => formSachet,
  };

  /// "1 tablet", "2 capsules", "5 ml".
  String doseUnits(double amount, DoseForm f) {
    final n = amount == amount.roundToDouble() ? amount.toInt().toString() : amount.toStringAsFixed(1);
    final unit = switch (f) {
      DoseForm.liquid => unitMl,
      DoseForm.drops => unitDrops,
      DoseForm.injection => unitInjection,
      DoseForm.inhaler => unitPuffs,
      DoseForm.cream => unitApplication,
      DoseForm.sachet => unitSachet,
      _ => amount == 1 ? doseForm(f).toLowerCase() : unitPills,
    };
    return '$n $unit';
  }

  String frequency(Frequency f) => switch (f) {
    Frequency.once => freqOnce,
    Frequency.twice => freqTwice,
    Frequency.thrice => freqThrice,
    Frequency.prn => freqPrn,
  };

  String frequencyHint(Frequency f) => switch (f) {
    Frequency.once => freqOnceHint,
    Frequency.twice => freqTwiceHint,
    Frequency.thrice => freqThriceHint,
    Frequency.prn => freqPrnHint,
  };

  String meal(MealRelation m) => switch (m) {
    MealRelation.withMeal => mealWith,
    MealRelation.beforeFood => mealBefore,
    MealRelation.afterFood => mealAfter,
    MealRelation.emptyStomach => mealEmpty,
    MealRelation.waterOnly => mealWater,
    MealRelation.any => mealAny,
  };

  String mealHint(MealRelation m) => switch (m) {
    MealRelation.withMeal => mealWithHint,
    MealRelation.beforeFood => mealBeforeHint,
    MealRelation.afterFood => mealAfterHint,
    MealRelation.emptyStomach => mealEmptyHint,
    MealRelation.waterOnly => mealWaterHint,
    MealRelation.any => mealAnyHint,
  };

  String skipReason(SkipReason r) => switch (r) {
    SkipReason.stomachUpset => skipStomach,
    SkipReason.outOfStock => skipStock,
    SkipReason.doctorHold => skipDoctor,
    SkipReason.other => skipOther,
  };

  String slot(String s) => switch (s) {
    'breakfast' => slotBreakfast,
    'lunch' => slotLunch,
    'dinner' => slotDinner,
    'bedtime' => slotBedtime,
    _ => slotCustom,
  };

  String symptom(String key) => switch (key) {
    'nausea' => symptomNausea,
    'dizziness' => symptomDizziness,
    'dryCough' => symptomDryCough,
    'fatigue' => symptomFatigue,
    'headache' => symptomHeadache,
    'swelling' => symptomSwelling,
    'musclePain' => symptomMusclePain,
    'diarrhea' => symptomDiarrhea,
    'lowSugar' => symptomLowSugar,
    'rash' => symptomRash,
    'stomachPain' => symptomStomachPain,
    _ => key,
  };

  /// "Morning", "Afternoon", "Evening", "Night" for a time of day.
  String partOfDay(int hour) => hour < 12
      ? partMorning
      : hour < 17
      ? partAfternoon
      : hour < 21
      ? partEvening
      : partNight;
}

IconData formIcon(DoseForm f) => switch (f) {
  DoseForm.tablet || DoseForm.caplet => Symbols.pill,
  DoseForm.capsule || DoseForm.softgel => Symbols.medication,
  DoseForm.liquid => Symbols.medication_liquid,
  DoseForm.drops => Symbols.water_drop,
  DoseForm.injection => Symbols.syringe,
  DoseForm.inhaler => Symbols.pulmonology,
  DoseForm.cream => Symbols.healing,
  DoseForm.sachet => Symbols.inventory_2,
};

IconData mealIcon(MealRelation m) => switch (m) {
  MealRelation.withMeal => Symbols.restaurant,
  MealRelation.beforeFood => Symbols.schedule,
  MealRelation.afterFood => Symbols.free_breakfast,
  MealRelation.emptyStomach => Symbols.no_meals,
  MealRelation.waterOnly => Symbols.water_drop,
  MealRelation.any => Symbols.check,
};

IconData timeIcon(int hour) => hour < 12
    ? Symbols.light_mode
    : hour < 17
    ? Symbols.wb_sunny
    : hour < 21
    ? Symbols.wb_twilight
    : Symbols.bedtime;
