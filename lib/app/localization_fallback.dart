import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Flutter ships no Material/Cupertino strings for Yorùbá, Igbo, Hausa or
/// Nigerian Pidgin. These delegates serve the English framework strings (date
/// picker labels, tooltips) for those locales while the app's own strings stay
/// translated.
class _FallbackMaterial extends LocalizationsDelegate<MaterialLocalizations> {
  const _FallbackMaterial();
  @override
  bool isSupported(Locale locale) => !kMaterialSupportedLanguages.contains(locale.languageCode);
  @override
  Future<MaterialLocalizations> load(Locale locale) => GlobalMaterialLocalizations.delegate.load(const Locale('en'));
  @override
  bool shouldReload(_FallbackMaterial old) => false;
}

class _FallbackCupertino extends LocalizationsDelegate<CupertinoLocalizations> {
  const _FallbackCupertino();
  @override
  bool isSupported(Locale locale) => !kCupertinoSupportedLanguages.contains(locale.languageCode);
  @override
  Future<CupertinoLocalizations> load(Locale locale) => GlobalCupertinoLocalizations.delegate.load(const Locale('en'));
  @override
  bool shouldReload(_FallbackCupertino old) => false;
}

class _FallbackWidgets extends LocalizationsDelegate<WidgetsLocalizations> {
  const _FallbackWidgets();
  @override
  bool isSupported(Locale locale) => !kWidgetsSupportedLanguages.contains(locale.languageCode);
  @override
  Future<WidgetsLocalizations> load(Locale locale) => SynchronousFuture(const DefaultWidgetsLocalizations());
  @override
  bool shouldReload(_FallbackWidgets old) => false;
}

const fallbackLocalizationDelegates = <LocalizationsDelegate<dynamic>>[
  _FallbackMaterial(),
  _FallbackCupertino(),
  _FallbackWidgets(),
];
