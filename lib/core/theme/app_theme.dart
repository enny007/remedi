import 'package:flutter/material.dart';

import 'app_colors.dart';

const _family = 'PlusJakartaSans';
const _fallback = ['NotoSansExt'];

/// Typography scale from the design system. Dosage values use the headline
/// styles so strengths are never misread.
abstract final class AppText {
  static const displayLg = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 32,
    fontWeight: FontWeight.w800,
    height: 40 / 32,
    letterSpacing: -0.64,
  );
  static const displayLgMobile = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 28,
    fontWeight: FontWeight.w800,
    height: 36 / 28,
    letterSpacing: -0.56,
  );
  static const headlineLg = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: -0.36,
  );
  static const headlineMd = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 28 / 20,
    letterSpacing: -0.2,
  );
  static const headlineSm = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 26 / 18,
    letterSpacing: -0.09,
  );
  static const bodyLg = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    height: 26 / 17,
  );
  static const bodyMd = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 22 / 15,
  );
  static const bodySm = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 18 / 13,
  );
  static const labelLg = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 20 / 14,
    letterSpacing: 0.28,
  );
  static const labelMd = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 16 / 12,
    letterSpacing: 0.48,
  );
  static const labelSm = TextStyle(
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 14 / 11,
    letterSpacing: 0.55,
  );
}

/// Spacing scale (4px baseline grid).
abstract final class Space {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const margin = 20.0;
  static const gutter = 16.0;
}

/// Corner radii.
abstract final class Radii {
  static const sm = 4.0;
  static const md = 8.0;
  static const lg = 12.0;
  static const xl = 16.0;
  static const xxl = 24.0;
}

ThemeData buildAppTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    primaryFixed: AppColors.primaryFixed,
    primaryFixedDim: AppColors.primaryFixedDim,
    onPrimaryFixed: AppColors.onPrimaryFixed,
    onPrimaryFixedVariant: AppColors.onPrimaryFixedVariant,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiary,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiaryContainer: AppColors.onTertiaryContainer,
    tertiaryFixed: AppColors.tertiaryFixed,
    tertiaryFixedDim: AppColors.tertiaryFixedDim,
    onTertiaryFixed: AppColors.onTertiaryFixed,
    onTertiaryFixedVariant: AppColors.onTertiaryFixedVariant,
    error: AppColors.error,
    onError: AppColors.onError,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    surfaceDim: AppColors.surfaceDim,
    surfaceBright: AppColors.surfaceBright,
    surfaceContainerLowest: AppColors.surfaceContainerLowest,
    surfaceContainerLow: AppColors.surfaceContainerLow,
    surfaceContainer: AppColors.surfaceContainer,
    surfaceContainerHigh: AppColors.surfaceContainerHigh,
    surfaceContainerHighest: AppColors.surfaceContainerHighest,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    inverseSurface: AppColors.inverseSurface,
    onInverseSurface: AppColors.inverseOnSurface,
    inversePrimary: AppColors.inversePrimary,
  );

  final base = ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    fontFamily: _family,
    fontFamilyFallback: _fallback,
    scaffoldBackgroundColor: AppColors.surface,
  );

  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Radii.lg),
    borderSide: BorderSide.none,
  );

  return base.copyWith(
    textTheme: base.textTheme.copyWith(
      displayLarge: AppText.displayLg,
      displayMedium: AppText.displayLgMobile,
      headlineLarge: AppText.headlineLg,
      headlineMedium: AppText.headlineMd,
      headlineSmall: AppText.headlineSm,
      titleLarge: AppText.headlineMd,
      titleMedium: AppText.headlineSm,
      titleSmall: AppText.labelLg,
      bodyLarge: AppText.bodyLg,
      bodyMedium: AppText.bodyMd,
      bodySmall: AppText.bodySm,
      labelLarge: AppText.labelLg,
      labelMedium: AppText.labelMd,
      labelSmall: AppText.labelSm,
    ).apply(bodyColor: AppColors.onSurface, displayColor: AppColors.onSurface),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceContainerLow,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: inputBorder,
      enabledBorder: inputBorder,
      focusedBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.primaryContainer, width: 1.5),
      ),
      errorBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      labelStyle: AppText.labelMd.copyWith(color: AppColors.onSurfaceVariant),
      hintStyle: AppText.bodyMd.copyWith(color: AppColors.outline),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        minimumSize: const Size.fromHeight(52),
        textStyle: AppText.labelLg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.lg)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.inverseSurface,
      contentTextStyle: AppText.bodySm.copyWith(color: AppColors.inverseOnSurface),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.lg)),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surfaceContainerLowest,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Radii.xl)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surfaceContainerLowest,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.xl)),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.sm)),
    ),
  );
}
