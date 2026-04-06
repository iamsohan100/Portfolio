import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/web_color.dart';

class WebTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: WebColor.primaryColor,
      primary: WebColor.primaryColor,
      secondary: WebColor.secondaryColor,
    ),
    scaffoldBackgroundColor: WebColor.bgColor,
  );
}
