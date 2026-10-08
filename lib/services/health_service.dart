import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

import '../data/db/app_database.dart';
import '../data/models/enums.dart';

class HealthSyncResult {
  HealthSyncResult({required this.imported, this.steps, this.error});
  final int imported;
  final int? steps;
  final String? error;
}

/// Reads vitals from Apple HealthKit (iOS) or Health Connect (Android) into
/// the local database. All processing happens on-device.
class HealthService {
  final _health = Health();
  bool _configured = false;

  static const _types = [
    HealthDataType.HEART_RATE,
    HealthDataType.STEPS,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_GLUCOSE,
  ];

  bool get isSupported => !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  VitalSource get source => Platform.isIOS ? VitalSource.healthKit : VitalSource.healthConnect;

  Future<void> _configure() async {
    if (_configured) return;
    await _health.configure();
    _configured = true;
  }

  Future<bool> isAvailable() async {
    if (!isSupported) return false;
    try {
      await _configure();
      return await _health.isHealthConnectAvailable();
    } catch (_) {
      return false;
    }
  }

  Future<void> installHealthConnect() => _health.installHealthConnect();

  Future<bool> requestAccess() async {
    if (!isSupported) return false;
    try {
      await _configure();
      return await _health.requestAuthorization(
        _types,
        permissions: _types.map((_) => HealthDataAccess.READ).toList(),
      );
    } catch (e) {
      debugPrint('Health authorization failed: $e');
      return false;
    }
  }

  /// Pulls readings since [since] (default: last 7 days) and converts them to
  /// rows for the vitals table. Steps are stored as one total per day.
  Future<(List<VitalsCompanion>, int?)> fetch({DateTime? since}) async {
    await _configure();
    final now = DateTime.now();
    final start = since ?? now.subtract(const Duration(days: 7));
    final points = await _health.getHealthDataFromTypes(
      types: const [
        HealthDataType.HEART_RATE,
        HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
        HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
        HealthDataType.BLOOD_GLUCOSE,
      ],
      startTime: start,
      endTime: now,
    );
    final deduped = _health.removeDuplicates(points);
    final rows = <VitalsCompanion>[];

    num? numeric(HealthDataPoint p) {
      final v = p.value;
      return v is NumericHealthValue ? v.numericValue : null;
    }

    final diastolicByTime = <int, num>{};
    for (final p in deduped.where((p) => p.type == HealthDataType.BLOOD_PRESSURE_DIASTOLIC)) {
      final v = numeric(p);
      if (v != null) diastolicByTime[p.dateFrom.millisecondsSinceEpoch] = v;
    }

    for (final p in deduped) {
      final v = numeric(p);
      if (v == null) continue;
      switch (p.type) {
        case HealthDataType.HEART_RATE:
          rows.add(_row(VitalType.heartRate, v.toDouble(), null, 'bpm', p.dateFrom));
        case HealthDataType.BLOOD_PRESSURE_SYSTOLIC:
          final dia = diastolicByTime[p.dateFrom.millisecondsSinceEpoch];
          rows.add(_row(VitalType.bloodPressure, v.toDouble(), dia?.toDouble(), 'mmHg', p.dateFrom));
        case HealthDataType.BLOOD_GLUCOSE:
          rows.add(_row(VitalType.bloodGlucose, v.toDouble(), null, 'mg/dL', p.dateFrom));
        default:
          break;
      }
    }

    // One steps total per day, stamped at the start of that day.
    int? todaySteps;
    for (var d = DateTime(start.year, start.month, start.day); !d.isAfter(now); d = d.add(const Duration(days: 1))) {
      final end = d.add(const Duration(days: 1));
      final steps = await _health.getTotalStepsInInterval(d, end.isAfter(now) ? now : end);
      if (steps == null) continue;
      rows.add(_row(VitalType.steps, steps.toDouble(), null, 'steps', d));
      if (d.year == now.year && d.month == now.month && d.day == now.day) todaySteps = steps;
    }
    return (rows, todaySteps);
  }

  VitalsCompanion _row(VitalType type, double v, double? v2, String unit, DateTime at) => VitalsCompanion.insert(
    id: '',
    type: type,
    value: v,
    value2: Value(v2),
    unit: unit,
    recordedAt: at,
    source: source,
  );
}
