import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/theme/theme_bloc.dart';
import 'core/theme/app_theme.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/settings_page.dart';

void main() {
  runApp(BlocProvider(create: (context) => ThemeBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Custom Step Example',
          theme: AppTheme.getThemeData(state.themeMode),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/settings': (context) => const SettingsPage(),
          },
        );
      },
    );
  }
}
