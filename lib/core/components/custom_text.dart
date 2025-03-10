import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final dynamic googleFonts;
  final TextOverflow? overflow;
  final List<String>? args;

  const CustomText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 16,
    this.height = 1.2,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.googleFonts = GoogleFonts.figtree,
    this.overflow,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    // final lang = context.locale.toString();
    final lang = 'en';

    // Provide a default empty list for args if null
    final argsToPass = args ?? [];

    return Text(
      text.tr(args: argsToPass).toString(), // Ensure args is not null
      textAlign: textAlign,
      style: lang == 'en'
          ? googleFonts(
        decoration: textDecoration,
        decorationThickness: 1.8,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
      )
          : GoogleFonts.tajawal(
        decoration: textDecoration,
        decorationThickness: 1.8,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}