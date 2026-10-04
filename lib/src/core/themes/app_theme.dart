import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'ligth_theme.dart';

class AppThemes {
  AppThemes._();

  static final Map<String, ThemeData> collections = {
    'dark': darkTheme, 
    'light': lightTheme,
    };
}
