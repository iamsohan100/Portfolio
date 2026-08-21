import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/button/primary_button.dart';
import 'package:sohan/core/utils/text/custom_text.dart';
import 'package:sohan/feature/home/controller/home_controller.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : Get.put(HomeController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 100),
          SlideTransition(
            position: controller.titleSlideAnimation,
            child: FadeTransition(
              opacity: controller.titleFadeAnimation,
              child: ScaleTransition(
                scale: controller.titleScaleAnimation,
                child: const CustomText(
                  text: "Hi, I'm Sohan",
                  fontSize: 70,
                  fontWeight: FontWeight.w700,
                  isPoppin: true,
                  isForground: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
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
              AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: controller.boxFadeAnimation,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: controller.boxWidthAnimation.value,
                        child: child,
                      ),
                    ),
                  );
                },
                child: Container(
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
          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.send_rounded, size: 16),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              const PrimaryButton(
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
