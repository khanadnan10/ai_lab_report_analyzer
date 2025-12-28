import 'package:ai_lab_report_analyzer/main.dart';
import 'package:flutter/material.dart';

void showSnackBar(String message, [BuildContext? context]) {
  final messenger = context != null
      ? ScaffoldMessenger.of(context)
      : navigatorKey.currentState;

  messenger
    ?..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
}
