import 'dart:convert';

import '../catalog/drug_catalog.dart';
import '../db/app_database.dart';
import 'dose_occurrence.dart';
import 'enums.dart';

class DraftTime {
  const DraftTime({required this.hour, required this.minute, this.amount = 1, this.slot = 'custom'});
  final int hour;
  final int minute;
  final double amount;
  final String slot;

  DraftTime copyWith({int? hour, int? minute, double? amount, String? slot}) => DraftTime(
    hour: hour ?? this.hour,
    minute: minute ?? this.minute,
    amount: amount ?? this.amount,
    slot: slot ?? this.slot,
  );

  int get minutesOfDay => hour * 60 + minute;
}

/// Editable state for the add/edit medication flow.
class MedicationDraft {
  const MedicationDraft({
    this.id,
    this.name = '',
    this.strength = '',
    this.form = DoseForm.tablet,
    this.drugClass,
    this.doseAmount = 1,
    this.frequency = Frequency.twice,
    this.meal = MealRelation.withMeal,
    this.instructions,
    this.pillDescription,
    this.conditionId,
    this.conditionName,
    this.prescriberName,
    this.prescriberSpecialty,
    this.facility,
    this.prescriberPhone,
    this.rxNumber,
    this.prescriptionImagePath,
    this.stockCount,
    this.refillThreshold = 5,
    this.sideEffectWatch = const {},
    this.times = const [
      DraftTime(hour: 8, minute: 0, slot: 'breakfast'),
      DraftTime(hour: 20, minute: 0, slot: 'dinner'),
    ],
  });

  final String? id;
  final String name;
  final String strength;
  final DoseForm form;
  final String? drugClass;
  final double doseAmount;
  final Frequency frequency;
  final MealRelation meal;
  final String? instructions;
  final String? pillDescription;
  final String? conditionId;
  final String? conditionName;
  final String? prescriberName;
  final String? prescriberSpecialty;
  final String? facility;
  final String? prescriberPhone;
  final String? rxNumber;
  final String? prescriptionImagePath;
  final double? stockCount;
  final double refillThreshold;
  final Set<String> sideEffectWatch;
  final List<DraftTime> times;

  bool get isValid => name.trim().isNotEmpty && strength.trim().isNotEmpty;

  factory MedicationDraft.fromCatalog(CatalogDrug d, {String? strength}) {
    final times = d.frequency.defaultTimes
        .map((t) => DraftTime(hour: t.hour, minute: t.minute, slot: t.slot))
        .toList();
    return MedicationDraft(
      name: d.generic,
      strength: strength ?? d.strengths.first,
      form: d.form,
      drugClass: d.drugClass,
      frequency: d.frequency,
      meal: d.meal,
      sideEffectWatch: d.sideEffects.take(2).toSet(),
      times: times,
    );
  }

  factory MedicationDraft.fromExisting(MedicationWithSchedules m) {
    final med = m.medication;
    Set<String> watch = {};
    try {
      watch = (jsonDecode(med.sideEffectWatch) as List).cast<String>().toSet();
    } catch (_) {}
    return MedicationDraft(
      id: med.id,
      name: med.name,
      strength: med.strength,
      form: med.form,
      drugClass: med.drugClass,
      doseAmount: med.doseAmount,
      frequency: med.frequency,
      meal: med.mealRelation,
      instructions: med.instructions,
      pillDescription: med.pillDescription,
      conditionId: med.conditionId,
      conditionName: m.condition?.name,
      prescriberName: med.prescriberName,
      prescriberSpecialty: med.prescriberSpecialty,
      facility: med.facility,
      prescriberPhone: med.prescriberPhone,
      rxNumber: med.rxNumber,
      prescriptionImagePath: med.prescriptionImagePath,
      stockCount: med.stockCount,
      refillThreshold: med.refillThreshold,
      sideEffectWatch: watch,
      times: m.schedules
          .map((s) => DraftTime(hour: s.hour, minute: s.minute, amount: s.doseAmount, slot: s.slot))
          .toList(),
    );
  }

  /// Applies a new frequency and resets reminder times to that frequency's
  /// defaults, keeping the per-dose amount.
  MedicationDraft withFrequency(Frequency f) => copyWith(
    frequency: f,
    times: f.defaultTimes
        .map((t) => DraftTime(hour: t.hour, minute: t.minute, slot: t.slot, amount: doseAmount))
        .toList(),
  );

  MedicationDraft copyWith({
    String? name,
    String? strength,
    DoseForm? form,
    String? drugClass,
    double? doseAmount,
    Frequency? frequency,
    MealRelation? meal,
    String? instructions,
    String? pillDescription,
    String? conditionId,
    String? conditionName,
    String? prescriberName,
    String? prescriberSpecialty,
    String? facility,
    String? prescriberPhone,
    String? rxNumber,
    String? prescriptionImagePath,
    double? stockCount,
    bool clearStock = false,
    double? refillThreshold,
    Set<String>? sideEffectWatch,
    List<DraftTime>? times,
  }) {
    return MedicationDraft(
      id: id,
      name: name ?? this.name,
      strength: strength ?? this.strength,
      form: form ?? this.form,
      drugClass: drugClass ?? this.drugClass,
      doseAmount: doseAmount ?? this.doseAmount,
      frequency: frequency ?? this.frequency,
      meal: meal ?? this.meal,
      instructions: instructions ?? this.instructions,
      pillDescription: pillDescription ?? this.pillDescription,
      conditionId: conditionId ?? this.conditionId,
      conditionName: conditionName ?? this.conditionName,
      prescriberName: prescriberName ?? this.prescriberName,
      prescriberSpecialty: prescriberSpecialty ?? this.prescriberSpecialty,
      facility: facility ?? this.facility,
      prescriberPhone: prescriberPhone ?? this.prescriberPhone,
      rxNumber: rxNumber ?? this.rxNumber,
      prescriptionImagePath: prescriptionImagePath ?? this.prescriptionImagePath,
      stockCount: clearStock ? null : (stockCount ?? this.stockCount),
      refillThreshold: refillThreshold ?? this.refillThreshold,
      sideEffectWatch: sideEffectWatch ?? this.sideEffectWatch,
      times: times ?? this.times,
    );
  }
}

extension MedicationDisplay on Medication {
  String get displayName => '$name $strength'.trim();
}
