import 'package:shared_preferences/shared_preferences.dart';

/// Small device-local preferences. Health data never goes here.
class SettingsService {
  SettingsService(this._prefs);
  final SharedPreferences _prefs;

  static Future<SettingsService> load() async => SettingsService(await SharedPreferences.getInstance());

  static const _kLocale = 'locale';
  static const _kOnboarded = 'onboarded';
  static const _kHealthSyncedAt = 'health_synced_at';
  static const _kBgReading = 'bg_reading';
  static const _kSyncedAt = 'cloud_synced_at';
  static const _kHealthConnected = 'health_connected';

  String? get localeCode => _prefs.getString(_kLocale);
  Future<void> setLocaleCode(String code) => _prefs.setString(_kLocale, code);

  bool get onboarded => _prefs.getBool(_kOnboarded) ?? false;
  Future<void> setOnboarded(bool v) => _prefs.setBool(_kOnboarded, v);

  DateTime? get healthSyncedAt => _date(_kHealthSyncedAt);
  Future<void> setHealthSyncedAt(DateTime t) => _prefs.setInt(_kHealthSyncedAt, t.millisecondsSinceEpoch);

  bool get healthConnected => _prefs.getBool(_kHealthConnected) ?? false;
  Future<void> setHealthConnected(bool v) => _prefs.setBool(_kHealthConnected, v);

  bool get backgroundReading => _prefs.getBool(_kBgReading) ?? true;
  Future<void> setBackgroundReading(bool v) => _prefs.setBool(_kBgReading, v);

  DateTime? get cloudSyncedAt => _date(_kSyncedAt);
  Future<void> setCloudSyncedAt(DateTime t) => _prefs.setInt(_kSyncedAt, t.millisecondsSinceEpoch);

  DateTime? _date(String k) {
    final v = _prefs.getInt(k);
    return v == null ? null : DateTime.fromMillisecondsSinceEpoch(v);
  }
}
