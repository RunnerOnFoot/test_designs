import 'package:flutter/material.dart';
import '../bloc/theme/theme_bloc.dart' as theme_bloc;

class AppTheme {
  static ThemeData getThemeData(theme_bloc.ThemeMode themeMode) {
    switch (themeMode) {
      case theme_bloc.ThemeMode.blue:
        return _blueTheme;
      case theme_bloc.ThemeMode.orange:
        return _orangeTheme;
    }
  }

  static final ThemeData _blueTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF403BFF),
      primary: const Color(0xFF403BFF),
      secondary: const Color(0xFF22C55E),
      surface: Colors.white,
      onSurface: const Color(0xFF161C24),
      outline: const Color(0xFFDFE3E8),
      background: Colors.white,
    ),
    useMaterial3: true,
  );

  static final ThemeData _orangeTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange,
      primary: Colors.orange,
      secondary: const Color(0xFF22C55E),
      surface: Colors.white,
      onSurface: const Color(0xFF161C24),
      outline: const Color(0xFFDFE3E8),
      background: Colors.white,
    ),
    useMaterial3: true,
  );
}
