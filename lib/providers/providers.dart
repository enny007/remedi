import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utils/time_utils.dart';
import '../data/db/app_database.dart';
import '../data/models/dose_occurrence.dart';
import '../data/models/enums.dart';
import '../data/repositories/dose_repository.dart';
import '../data/repositories/health_repository.dart';
import '../data/repositories/medication_repository.dart';
import '../l10n/app_localizations.dart';
import '../services/capture_service.dart';
import '../services/export_service.dart';
import '../services/health_service.dart';
import '../services/notification_service.dart';
import '../services/settings_service.dart';

// ── Infrastructure (overridden in main) ─────────────────────────────────────

final databaseProvider = Provider<AppDatabase>((ref) => throw UnimplementedError('override in main'));
final settingsProvider = Provider<SettingsService>((ref) => throw UnimplementedError('override in main'));
final notificationServiceProvider = Provider<NotificationService>((ref) => throw UnimplementedError('override in main'));

final healthServiceProvider = Provider((ref) => HealthService());
final scanServiceProvider = Provider((ref) => ScanService());
final voiceServiceProvider = Provider((ref) => VoiceService());
final exportServiceProvider = Provider((ref) => ExportService());

// ── Repositories ────────────────────────────────────────────────────────────

final medicationRepoProvider = Provider((ref) => MedicationRepository(ref.watch(databaseProvider)));
final doseRepoProvider = Provider((ref) => DoseRepository(ref.watch(databaseProvider)));
final healthRepoProvider = Provider((ref) => HealthRepository(ref.watch(databaseProvider)));
final syncRepoProvider = Provider((ref) => SyncRepository(ref.watch(databaseProvider)));

// ── Clock ───────────────────────────────────────────────────────────────────

/// Ticks every 30 seconds so due/overdue states refresh on screen.
final clockProvider = StreamProvider<DateTime>((ref) async* {
  yield DateTime.now();
  yield* Stream.periodic(const Duration(seconds: 30), (_) => DateTime.now());
});

DateTime nowOf(Ref ref) => ref.watch(clockProvider).value ?? DateTime.now();

final todayProvider = Provider<DateTime>((ref) => dayStart(nowOf(ref)));

// ── Locale ──────────────────────────────────────────────────────────────────

const supportedLanguageCodes = ['en', 'yo', 'pcm', 'ig', 'ha'];

class LocaleController extends Notifier<Locale> {
  @override
  Locale build() {
    final saved = ref.read(settingsProvider).localeCode;
    return Locale(supportedLanguageCodes.contains(saved) ? saved! : 'en');
  }

  Future<void> set(String code) async {
    state = Locale(code);
    await ref.read(settingsProvider).setLocaleCode(code);
  }
}

final localeProvider = NotifierProvider<LocaleController, Locale>(LocaleController.new);

/// Strings for code that runs outside the widget tree (notifications).
final stringsProvider = Provider<AppLocalizations>((ref) => lookupAppLocalizations(ref.watch(localeProvider)));

// ── Data streams ────────────────────────────────────────────────────────────

final activeMedicationsProvider = StreamProvider<List<MedicationWithSchedules>>(
  (ref) => ref.watch(medicationRepoProvider).watchActive(),
);

final medicationProvider = StreamProvider.family<MedicationWithSchedules?, String>(
  (ref, id) => ref.watch(medicationRepoProvider).watchOne(id),
);

final dayOccurrencesProvider = StreamProvider.family<List<DoseOccurrence>, DateTime>(
  (ref, day) => ref.watch(doseRepoProvider).watchDay(day),
);

final todayOccurrencesProvider = Provider<AsyncValue<List<DoseOccurrence>>>(
  (ref) => ref.watch(dayOccurrencesProvider(ref.watch(todayProvider))),
);

final adherenceProvider = StreamProvider<AdherenceStats>(
  (ref) => ref.watch(doseRepoProvider).watchAdherence(days: 30),
);

final profileProvider = StreamProvider<Profile?>((ref) => ref.watch(healthRepoProvider).watchProfile());

final conditionsProvider = StreamProvider<List<Condition>>((ref) => ref.watch(healthRepoProvider).watchConditions());

final pendingSyncProvider = StreamProvider<int>((ref) => ref.watch(syncRepoProvider).watchPendingCount());

final vitalsProvider = StreamProvider.family<List<Vital>, VitalType>((ref, type) {
  final since = DateTime.now().subtract(const Duration(days: 30));
  return ref.watch(healthRepoProvider).watchVitals(type, since: since);
});

final symptomsProvider = StreamProvider<List<SymptomLog>>((ref) => ref.watch(healthRepoProvider).watchSymptoms());

// ── Derived: today's schedule ───────────────────────────────────────────────

class TodaySummary {
  TodaySummary(this.all, this.now);
  final List<DoseOccurrence> all;
  final DateTime now;

