import 'package:flutter/material.dart' hide ThemeMode;
import '../bloc/theme/theme_bloc.dart';

class AppTheme {
  static ThemeData getThemeData(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.blue:
        return _blueTheme;
      case ThemeMode.orange:
        return _orangeTheme;
      case ThemeMode.dark:
        return _darkTheme;
    }
  }

  static final _blueTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    pageTransitionsTheme: _pageTransitionsTheme,
  );

  static final _orangeTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange,
      brightness: Brightness.light,
    ),
    pageTransitionsTheme: _pageTransitionsTheme,
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    ),
    pageTransitionsTheme: _pageTransitionsTheme,
  );

  static final _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      for (final platform in TargetPlatform.values)
        platform: const ZoomPageTransitionsBuilder(),
    },
  );
}
