import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/button/primary_button.dart';
import 'package:portfolio/core/utils/responsive/screen.dart';
import 'package:portfolio/core/utils/responsive/sized_box.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    final scaleFactor = width / Screen.webWidth;

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
          Sh(h: 60),

          Row(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              PrimaryButton(
                buttonWidth: width * 0.15,
                buttonHeight: 50,
                title: 'Learn More',
                backgroundColor: WebColor.bgColor,
                icon: Transform.rotate(
                  angle: -0.7,
                  child: Padding(
                    padding: .only(bottom: 5),
                    child: Icon(Icons.send_rounded, size: scaleFactor * 16),
                  ),
                ),
              ),
              Sw(w: 0.03),
              PrimaryButton(
                buttonWidth: width * 0.15,
                buttonHeight: 50,
                title: 'View Projects',
                icon: Icon(Icons.auto_awesome_rounded, size: scaleFactor * 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
