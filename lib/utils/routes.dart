import 'package:ai_lab_report_analyzer/views/get_started_screen.dart';
import 'package:ai_lab_report_analyzer/views/login_screen.dart';
import 'package:ai_lab_report_analyzer/views/sign_up_screen.dart';
import 'package:ai_lab_report_analyzer/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  // GoRouter configuration
  static final routers = GoRouter(
    observers: [AppRouteObserver()],
    overridePlatformDefaultLocation: true,
    initialLocation: rWelcome,
    routes: [
      GoRoute(path: rWelcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(path: rGetStarted, builder: (context, state) => GetStarted()),
      GoRoute(path: rLogin, builder: (context, state) => LoginScreen()),
      GoRoute(path: rSignup, builder: (context, state) => SignUpScreen()),
    ],
  );
  // Paths
  static final rGetStarted = '/get_started';
  static final rWelcome = '/welcome';
  static final rLogin = '/login';
  static final rSignup = '/signup';
}

class AppRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('➡️ Pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('⬅️ Popped: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint('🔁 Replaced: ${newRoute?.settings.name}');
  }
}
