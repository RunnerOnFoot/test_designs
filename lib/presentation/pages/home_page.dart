import 'package:flutter/material.dart';
import '../../features/buttons/presentation/widgets/organisms/all_buttons_widget.dart';
import '../widgets/section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const SectionHeader(
                title: 'Buttons Collection',
                subtitle:
                    'A showcase of different button styles and configurations',
              ),
              const SizedBox(height: 24),
              const Expanded(child: AllButtonsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
