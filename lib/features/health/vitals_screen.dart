import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time_utils.dart';
import '../../data/db/app_database.dart';
import '../../data/models/enums.dart';
import '../../providers/providers.dart';
import '../../widgets/common.dart';
import 'vital_widgets.dart';

const stepGoal = 7000;

/// Syncs wearable/phone health data into the local vitals table.
class HealthSyncController extends Notifier<AsyncValue<DateTime?>> {
  @override
  AsyncValue<DateTime?> build() => AsyncData(ref.read(settingsProvider).healthSyncedAt);

  Future<String?> sync({bool interactive = true}) async {
    final health = ref.read(healthServiceProvider);
    final settings = ref.read(settingsProvider);
    if (!health.isSupported) return 'unsupported';
    state = const AsyncLoading();
    try {
      if (!await health.isAvailable()) {
        state = AsyncData(settings.healthSyncedAt);
        return 'unavailable';
      }
      if (interactive || !settings.healthConnected) {
        final ok = await health.requestAccess();
        await settings.setHealthConnected(ok);
        if (!ok) {
          state = AsyncData(settings.healthSyncedAt);
          return 'denied';
        }
      }
      final last = settings.healthSyncedAt;
      final since = last == null ? null : dayStart(last).subtract(const Duration(days: 1));
      final (rows, _) = await health.fetch(since: since);
      await ref.read(healthRepoProvider).importVitals(rows);
      final now = DateTime.now();
      await settings.setHealthSyncedAt(now);
      state = AsyncData(now);
      return null;
    } catch (e, st) {
      state = AsyncError(e, st);
      return 'error';
    }
  }
}

final healthSyncProvider = NotifierProvider<HealthSyncController, AsyncValue<DateTime?>>(HealthSyncController.new);

final vitalCountProvider = FutureProvider<int>((ref) {
  ref.watch(healthSyncProvider);
  ref.watch(vitalsProvider(VitalType.bloodPressure));
  return ref.read(healthRepoProvider).countVitals();
});

class VitalsScreen extends ConsumerStatefulWidget {
  const VitalsScreen({super.key});

  @override
  ConsumerState<VitalsScreen> createState() => _VitalsScreenState();
}

class _VitalsScreenState extends ConsumerState<VitalsScreen> {
  @override
  void initState() {
    super.initState();
    final settings = ref.read(settingsProvider);
    if (settings.healthConnected && settings.backgroundReading) {
      WidgetsBinding.instance.addPostFrameCallback((_) => ref.read(healthSyncProvider.notifier).sync(interactive: false));
    }
  }

