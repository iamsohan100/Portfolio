import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/web_color.dart';
import 'package:my_portfolio/core/utils/text/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: "Home",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: WebColor.white,
        ),
      ),
    );
  }
}