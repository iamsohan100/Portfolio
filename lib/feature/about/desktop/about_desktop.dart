import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/responsive/screen.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    // final scaleFactor = width / Screen.webWidth;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.21),
      child: Column(
        children: [
          CustomText(
            text: "ABOUT ME",
            fontSize: 35,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            isForground: true,
            color: WebColor.white,
          ),
        ],
      ),
    );
  }
}
