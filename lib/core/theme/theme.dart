import 'package:flutter/material.dart';

class AppTheme {
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
    primary: Colors.blue,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: lightColorScheme.surface,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightColorScheme.primary,
      selectionColor: lightColorScheme.primary.withAlpha((0.4 * 255).toInt()),
      selectionHandleColor: lightColorScheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightColorScheme.primary, width: 2.5),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.5),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      hintStyle: TextStyle(color: Colors.grey),
      errorMaxLines: 5,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(lightColorScheme.primary),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: darkColorScheme.surface,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkColorScheme.primary,
      selectionColor: darkColorScheme.primary.withAlpha((0.4 * 255).toInt()),
      selectionHandleColor: darkColorScheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkColorScheme.primary, width: 2.5),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade600, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade300, width: 2.5),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade300, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      errorMaxLines: 5,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(darkColorScheme.inversePrimary),
      ),
    ),
    // No appBarTheme override here → inherits system/default
  );
}