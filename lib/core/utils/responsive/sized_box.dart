// height
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/responsive/screen.dart';

class Sh extends StatelessWidget {
  const Sh({super.key, required this.h});
  final double h;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: h);
  }
}

// width
class Sw extends StatelessWidget {
  const Sw({super.key, required this.w});
  final double w;
  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    return SizedBox(width: width * w);
  }
}
