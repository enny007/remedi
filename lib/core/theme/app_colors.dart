import 'package:flutter/material.dart';

/// Color tokens from the "Clinical Clarity & Compassionate Care" design system
/// (Stitch project "Offline Multilingual Pill Reminder").
abstract final class AppColors {
  static const surface = Color(0xFFFAF8FF);
  static const surfaceDim = Color(0xFFD2D9F4);
  static const surfaceBright = Color(0xFFFAF8FF);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF2F3FF);
  static const surfaceContainer = Color(0xFFEAEDFF);
  static const surfaceContainerHigh = Color(0xFFE2E7FF);
  static const surfaceContainerHighest = Color(0xFFDAE2FD);
  static const surfaceVariant = Color(0xFFDAE2FD);
  static const onSurface = Color(0xFF131B2E);
  static const onSurfaceVariant = Color(0xFF3E4947);
  static const inverseSurface = Color(0xFF283044);
  static const inverseOnSurface = Color(0xFFEEF0FF);
  static const outline = Color(0xFF6E7977);
  static const outlineVariant = Color(0xFFBDC9C6);

  static const primary = Color(0xFF005C55);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFF0F766E);
  static const onPrimaryContainer = Color(0xFFA3FAEF);
  static const inversePrimary = Color(0xFF80D5CB);
  static const primaryFixed = Color(0xFF9CF2E8);
  static const primaryFixedDim = Color(0xFF80D5CB);
  static const onPrimaryFixed = Color(0xFF00201D);
  static const onPrimaryFixedVariant = Color(0xFF00504A);

  static const secondary = Color(0xFF59605D);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFFDAE1DD);
  static const onSecondaryContainer = Color(0xFF5D6461);
  static const secondaryFixed = Color(0xFFDDE4E0);
  static const onSecondaryFixed = Color(0xFF161D1B);

  static const tertiary = Color(0xFF913200);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFFB94200);
  static const onTertiaryContainer = Color(0xFFFFE5DC);
  static const tertiaryFixed = Color(0xFFFFDBCE);
  static const tertiaryFixedDim = Color(0xFFFFB599);
  static const onTertiaryFixed = Color(0xFF370E00);
  static const onTertiaryFixedVariant = Color(0xFF7F2B00);

  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);

  /// Soft ambient lift used on Level 1 cards.
  static const cardShadow = [
    BoxShadow(color: Color(0x0D0F172A), blurRadius: 3, offset: Offset(0, 1)),
  ];

  static const raisedShadow = [
    BoxShadow(color: Color(0x140F172A), blurRadius: 12, offset: Offset(0, 4)),
  ];
}
