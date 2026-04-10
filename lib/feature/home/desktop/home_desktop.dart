import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/web_color.dart';
import 'package:my_portfolio/core/utils/responsive/screen.dart';
import 'package:my_portfolio/core/utils/responsive/sized_box.dart';
import 'package:my_portfolio/core/utils/text/custom_text.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.21),
      child: Column(
        children: [
          Sh(h: 100),
          CustomText(
            text: "Hi, I'm Sohan",
            fontSize: 50,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            isForground: true,
          ),
          Sh(h: 50),
          CustomText(
            text:
                "Programmer | Building with Flutter, Dart, Rest API, Clean Architecture, MVVM, GetX, Provider | Currently working as a Mobile-App focused Flutter Developer",
            color: WebColor.lightSilver,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
            lineHeight: 1.6,
          ),
        ],
      ),
    );
  }
}
