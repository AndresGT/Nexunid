import 'package:flutter/material.dart';

class ThemeBuilder {
  static ThemeData buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color onPrimary,
    required Color primaryContainer,
    required Color secondary,
    required Color background,
    required Color surface,
    required Color onSurface,
    required Color surfaceVariant,
    required Color outline,
    required Color error,
    required Color textColor,
  }) {
    final isDark = brightness == Brightness.dark;
    final baseTheme = ThemeData(brightness: brightness, useMaterial3: true);

    return baseTheme.copyWith(
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: textColor,
        secondary: secondary,
        onSecondary: isDark ? textColor : Colors.white,
        background: background,
        onBackground: onSurface,
        surface: surface,
        onSurface: onSurface,
        surfaceVariant: surfaceVariant,
        onSurfaceVariant: onSurface,
        outline: outline,
        error: error,
        onError: isDark ? textColor : Colors.white,
      ),

      scaffoldBackgroundColor: background,
      dividerColor: outline,

      textTheme: baseTheme.textTheme.apply(
        bodyColor: onSurface,
        displayColor: onSurface,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: onSurface,
        elevation: 0,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black.withOpacity(0.2),
      ),
    );
  }
}
