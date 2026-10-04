import 'package:flutter/material.dart';
import 'package:nexunid/src/core/themes/theme_builder.dart';

final ThemeData darkTheme = ThemeBuilder.buildTheme(
  brightness: Brightness.dark,
  primary: const Color(0xFF818CF8), 
  onPrimary: const Color(0xFF1E293B),
  primaryContainer: const Color(0xFF3730A3),
  secondary: const Color(0xFF38BDF8),
  background: const Color(0xFF0F172A),
  surface: const Color(0xFF1E293B),
  onSurface: const Color(0xFFE2E8F0),
  surfaceVariant: const Color(0xFF334155),
  outline: const Color(0xFF475569),
  error: const Color(0xFFF87171),
  textColor: const Color(0xFFE2E8F0),
);
