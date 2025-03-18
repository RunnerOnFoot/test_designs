import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../features/buttons/presentation/widgets/organisms/all_buttons_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Step Example')),
      backgroundColor: AppColors.surface,
      body: const Center(child: AllButtonsWidget()),
    );
  }
}
