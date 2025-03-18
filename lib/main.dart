import 'package:flutter/material.dart';
import 'core/theme/colors.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Step Example',
      theme: ThemeData(primaryColor: AppColors.primary),
      home: const HomePage(),
    );
  }
}
