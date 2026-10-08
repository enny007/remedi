import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/alarm/alarm_screen.dart';
import '../features/cabinet/cabinet_screen.dart';
import '../features/cabinet/medication_detail_screen.dart';
import '../features/health/health_screen.dart';
import '../features/health/vitals_screen.dart';
import '../features/intake/clinical_details_screen.dart';
import '../features/intake/fast_log_screen.dart';
import '../features/intake/routine_setup_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/onboarding/splash_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/schedule/schedule_screen.dart';
import '../features/summary/doctor_summary_screen.dart';
import 'app_shell.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter buildRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (_, _) => const SplashScreen()),
      GoRoute(path: '/welcome', builder: (_, _) => const OnboardingScreen()),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/schedule',
                builder: (_, _) => const ScheduleScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/log', builder: (_, _) => const FastLogScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/meds', builder: (_, _) => const CabinetScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/health',
                builder: (_, _) => const HealthScreen(),
                routes: [
                  GoRoute(
                    path: 'vitals',
                    builder: (_, _) => const VitalsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/alarm/:scheduleId',
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (_, state) => MaterialPage(
          fullscreenDialog: true,
          child: AlarmScreen(
            scheduleId: state.pathParameters['scheduleId']!,
            scheduledAt: DateTime.tryParse(
              state.uri.queryParameters['at'] ?? '',
            ),
            caregiverPrompt: state.uri.queryParameters['cg'] == '1',
          ),
        ),
      ),
      GoRoute(
        path: '/medication/:id',
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, state) =>
            MedicationDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/add/routine',
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, _) => const RoutineSetupScreen(),
      ),
      GoRoute(
        path: '/add/details',
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, _) => const ClinicalDetailsScreen(),
      ),
      GoRoute(
        path: '/summary',
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, _) => const DoctorSummaryScreen(),
      ),
      GoRoute(
        path: '/profile',
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, _) => const ProfileScreen(),
      ),
    ],
  );
}
