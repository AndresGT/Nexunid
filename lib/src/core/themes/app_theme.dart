import 'package:flutter/material.dart';

/// Defines the light and dark themes for the application, following Material 3 guidelines.
///
/// This utility class contains a defined color palette and static methods
/// to generate a consistent and complete `ThemeData`.
abstract final class AppThemes {
  //================================================================================
  // Color Palette
  //================================================================================

  // --- Primary Colors ---
  static const Color primaryLight = Color(0xFF6366F1); // Indigo 500
  static const Color primaryDark = Color(0xFF818CF8); // Indigo 400

  // --- Primary Containers (for subtle backgrounds of primary-related elements) ---
  static const Color primaryContainerLight = Color(0xFFE0E7FF); // Indigo 100
  static const Color primaryContainerDark = Color(0xFF3730A3); // Indigo 800

  // --- Secondary Colors ---
  static const Color secondaryLight = Color(0xFF0EA5E9); // Sky 500
  static const Color secondaryDark = Color(0xFF38BDF8); // Sky 400

  // --- Accent and Status Colors ---
  static const Color accentLight = Color(0xFFF59E0B); // Amber 500
  static const Color accentDark = Color(0xFFFBBF24); // Amber 400
  static const Color errorLight = Color(0xFFEF4444); // Red 500
  static const Color errorDark = Color(0xFFF87171); // Red 400

  // --- Background and Surface Colors ---
  static const Color backgroundLight = Color(0xFFF8FAFC); // Slate 50
  static const Color backgroundDark = Color(0xFF0F172A); // Slate 900
  static const Color surfaceLight = Color(0xFFFFFFFF); // White
  static const Color surfaceDark = Color(0xFF1E293B); // Slate 800

  // --- Surface Variant Colors (for components like Cards, Dialogs, etc., that stand out from the background) ---
  static const Color surfaceVariantLight = Color(0xFFF1F5F9); // Slate 100
  static const Color surfaceVariantDark = Color(0xFF334155); // Slate 700

  // --- "On" Colors for Text and Content ---
  static const Color onPrimaryLight = Colors.white;
  static const Color onPrimaryDark = Color(0xFF1E293B);
  static const Color textLight = Color(0xFF0F172A); // Slate 900
  static const Color textDark = Color(0xFFE2E8F0); // Slate 200

  // --- Border and Divider Colors ---
  static const Color outlineLight = Color(0xFFCBD5E1); // Slate 300
  static const Color outlineDark = Color(0xFF475569); // Slate 600

  /// Base method for building a `ThemeData`. It centralizes the common configuration.
  static ThemeData _buildTheme({
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
  }) {
    final isDark = brightness == Brightness.dark;
    final baseTheme = ThemeData(brightness: brightness, useMaterial3: true);

    return baseTheme.copyWith(
      // --- Color Scheme (Material 3) ---
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: isDark ? textDark : textLight,
        secondary: secondary,
        onSecondary: isDark ? textDark : Colors.white,
        background: background,
        onBackground: onSurface,
        surface: surface,
        onSurface: onSurface,
        surfaceVariant: surfaceVariant,
        onSurfaceVariant: onSurface,
        outline: outline,
        error: error,
        onError: isDark ? textLight : Colors.white,
      ),

      // --- General UI Colors ---
      scaffoldBackgroundColor: background,
      dividerColor: outline,

      // --- Text Theme ---
      textTheme: baseTheme.textTheme.apply(
        bodyColor: onSurface,
        displayColor: onSurface,
      ),

      // --- Specific Component Themes ---
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: onSurface,
        elevation: 0,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black.withOpacity(0.2),
      ),

      
      chipTheme: ChipThemeData(
        backgroundColor: surfaceVariant,
        labelStyle: TextStyle(color: onSurface),
        side: BorderSide(color: outline, width: 0.5),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceVariant,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        labelStyle: TextStyle(color: onSurface.withOpacity(0.7)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: onPrimary,
        elevation: 2,
        highlightElevation: 4,
      ),
      
    );
  }

  //================================================================================
  // Theme Definitions
  //================================================================================

  /// **Light Theme** for the application.
  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
    primary: primaryLight,
    onPrimary: onPrimaryLight,
    primaryContainer: primaryContainerLight,
    secondary: secondaryLight,
    background: backgroundLight,
    surface: surfaceLight,
    onSurface: textLight,
    surfaceVariant: surfaceVariantLight,
    outline: outlineLight,
    error: errorLight,
  );

  /// **Dark Theme** for the application.
  static final ThemeData darkTheme = _buildTheme(
    brightness: Brightness.dark,
    primary: primaryDark,
    onPrimary: onPrimaryDark,
    primaryContainer: primaryContainerDark,
    secondary: secondaryDark,
    background: backgroundDark,
    surface: surfaceDark,
    onSurface: textDark,
    surfaceVariant: surfaceVariantDark,
    outline: outlineDark,
    error: errorDark,
  );
}