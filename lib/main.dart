import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/localization_fallback.dart';
import 'app/router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/time_utils.dart';
import 'data/db/app_database.dart';
import 'l10n/app_localizations.dart';
import 'providers/providers.dart';
import 'services/notification_service.dart';
import 'services/settings_service.dart';
import 'widgets/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  final settings = await SettingsService.load();
  final notifications = NotificationService();
  await notifications.init();

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(AppDatabase()),
        settingsProvider.overrideWithValue(settings),
        notificationServiceProvider.overrideWithValue(notifications),
      ],
      child: const RemediApp(),
    ),
  );
}

class RemediApp extends ConsumerStatefulWidget {
  const RemediApp({super.key});

  @override
  ConsumerState<RemediApp> createState() => _RemediAppState();
}

class _RemediAppState extends ConsumerState<RemediApp>
    with WidgetsBindingObserver {
  late final GoRouter _router = buildRouter();
  StreamSubscription<NotificationTap>? _tapSub;

  /// Taps that arrive during the splash or onboarding are replayed once the
  /// user reaches the main app, so the splash never navigates over them.
  NotificationTap? _pendingTap;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final notif = ref.read(notificationServiceProvider);
    _tapSub = notif.taps.listen(_queueTap);
    _pendingTap = notif.launchTap;
    notif.launchTap = null;
    _router.routerDelegate.addListener(_flushPendingTap);
  }

  bool get _inMainApp {
    final path = _router.routerDelegate.currentConfiguration.uri.path;
    return path != '/splash' && path != '/welcome';
  }

  void _queueTap(NotificationTap tap) {
    _pendingTap = tap;
    _flushPendingTap();
  }

  void _flushPendingTap() {
    final tap = _pendingTap;
    if (tap == null || !_inMainApp) return;
    _pendingTap = null;
    unawaited(_handleTap(tap));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _router.routerDelegate.removeListener(_flushPendingTap);
    _tapSub?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(ref.read(alarmSyncProvider).resync());
    }
  }

  /// The daily alarm payload carries only the schedule id; resolve which day's
  /// dose it refers to (a late tap after midnight belongs to yesterday).
  DateTime? _resolveAt(NotificationTap tap) {
    if (tap.scheduledAt != null) return tap.scheduledAt;
    return null;
  }

  Future<void> _handleTap(NotificationTap tap) async {
    if (!ref.read(settingsProvider).onboarded) return;
    switch (tap.kind) {
      case NotificationKind.refill:
        _router.push('/medication/${tap.targetId}');
      case NotificationKind.caregiver:
        _router.push(
          _alarmPath(tap.targetId, tap.scheduledAt, caregiver: true),
        );
      case NotificationKind.dose:
      case NotificationKind.snooze:
        final at = _resolveAt(tap) ?? await _latestOccurrenceTime(tap.targetId);
        if (tap.actionId == actionTake || tap.actionId == actionSnooze) {
          await _quickAction(tap, at);
        } else {
          _router.push(_alarmPath(tap.targetId, at));
        }
    }
  }

  Future<DateTime?> _latestOccurrenceTime(String scheduleId) async {
    final repo = ref.read(doseRepoProvider);
    final now = DateTime.now();
    for (final day in [now, now.subtract(const Duration(days: 1))]) {
      final occ = await repo.occurrencesForDay(day);
      final match = occ.where(
        (o) =>
            o.schedule.id == scheduleId &&
            !o.scheduledAt.isAfter(now.add(const Duration(hours: 1))),
      );
      if (match.isNotEmpty) return match.last.scheduledAt;
    }
    return null;
  }

  String _alarmPath(String scheduleId, DateTime? at, {bool caregiver = false}) {
    final q = <String, String>{
      if (at != null) 'at': at.toIso8601String(),
      if (caregiver) 'cg': '1',
    };
    return Uri(
      path: '/alarm/$scheduleId',
      queryParameters: q.isEmpty ? null : q,
    ).toString();
  }

  Future<void> _quickAction(NotificationTap tap, DateTime? at) async {
    if (at == null) return;
    final occ = await ref
        .read(doseRepoProvider)
        .findOccurrence(tap.targetId, at);
    if (occ == null) return;
    final actions = ref.read(doseActionsProvider);
    final l = ref.read(stringsProvider);
    final ctx = rootNavigatorKey.currentContext;
    if (tap.actionId == actionTake) {
      await actions.markTaken(occ);
      HapticFeedback.mediumImpact();
      if (ctx != null && ctx.mounted) {
        showToast(ctx, l.toastDoseLogged(occ.medication.name));
      }
    } else {
      final until = await actions.snooze(occ);
      if (ctx != null && ctx.mounted) {
        showToast(
          ctx,
          until == null
              ? l.snoozeLimitReached
              : l.toastSnoozedUntil(formatTime(ctx, until)),
        );
      }
    }
    _router.go('/schedule');
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    // Keep the alarm sync listeners alive for the app's lifetime.
    ref.watch(alarmSyncProvider);
    return MaterialApp.router(
      title: 'Remedi',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ...fallbackLocalizationDelegates,
      ],
      routerConfig: _router,
      builder: (context, child) {
        // Respect the user's text size but cap it so dosage cards never break.
        final mq = MediaQuery.of(context);
        return MediaQuery(
          data: mq.copyWith(
            textScaler: mq.textScaler.clamp(
              minScaleFactor: 1,
              maxScaleFactor: 1.4,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
