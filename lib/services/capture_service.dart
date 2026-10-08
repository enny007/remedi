import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// Camera/gallery capture with on-device OCR, fully offline: Apple Vision on
/// iOS (AppDelegate.swift) and Google ML Kit's bundled model on Android
/// (MainActivity.kt), both behind the `remedi/ocr` channel.
class ScanService {
  final _picker = ImagePicker();
  static const _ocr = MethodChannel('remedi/ocr');

  bool get ocrSupported => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  /// Captures an image and copies it into app storage so it survives cache
  /// clears. Returns the stored path.
  Future<String?> capture({required bool fromCamera}) async {
    final file = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 2000,
      imageQuality: 85,
    );
    if (file == null) return null;
    final dir = await getApplicationDocumentsDirectory();
    final target = Directory(p.join(dir.path, 'prescriptions'));
    await target.create(recursive: true);
    final dest = p.join(target.path, '${DateTime.now().millisecondsSinceEpoch}${p.extension(file.path)}');
    await File(file.path).copy(dest);
    return dest;
  }

  Future<String> recognizeText(String path) async {
    if (!ocrSupported) return '';
    try {
      return await _ocr.invokeMethod<String>('recognize', {'path': path}) ?? '';
    } on PlatformException catch (e) {
      debugPrint('OCR failed: ${e.message}');
      return '';
    }
  }
}

enum VoiceError { unavailable, permissionDenied, noMatch, network, other }

/// Speech-to-text for voice intake. Uses the device recognizer, which works
/// offline on most phones once the language pack is downloaded.
class VoiceService {
  final _stt = SpeechToText();
  bool _ready = false;

  Future<bool> init() async {
    if (_ready) return true;
    try {
      _ready = await _stt.initialize();
    } catch (_) {
      _ready = false;
    }
    return _ready;
  }

  /// Picks the best available recognizer locale for the app language.
  Future<String?> localeFor(String appLanguage) async {
    final ids = (await _stt.locales()).map((l) => l.localeId.replaceAll('-', '_')).toSet();
    final prefs = switch (appLanguage) {
      'yo' => ['yo_NG', 'en_NG'],
      'ig' => ['ig_NG', 'en_NG'],
      'ha' => ['ha_NG', 'en_NG'],
      _ => ['en_NG', 'en_GB', 'en_US'],
    };
    for (final pref in prefs) {
      if (ids.contains(pref)) return pref;
    }
    return null; // device default
  }

  /// Starts a listening session. [onDone] fires exactly once when the session
  /// ends for any reason (final result, silence, stop, or error).
  Future<void> listen({
    required void Function(String words, bool isFinal) onResult,
    required void Function(VoiceError? error) onDone,
    String? localeId,
  }) async {
    var finished = false;
    void finish([VoiceError? e]) {
      if (finished) return;
      finished = true;
      _stt.statusListener = null;
      _stt.errorListener = null;
      onDone(e);
    }

    _stt.statusListener = (status) {
      if (status == SpeechToText.doneStatus || status == SpeechToText.notListeningStatus) {
        // Give a pending final result a moment to arrive first.
        Future<void>.delayed(const Duration(milliseconds: 300), finish);
      }
    };
    _stt.errorListener = (e) {
      final msg = e.errorMsg;
      finish(switch (msg) {
        'error_no_match' || 'error_speech_timeout' => VoiceError.noMatch,
        'error_permission' || 'error_insufficient_permissions' => VoiceError.permissionDenied,
        'error_network' || 'error_network_timeout' || 'error_server' => VoiceError.network,
        _ => VoiceError.other,
      });
    };
    try {
      await _stt.listen(
        onResult: (r) {
          onResult(r.recognizedWords, r.finalResult);
          if (r.finalResult) finish();
        },
        listenOptions: SpeechListenOptions(
          localeId: localeId,
          listenFor: const Duration(seconds: 20),
          pauseFor: const Duration(seconds: 4),
          partialResults: true,
          cancelOnError: true,
          listenMode: ListenMode.dictation,
        ),
      );
    } catch (_) {
      finish(VoiceError.other);
    }
  }

  Future<void> stop() => _stt.stop();

  Future<void> cancel() => _stt.cancel();

  bool get isListening => _stt.isListening;

  /// True when the OS denied microphone or speech permission.
  Future<bool> get permissionDenied async => !(await _stt.hasPermission);
}
