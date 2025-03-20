import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_designs/core/bloc/theme/theme_bloc.dart' as app_theme;
import '../widgets/section_header.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: 'Theme Settings',
              subtitle: 'Customize the appearance of the app',
              icon: Icons.palette_outlined,
            ),
            const SizedBox(height: 16),
            BlocBuilder<app_theme.ThemeBloc, app_theme.ThemeState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Column(
                    key: ValueKey(state.themeMode),
                    children: [
                      _buildThemeOption(
                        context,
                        'Blue Theme',
                        'Clean and professional look',
                        Icons.water_drop,
                        Colors.blue,
                        app_theme.ThemeMode.blue,
                        state.themeMode == app_theme.ThemeMode.blue,
                      ),
                      const SizedBox(height: 12),
                      _buildThemeOption(
                        context,
                        'Orange Theme',
                        'Warm and inviting design',
                        Icons.sunny,
                        Colors.orange,
                        app_theme.ThemeMode.orange,
                        state.themeMode == app_theme.ThemeMode.orange,
                      ),
                      const SizedBox(height: 12),
                      _buildThemeOption(
                        context,
                        'Dark Theme',
                        'Easy on the eyes at night',
                        Icons.nights_stay,
                        Colors.indigo,
                        app_theme.ThemeMode.dark,
                        state.themeMode == app_theme.ThemeMode.dark,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'About',
              subtitle: 'Application information',
              icon: Icons.info_outline,
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Material UI Showcase',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'v1.0.0',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'An example Flutter app demonstrating Material Design components and theme customization.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    String title,
    String subtitle,
    IconData iconData,
    Color iconColor,
    app_theme.ThemeMode themeMode,
    bool isSelected,
  ) {
    return InkWell(
      onTap: () {
        context.read<app_theme.ThemeBloc>().add(
          app_theme.ChangeThemeEvent(themeMode),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                  : Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(iconData, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}