  List<DoseOccurrence> get taken => all.where((o) => o.stateAt(now) == OccurrenceState.taken).toList();
  List<DoseOccurrence> get resolved => all.where((o) => o.isResolved(now)).toList();
  List<DoseOccurrence> get open => all.where((o) => !o.isResolved(now)).toList();

  /// The most urgent unresolved dose: overdue first, then the next due.
  DoseOccurrence? get next {
    final o = open;
    if (o.isEmpty) return null;
    o.sort((a, b) => a.effectiveTime.compareTo(b.effectiveTime));
    return o.first;
  }

  List<DoseOccurrence> get later {
    final n = next;
    return open.where((o) => o != n).toList()..sort((a, b) => a.effectiveTime.compareTo(b.effectiveTime));
  }

  double get progress => all.isEmpty ? 0 : taken.length / all.length;
}

final todaySummaryProvider = Provider<AsyncValue<TodaySummary>>((ref) {
  final now = nowOf(ref);
  return ref.watch(todayOccurrencesProvider).whenData((list) => TodaySummary(list, now));
});

// ── Dose actions ────────────────────────────────────────────────────────────

class DoseActions {
  DoseActions(this.ref);
  final Ref ref;

  DoseRepository get _repo => ref.read(doseRepoProvider);
  NotificationService get _notif => ref.read(notificationServiceProvider);

  Future<String> markTaken(DoseOccurrence o) async {
    final id = await _repo.markTaken(o);
    await _notif.clearOccurrence(o);
    await ref.read(alarmSyncProvider).resync();
    await _checkRefill(o.medication.id);
    return id;
  }

  Future<void> undo(String logId) async {
    await _repo.undo(logId);
    await ref.read(alarmSyncProvider).resync();
  }

  Future<DateTime?> snooze(DoseOccurrence o) async {
    final until = await _repo.snooze(o);
    if (until != null) {
      await _notif.clearOccurrence(o);
      await _notif.scheduleSnooze(o, until, ref.read(stringsProvider));
      await ref.read(alarmSyncProvider).resync();
    }
    return until;
  }

  Future<void> skip(DoseOccurrence o, SkipReason reason, {String? note}) async {
    await _repo.skip(o, reason, note: note);
    await _notif.clearOccurrence(o);
    await ref.read(alarmSyncProvider).resync();
  }

  Future<void> takeAsNeeded(Medication med) async {
    await _repo.logAsNeeded(med, amount: med.doseAmount);
    await _checkRefill(med.id);
  }

  Future<void> _checkRefill(String medId) async {
    final m = await ref.read(medicationRepoProvider).loadOne(medId);
    if (m != null && m.lowStock) {
      await _notif.showRefillWarning(m, ref.read(stringsProvider));
    }
  }
}

final doseActionsProvider = Provider((ref) => DoseActions(ref));

// ── Alarm sync ──────────────────────────────────────────────────────────────

/// Keeps OS-level alarms in step with the database: daily alarms for every
/// reminder time and caregiver fail-safe prompts for the next 24 hours.
class AlarmSync {
  AlarmSync(this.ref);
  final Ref ref;
  Future<void>? _running;
  bool _again = false;

  Future<void> resync() async {
    if (_running != null) {
      _again = true;
      return _running;
    }
    _running = _run();
    try {
      await _running;
    } finally {
      _running = null;
    }
    if (_again) {
      _again = false;
      await resync();
    }
  }

  Future<void> _run() async {
    final notif = ref.read(notificationServiceProvider);
    final l = ref.read(stringsProvider);
    final meds = await ref.read(medicationRepoProvider).loadActive();
    final repo = ref.read(doseRepoProvider);
    final now = DateTime.now();
    final today = await repo.occurrencesForDay(now);
    final doneToday = today.where((o) => o.log != null).map((o) => o.schedule.id).toSet();
    await notif.syncDailyAlarms(meds, l, doneToday: doneToday);

    final profile = await ref.read(healthRepoProvider).getProfile();
    final occ = [...today, ...await repo.occurrencesForDay(now.add(const Duration(days: 1)))];
    final hasCaregiver = (profile?.caregiverPhone ?? '').trim().isNotEmpty;
    await notif.syncCaregiverPrompts(
      occ,
      enabled: hasCaregiver && (profile?.caregiverAlertsEnabled ?? false),
      delayMinutes: profile?.caregiverDelayMinutes ?? 20,
      caregiverName: profile?.caregiverName ?? profile?.caregiverPhone,
      l: l,
    );
  }
}

final alarmSyncProvider = Provider((ref) {
  final sync = AlarmSync(ref);
  // Re-arm whenever medicines, the profile, or the language change.
  ref.listen(activeMedicationsProvider, (_, _) => unawaited(sync.resync()));
  ref.listen(profileProvider, (_, _) => unawaited(sync.resync()));
  ref.listen(localeProvider, (_, _) => unawaited(sync.resync()));
  return sync;
});
