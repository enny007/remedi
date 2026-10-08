import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/catalog/drug_catalog.dart';
import '../../data/models/enums.dart';
import '../../data/models/medication_draft.dart';
import '../../providers/providers.dart';

/// Holds the medication being added or edited across the intake screens.
class DraftController extends Notifier<MedicationDraft> {
  @override
  MedicationDraft build() => const MedicationDraft();

  void start(MedicationDraft draft) => state = draft;

  void update(MedicationDraft Function(MedicationDraft d) f) => state = f(state);

  void setFrequency(Frequency f) => state = state.withFrequency(f);

  void setTime(int index, int hour, int minute) {
    final times = [...state.times];
    times[index] = times[index].copyWith(hour: hour, minute: minute);
    times.sort((a, b) => a.minutesOfDay.compareTo(b.minutesOfDay));
    state = state.copyWith(times: times);
  }

  void setAmount(int index, double amount) {
    final times = [...state.times];
    times[index] = times[index].copyWith(amount: amount);
    state = state.copyWith(times: times, doseAmount: index == 0 ? amount : null);
  }

  void addTime(int hour, int minute) {
    final times = [...state.times, DraftTime(hour: hour, minute: minute, amount: state.doseAmount)];
    times.sort((a, b) => a.minutesOfDay.compareTo(b.minutesOfDay));
    state = state.copyWith(times: times);
  }

  void removeTime(int index) {
    final times = [...state.times]..removeAt(index);
    state = state.copyWith(times: times);
  }

  void toggleSideEffect(String key) {
    final s = {...state.sideEffectWatch};
    s.contains(key) ? s.remove(key) : s.add(key);
    state = state.copyWith(sideEffectWatch: s);
  }

  /// Applies catalog defaults when the name matches a known medicine.
  void applyCatalog(CatalogDrug d, {String? strength}) {
    final base = MedicationDraft.fromCatalog(d, strength: strength);
    state = base.copyWith(
      prescriptionImagePath: state.prescriptionImagePath,
      stockCount: state.stockCount,
    );
  }

  Future<String> save() async {
    final id = await ref.read(medicationRepoProvider).save(state);
    return id;
  }
}

final draftProvider = NotifierProvider<DraftController, MedicationDraft>(DraftController.new);
