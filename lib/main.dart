import 'package:ai_lab_report_analyzer/init.dart';
import 'package:ai_lab_report_analyzer/utils/app_theme.dart';
import 'package:ai_lab_report_analyzer/views/welcome_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Lab Report Analyzer',
      theme: AppTheme.kLightTheme,
      home: const WelcomeScreen(),
    );
  }
}
