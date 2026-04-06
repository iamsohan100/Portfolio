import 'package:flutter/material.dart';

class Screen {
  static double webWidth = 1280;
  static double tabWidth = 768;
  static double mobileWidth = 360;

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}