import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double? letterSpacing;
  final dynamic textAlign;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextOverflow? textOverflow;
  final double? lineHeight;
  final bool? isPoppin;

  const CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.textAlign,
    this.maxLine,
    this.textDecoration,
    this.textDecorationColor,
    this.textOverflow,
    this.letterSpacing,
    this.lineHeight,
    this.isPoppin,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: textOverflow ?? TextOverflow.clip,
      textAlign: (textAlign == null) ? TextAlign.start : textAlign,
      style: isPoppin == true
          ? GoogleFonts.poppins(
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationThickness: 1,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing ?? 0,
              height: lineHeight,
            )
          : GoogleFonts.inter(
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationThickness: 1,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing ?? 0,
              height: lineHeight,
            ),
    );
  }
}
