import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  /// Light Theme
  static final _blueColor = Color(0xff137FEC);
  static final kLightTheme = ThemeData.light().copyWith(
    primaryColor: _blueColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.poppinsTextTheme(),
    colorScheme: ColorScheme.light().copyWith(primary: _blueColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shadowColor: WidgetStatePropertyAll(_blueColor),
        backgroundColor: WidgetStateProperty.all(_blueColor),
        overlayColor: WidgetStateProperty.all(_blueColor),
        surfaceTintColor: WidgetStateProperty.all(Colors.red),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
  );
}
