import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/constants/web_color.dart';
import 'package:my_portfolio/core/utils/responsive/screen.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final double? letterSpacing;
  final dynamic textAlign;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextOverflow? textOverflow;
  final double? lineHeight;
  final bool? isPoppin;
  final bool? isForground;
  const CustomText({
    super.key,
    required this.text,
    this.color,
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
    this.isForground,
  });

  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    final scaleFactor = width / Screen.webWidth;
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
              fontSize: scaleFactor * fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing ?? 0,
              height: lineHeight,
              foreground:
                  isForground == null
                        ? null
                        : Paint() // Paint is required for shader
                    ?..shader = LinearGradient(
                      colors: [WebColor.primaryColor, WebColor.secondaryColor],
                    ).createShader(Rect.fromLTWH(180, 0, 50, 0)),
            )
          : GoogleFonts.inter(
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationThickness: 1,
              fontSize: scaleFactor * fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing ?? 0,
              height: lineHeight,
              foreground: isForground == null ? null : Paint()
                ?..shader = LinearGradient(
                  colors: [WebColor.primaryColor, WebColor.lightSilver],
                ).createShader(Rect.fromLTWH(180, 0, 50, 0)),
            ),
    );
  }
}
