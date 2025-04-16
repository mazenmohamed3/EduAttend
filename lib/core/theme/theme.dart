import 'package:flutter/material.dart';

class AppTheme {
  static Color defaultTextColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
  }

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
    primary: Colors.blue,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
    primary: Colors.blue,
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
    navigationBarTheme: NavigationBarThemeData(
      elevation: 1, // or 1–4 to match NavBar subtle shadow
      backgroundColor: lightColorScheme.surface,
      surfaceTintColor: Colors.transparent, // disables M3 tint
      shadowColor: Colors.grey[100],
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(color: Colors.blue);
        }
        return const TextStyle(color: Colors.grey);
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: Colors.blue);
        }
        return const IconThemeData(color: Colors.grey);
      }),
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
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0.5, // or 1–4 to match NavBar subtle shadow
      backgroundColor: darkColorScheme.surface,
      surfaceTintColor: Colors.transparent, // disables M3 tint
      shadowColor: Colors.grey[100],
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(color: Colors.blue);
        }
        return TextStyle(color: Colors.grey.shade400);
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: Colors.blue);
        }
        return IconThemeData(color: Colors.grey.shade400);
      }),
    ),

    // No appBarTheme override here → inherits system/default
  );
}