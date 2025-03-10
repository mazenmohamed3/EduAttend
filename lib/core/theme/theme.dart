import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.blue, // Cursor color
      selectionColor: Colors.blue.withAlpha((0.4 * 255).toInt()), // Highlighted text color
      selectionHandleColor: Colors.blue, // Selection handle color
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.5.w), // Thicker border
        borderRadius: BorderRadius.all(Radius.circular(7.5.r)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5.w), // Thicker border for enabled state
        borderRadius: BorderRadius.all(Radius.circular(7.5.r)),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2.w), // Default border thickness
        borderRadius: BorderRadius.all(Radius.circular(7.5.r)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.5.w), // Thicker border for error state
        borderRadius: BorderRadius.all(Radius.circular(7.5.r)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 3.w), // Even thicker when focused with error
        borderRadius: BorderRadius.all(Radius.circular(7.5.r)),
      ),
      hintStyle: TextStyle(color: Colors.grey),
    ),
  );
}
