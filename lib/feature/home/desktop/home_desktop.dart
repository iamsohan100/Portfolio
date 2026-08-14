import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/button/primary_button.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 100),
          CustomText(
            text: "Hi, I'm Sohan",
            fontSize: 70,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            isForground: true,
          ),
          SizedBox(height: 50),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 10,
            children: [
              const CustomText(
                text: "Programmer | Building with",
                color: WebColor.lightSilver,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [WebColor.primaryColor, WebColor.secondaryColor],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CustomText(
                  text: "Flutter, Dart, Rest API,",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  isPoppin: true,
                  color: WebColor.white,
                ),
              ),
              const CustomText(
                text: "Clean Architecture, MVVM, GetX, Provider |",
                color: WebColor.lightSilver,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const CustomText(
            text: "Currently working as a Mobile-App focused Flutter Developer",
            color: WebColor.lightSilver,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
            lineHeight: 1.6,
          ),
          SizedBox(height: 60),

          Row(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              PrimaryButton(
                buttonWidth: 200,
                buttonHeight: 50,
                title: 'Learn More',
                fontSize: 16,
                backgroundColor: WebColor.bgColor,
                isAnimatedBorder: true,
                icon: Transform.rotate(
                  angle: -0.7,
                  child: Padding(
                    padding: .only(bottom: 5),
                    child: Icon(Icons.send_rounded, size: 16),
                  ),
                ),
              ),
              SizedBox(width: 30),
              PrimaryButton(
                buttonWidth: 200,
                buttonHeight: 50,
                fontSize: 16,
                title: 'View Projects',
                isAnimatedFill: true,
                icon: Icon(Icons.auto_awesome_rounded, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
