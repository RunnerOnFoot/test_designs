import 'package:flutter/material.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/settings_page.dart';
import '../../presentation/pages/main_page.dart';
import '../../presentation/pages/splash_screen.dart';

class AppRoutes {
  // Route constants
  static const String splash = '/splash';
  static const String main = '/main';
  static const String home = '/home';
  static const String settings = '/settings';

  // Route definitions
  static Map<String, Widget Function(BuildContext)> get routes => {
    splash: (context) => const SplashScreen(),
    main: (context) => const MainPage(),
    home: (context) => const HomePage(),
    settings: (context) => const SettingsPage(),
  };

  // Prevent instantiation
  AppRoutes._();
}
