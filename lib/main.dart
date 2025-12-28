import 'package:ai_lab_report_analyzer/controller/auth_controller.dart';
import 'package:ai_lab_report_analyzer/init.dart';
import 'package:ai_lab_report_analyzer/utils/app_theme.dart';
import 'package:ai_lab_report_analyzer/utils/routes.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        GlobalKey,
        MaterialApp,
        ScaffoldMessengerState,
        StatelessWidget,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => serviceLocator<AuthController>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: navigatorKey,
      title: 'AI Lab Report Analyzer', // APP TITLE
      theme: AppTheme.kLightTheme, // APP THEMEs
      routerConfig: AppRoutes.routers, // GO ROUTER
    );
  }
}
