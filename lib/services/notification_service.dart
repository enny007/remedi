import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../core/utils/ids.dart';
import '../core/utils/time_utils.dart';
import '../data/models/dose_occurrence.dart';
import '../data/models/medication_draft.dart';
import '../l10n/app_localizations.dart';

enum NotificationKind { dose, snooze, caregiver, refill }

/// A notification the user tapped (or one of its action buttons).
class NotificationTap {
  NotificationTap(this.kind, this.targetId, this.scheduledAt, this.actionId);
  final NotificationKind kind;

  /// Schedule id for dose/snooze/caregiver, medication id for refill.
  final String targetId;
  final DateTime? scheduledAt;
  final String? actionId;

  static NotificationTap? parse(String? payload, String? actionId) {
    if (payload == null) return null;
    final parts = payload.split('|');
    if (parts.length < 2) return null;
    final kind = NotificationKind.values.where((k) => k.name == parts[0]).firstOrNull;
    if (kind == null) return null;
    final at = parts.length > 2 ? DateTime.tryParse(parts[2]) : null;
    return NotificationTap(kind, parts[1], at, actionId);
  }
}

const actionTake = 'take';
const actionSnooze = 'snooze';
const _doseCategory = 'dose_actions';

/// Local, fully offline reminders:
/// * one repeating daily alarm per reminder time (survives reboots and does
///   not depend on the app being opened),
/// * one-off snooze alarms,
/// * one-off caregiver fail-safe prompts for the next 24 hours,
/// * refill warnings.
class NotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();
  final _taps = StreamController<NotificationTap>.broadcast();
  NotificationTap? launchTap;
  bool _ready = false;

  Stream<NotificationTap> get taps => _taps.stream;

  bool get _supported => !kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS);

  Future<void> init() async {
    if (!_supported) return;
    tzdata.initializeTimeZones();
    try {
      final info = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(info.identifier));
    } catch (_) {
      tz.setLocalLocation(tz.getLocation('Africa/Lagos'));
    }

    final darwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: [
        DarwinNotificationCategory(
          _doseCategory,
          actions: [
            DarwinNotificationAction.plain(actionTake, 'Taken', options: {DarwinNotificationActionOption.foreground}),
            DarwinNotificationAction.plain(actionSnooze, 'Snooze 15m', options: {DarwinNotificationActionOption.foreground}),
          ],
        ),
      ],
    );
    await _plugin.initialize(
      settings: InitializationSettings(
        android: const AndroidInitializationSettings('@drawable/ic_stat_remedi'),
        iOS: darwin,
      ),
      onDidReceiveNotificationResponse: (r) {
        final tap = NotificationTap.parse(r.payload, r.actionId);
        if (tap != null) _taps.add(tap);
      },
    );
    final launch = await _plugin.getNotificationAppLaunchDetails();
    if (launch?.didNotificationLaunchApp ?? false) {
      final r = launch!.notificationResponse;
      launchTap = NotificationTap.parse(r?.payload, r?.actionId);
    }
    _ready = true;
  }

  /// Asks for notification permission and, on Android, exact alarms. The
  /// full-screen alarm permission opens a settings page, so it is only
  /// requested when [fullScreen] is set (from the profile screen).
  Future<bool> requestPermissions({bool fullScreen = false}) async {
    if (!_ready) return false;
    final android = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final granted = await android.requestNotificationsPermission() ?? false;
      if (!(await android.canScheduleExactNotifications() ?? true)) {
        await android.requestExactAlarmsPermission();
      }
      if (fullScreen) await android.requestFullScreenIntentPermission();
      return granted;
    }
    final ios = _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
    return await ios?.requestPermissions(alert: true, badge: true, sound: true) ?? false;
  }

  NotificationDetails _doseDetails(AppLocalizations l) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'dose_alarms_v1',
        l.notifChannelDoses,
        channelDescription: l.notifChannelDosesDesc,
        importance: Importance.max,
        priority: Priority.max,
        category: AndroidNotificationCategory.alarm,
        fullScreenIntent: true,
        audioAttributesUsage: AudioAttributesUsage.alarm,
        visibility: NotificationVisibility.public,
        ticker: l.notifDoseTitle,
        // FLAG_INSISTENT: keep ringing until the user acts.
        additionalFlags: Int32List.fromList(<int>[4]),
        actions: [
          AndroidNotificationAction(actionTake, l.actionMarkTaken, showsUserInterface: true),
          AndroidNotificationAction(actionSnooze, l.actionSnooze15, showsUserInterface: true),
        ],
      ),
      iOS: const DarwinNotificationDetails(
        categoryIdentifier: _doseCategory,
        interruptionLevel: InterruptionLevel.timeSensitive,
        presentSound: true,
      ),
    );
  }

  NotificationDetails _infoDetails(AppLocalizations l) => NotificationDetails(
    android: AndroidNotificationDetails(
      'care_alerts_v1',
      l.notifChannelCare,
      channelDescription: l.notifChannelCareDesc,
      importance: Importance.high,
      priority: Priority.high,
    ),
    iOS: const DarwinNotificationDetails(interruptionLevel: InterruptionLevel.timeSensitive),
  );

  int _doseId(String scheduleId) => stableHash('dose:$scheduleId');
  int _snoozeId(String scheduleId) => stableHash('snooze:$scheduleId');
  int _caregiverId(String scheduleId, DateTime at) => stableHash('cg:$scheduleId:${at.toIso8601String()}');
  int _refillId(String medId) => stableHash('refill:$medId');

  String _doseBody(AppLocalizations l, MedicationWithSchedules m, double amount) =>
      l.notifDoseBody(m.medication.displayName, formatAmount(amount));

  /// Exact alarms need a user-granted permission on Android 12+; without it
  /// fall back to inexact delivery rather than failing to schedule at all.
  Future<AndroidScheduleMode> _mode({bool alarmClock = true}) async {
    final android = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    if (android == null) return AndroidScheduleMode.exactAllowWhileIdle;
    final exact = await android.canScheduleExactNotifications() ?? true;
    if (!exact) return AndroidScheduleMode.inexactAllowWhileIdle;
    return alarmClock ? AndroidScheduleMode.alarmClock : AndroidScheduleMode.exactAllowWhileIdle;
  }

  /// Reconciles the repeating daily alarms with the current medication list.
  /// Reminder times listed in [doneToday] were already taken or skipped, so
  /// their alarm starts tomorrow instead of ringing later today.
  Future<void> syncDailyAlarms(
    List<MedicationWithSchedules> meds,
    AppLocalizations l, {
    Set<String> doneToday = const {},
  }) async {
    if (!_ready) return;
    final mode = await _mode();
    final wanted = <int>{};
    for (final m in meds) {
      for (final s in m.schedules) {
        final id = _doseId(s.id);
        wanted.add(id);
        final now = tz.TZDateTime.now(tz.local);
        var at = tz.TZDateTime(tz.local, now.year, now.month, now.day, s.hour, s.minute);
        if (!at.isAfter(now) || doneToday.contains(s.id)) at = at.add(const Duration(days: 1));
        try {
          await _plugin.zonedSchedule(
            id: id,
            scheduledDate: at,
            notificationDetails: _doseDetails(l),
            androidScheduleMode: mode,
            title: l.notifDoseTitle,
            body: _doseBody(l, m, s.doseAmount),
            payload: 'dose|${s.id}',
            matchDateTimeComponents: DateTimeComponents.time,
          );
        } catch (e) {
          debugPrint('Failed to schedule dose alarm ${s.id}: $e');
        }
      }
    }
    final pending = await _plugin.pendingNotificationRequests();
    for (final p in pending) {
      if ((p.payload ?? '').startsWith('dose|') && !wanted.contains(p.id)) {
        await _plugin.cancel(id: p.id);
      }
    }
  }

  Future<void> scheduleSnooze(DoseOccurrence o, DateTime until, AppLocalizations l) async {
    if (!_ready) return;
    await _plugin.zonedSchedule(
      id: _snoozeId(o.schedule.id),
      scheduledDate: tz.TZDateTime.from(until, tz.local),
      notificationDetails: _doseDetails(l),
      androidScheduleMode: await _mode(),
      title: l.notifSnoozeTitle,
      body: l.notifDoseBody(o.medication.displayName, formatAmount(o.schedule.doseAmount)),
      payload: 'snooze|${o.schedule.id}|${o.scheduledAt.toIso8601String()}',
    );
  }

  /// Schedules caregiver fail-safe prompts for unresolved doses in the next
  /// 24 hours and clears prompts for doses that have been handled.
  Future<void> syncCaregiverPrompts(
    List<DoseOccurrence> occurrences, {
    required bool enabled,
    required int delayMinutes,
    required String? caregiverName,
    required AppLocalizations l,
  }) async {
    if (!_ready) return;
    final now = DateTime.now();
    final wanted = <int>{};
    final mode = await _mode(alarmClock: false);
    if (enabled && caregiverName != null) {
      for (final o in occurrences) {
        final fireAt = o.scheduledAt.add(Duration(minutes: delayMinutes));
        if (o.log != null || !fireAt.isAfter(now) || fireAt.difference(now) > const Duration(hours: 24)) continue;
        final id = _caregiverId(o.schedule.id, o.scheduledAt);
        wanted.add(id);
        await _plugin.zonedSchedule(
          id: id,
          scheduledDate: tz.TZDateTime.from(fireAt, tz.local),
          notificationDetails: _infoDetails(l),
          androidScheduleMode: mode,
          title: l.notifCaregiverTitle,
          body: l.notifCaregiverBody(o.medication.displayName, caregiverName),
          payload: 'caregiver|${o.schedule.id}|${o.scheduledAt.toIso8601String()}',
        );
      }
    }
    final pending = await _plugin.pendingNotificationRequests();
    for (final p in pending) {
      if ((p.payload ?? '').startsWith('caregiver|') && !wanted.contains(p.id)) {
        await _plugin.cancel(id: p.id);
      }
    }
  }

  /// Clears any ringing or pending snooze notification for an occurrence.
  Future<void> clearOccurrence(DoseOccurrence o) async {
    if (!_ready) return;
    await _plugin.cancel(id: _snoozeId(o.schedule.id));
    await _plugin.cancel(id: _caregiverId(o.schedule.id, o.scheduledAt));
    // Removes the delivered daily alarm from the tray; the repeating schedule
    // itself is re-armed by the next sync.
    final active = await _plugin.getActiveNotifications();
    for (final a in active) {
      if (a.id == _doseId(o.schedule.id)) {
        await _plugin.cancel(id: a.id!);
      }
    }
  }

  Future<void> showRefillWarning(MedicationWithSchedules m, AppLocalizations l) async {
    if (!_ready) return;
    await _plugin.show(
      id: _refillId(m.medication.id),
      title: l.notifRefillTitle,
      body: l.notifRefillBody(formatAmount(m.medication.stockCount ?? 0), m.medication.displayName),
      notificationDetails: _infoDetails(l),
      payload: 'refill|${m.medication.id}',
    );
  }
}