  Future<void> _sync() async {
    final l = context.l10n;
    final err = await ref.read(healthSyncProvider.notifier).sync();
    if (!mounted) return;
    switch (err) {
      case null:
        showToast(context, l.healthSynced);
      case 'unavailable':
        showToast(context, Platform.isAndroid ? l.healthConnectMissing : l.healthUnavailable, icon: Symbols.error);
        if (Platform.isAndroid) await ref.read(healthServiceProvider).installHealthConnect();
      case 'denied':
        showToast(context, l.healthDenied, icon: Symbols.lock);
      default:
        showToast(context, l.healthUnavailable, icon: Symbols.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final syncState = ref.watch(healthSyncProvider);
    final settings = ref.watch(settingsProvider);
    final hr = ref.watch(vitalsProvider(VitalType.heartRate)).value ?? const <Vital>[];
    final steps = ref.watch(vitalsProvider(VitalType.steps)).value ?? const <Vital>[];
    final bp = ref.watch(vitalsProvider(VitalType.bloodPressure)).value ?? const <Vital>[];
    final sugar = ref.watch(vitalsProvider(VitalType.bloodGlucose)).value ?? const <Vital>[];
    final logs = ref.watch(dayOccurrencesProvider(ref.watch(todayProvider))).value ?? const [];
    final count = ref.watch(vitalCountProvider).value ?? 0;
    final connected = settings.healthConnected;
    final platformName = Platform.isIOS ? 'Apple Health' : 'Health Connect';
    final syncedAt = syncState.value;

    final now = DateTime.now();
    final hrWeek = hr.where((v) => v.recordedAt.isAfter(now.subtract(const Duration(days: 7)))).toList();
    final hrValues = hrWeek.reversed.map((v) => v.value).toList();
    final todaySteps = steps.where((v) => isSameDay(v.recordedAt, now)).map((v) => v.value).fold<double>(0, (a, b) => a > b ? a : b);
    final latestBp = bp.where((v) => v.value2 != null).firstOrNull;

    // Most recent dose taken before the latest BP reading (same day).
    final takenToday = logs.where((o) => o.log?.actionAt != null).toList();
    String? bpContext;
    if (latestBp != null) {
      final before = takenToday.where((o) => o.log!.actionAt.isBefore(latestBp.recordedAt)).toList()
        ..sort((a, b) => b.log!.actionAt.compareTo(a.log!.actionAt));
      if (before.isNotEmpty) {
        final mins = latestBp.recordedAt.difference(before.first.log!.actionAt).inMinutes;
        bpContext = l.bpAfterDose(mins.toString(), before.first.medication.name);
      }
    }

    return Scaffold(
      appBar: RemediHeader(subtitle: l.vitalsAndSync, showBack: true),
      body: PageBody(
        children: [
          SurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const IconTile(icon: Symbols.favorite, size: 32, iconSize: 18, circle: true, fill: 1, background: AppColors.errorContainer, foreground: AppColors.error),
                        if (connected) const Positioned(top: -1, right: -1, child: PulseDot(color: AppColors.primary, size: 10)),
                      ],
                    ),
                    const SizedBox(width: Space.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(platformName, style: AppText.headlineSm),
                          Text(connected ? l.connectedActive : l.notConnected, style: AppText.labelSm.copyWith(color: connected ? AppColors.primary : AppColors.tertiary)),
                        ],
                      ),
                    ),
                    FilledButton.tonalIcon(
                      style: FilledButton.styleFrom(backgroundColor: AppColors.surfaceContainerLow, foregroundColor: AppColors.primary, minimumSize: const Size(0, 40)),
                      onPressed: syncState.isLoading ? null : _sync,
                      icon: syncState.isLoading
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Symbols.sync, size: 16),
                      label: Text(connected ? l.syncNow : l.connect, style: AppText.labelSm),
                    ),
                  ],
                ),
                const SizedBox(height: Space.sm),
                Row(
                  children: [
                    const Icon(Symbols.shield_lock, size: 16, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Expanded(child: Text(l.onDeviceOnly, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant))),
                    if (syncedAt != null) Text(formatTime(context, syncedAt), style: AppText.labelSm.copyWith(color: AppColors.secondary)),
                  ],
                ),
              ],
            ),
          ),
          SurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const IconTile(icon: Symbols.ecg_heart, size: 28, iconSize: 18, background: AppColors.surfaceContainerHigh),
                    const SizedBox(width: Space.xs + 2),
                    Expanded(child: Text(l.restingHeartRate, style: AppText.labelLg)),
                    if (hrWeek.isNotEmpty)
                      Pill(
                        label: l.bpmRange(
                          hrWeek.map((v) => v.value).reduce((a, b) => a < b ? a : b).round().toString(),
                          hrWeek.map((v) => v.value).reduce((a, b) => a > b ? a : b).round().toString(),
                        ),
                        background: AppColors.surfaceContainer,
                        foreground: AppColors.onSecondaryContainer,
                      ),
                  ],
                ),
                const SizedBox(height: Space.xs),
                Text.rich(
                  TextSpan(
                    text: hrWeek.isEmpty ? '—' : (hrWeek.map((v) => v.value).reduce((a, b) => a + b) / hrWeek.length).round().toString(),
                    children: [TextSpan(text: '  ${l.bpmAvg7d}', style: AppText.labelLg.copyWith(color: AppColors.onSurfaceVariant))],
                  ),
                  style: AppText.displayLgMobile,
                ),
                if (hrValues.length >= 2) ...[const SizedBox(height: Space.xs), Sparkline(values: hrValues.length > 60 ? hrValues.sublist(hrValues.length - 60) : hrValues)],
                if (hrWeek.isEmpty)
                  Text(connected ? l.noHeartData : l.connectToSeeHeart, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          SurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const IconTile(icon: Symbols.directions_walk, size: 28, iconSize: 18, background: AppColors.surfaceContainerHigh),
                    const SizedBox(width: Space.xs + 2),
                    Expanded(child: Text(l.dailyMobility, style: AppText.labelLg)),
                    Pill(label: l.goalSteps('7,000'), background: AppColors.primaryFixed, foreground: AppColors.onPrimaryFixed),
                  ],
                ),
                const SizedBox(height: Space.xs),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: todaySteps.round().toString(),
                              children: [TextSpan(text: '  ${l.steps.toLowerCase()}', style: AppText.labelLg.copyWith(color: AppColors.onSurfaceVariant))],
                            ),
                            style: AppText.displayLgMobile,
                          ),
                          Text(
                            l.stepsDistance((todaySteps * 0.0007).toStringAsFixed(1)),
                            style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                    ProgressRing(
                      value: todaySteps / stepGoal,
                      size: 56,
                      stroke: 5,
                      child: Text('${(todaySteps * 100 / stepGoal).clamp(0, 999).round()}%', style: AppText.labelMd.copyWith(color: AppColors.primary)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(l.pillVitalsHarmony, style: AppText.headlineSm)),
                    const Icon(Symbols.insights, color: AppColors.primary),
                  ],
                ),
                const SizedBox(height: Space.sm),
                Container(
                  padding: const EdgeInsets.all(Space.sm),
                  decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(Radii.md)),
                  child: Row(
                    children: [
                      const Icon(Symbols.lock, size: 18, color: AppColors.primary),
                      const SizedBox(width: Space.xs + 2),
                      Expanded(child: Text(l.harmonyPrivacy, style: AppText.labelSm)),
                    ],
                  ),
                ),
                const SizedBox(height: Space.sm),
                if (latestBp == null)
                  Text(l.noVitalsYet, style: AppText.bodySm.copyWith(color: AppColors.onSurfaceVariant))
                else
                  Container(
                    padding: const EdgeInsets.all(Space.sm),
                    decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Symbols.cardiology, size: 18, color: AppColors.primary),
                            const SizedBox(width: 6),
                            Expanded(child: Text(l.bloodPressureCheck, style: AppText.labelLg)),
                            Pill(
                              label: l.bpCategory(classifyBp(latestBp.value, latestBp.value2!)),
                              background: AppColors.surfaceContainerLowest,
                              foreground: bpColor(classifyBp(latestBp.value, latestBp.value2!)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('${latestBp.value.round()} / ${latestBp.value2!.round()}', style: AppText.headlineMd),
                            Text(' mmHg', style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                            const Spacer(),
                            Text(formatTime(context, latestBp.recordedAt), style: AppText.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                        if (bpContext != null) Text(bpContext, style: AppText.bodySm.copyWith(color: AppColors.secondary)),
                        if (bp.length >= 2) ...[
                          const SizedBox(height: Space.sm),
                          Sparkline(values: bp.reversed.map((v) => v.value).toList(), height: 40),
                        ],
                      ],
                    ),
                  ),
                if (sugar.isNotEmpty) ...[
                  const SizedBox(height: Space.sm),
                  Container(
                    padding: const EdgeInsets.all(Space.sm),
                    decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
                    child: Row(
                      children: [
                        const Icon(Symbols.bloodtype, size: 18, color: AppColors.tertiary),
                        const SizedBox(width: 6),
                        Expanded(child: Text(l.bloodSugar, style: AppText.labelLg)),
                        Text('${sugar.first.value.round()} ${sugar.first.unit}', style: AppText.headlineSm),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: Space.sm),
                AppButton(label: l.logBpOrSugar, icon: Symbols.add_circle, tone: ButtonTone.tonal, height: 48, onPressed: () => showLogVitalSheet(context)),
              ],
            ),
          ),
          SurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const IconTile(icon: Symbols.database, size: 32, iconSize: 20, background: AppColors.surfaceContainerHigh),
                    const SizedBox(width: Space.xs + 4),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.offlineBiometricCache, style: AppText.headlineSm),
                          Text(l.biometricPoints(count.toString()), style: AppText.bodySm.copyWith(color: AppColors.secondary)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Space.sm),
                Container(
                  decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(Radii.md)),
                  child: SwitchListTile(
                    value: settings.backgroundReading,
                    onChanged: (v) async {
                      await settings.setBackgroundReading(v);
                      setState(() {});
                    },
                    title: Text(l.autoSyncOnOpen, style: AppText.labelLg),
                    subtitle: Text(l.autoSyncOnOpenHint, style: AppText.bodySm.copyWith(color: AppColors.secondary)),
                  ),
                ),
                const SizedBox(height: Space.sm),
                AppButton(
                  label: l.generateClinicalReport,
                  icon: Symbols.clinical_notes,
                  tone: ButtonTone.low,
                  height: 48,
                  onPressed: () => context.push('/summary'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
