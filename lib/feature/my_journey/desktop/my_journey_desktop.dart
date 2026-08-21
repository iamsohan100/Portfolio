import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/text/custom_text.dart';
import 'package:sohan/feature/my_journey/controller/my_journey_controller.dart';
import 'package:sohan/feature/my_journey/desktop/widgets/journey_timeline_desktop.dart';

class MyJourneyDesktop extends StatefulWidget {
  const MyJourneyDesktop({super.key});

  @override
  State<MyJourneyDesktop> createState() => _MyJourneyDesktopState();
}

class _MyJourneyDesktopState extends State<MyJourneyDesktop> {
  late final MyJourneyController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<MyJourneyController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        controller.calculateScrollProgress(context);
        controller.checkTitleVisibility(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: controller.journeyKey,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 140),
          SlideTransition(
            key: controller.titleKey,
            position: controller.titleSlideAnimation,
            child: FadeTransition(
              opacity: controller.titleFadeAnimation,
              child: ScaleTransition(
                scale: controller.titleScaleAnimation,
                child: const CustomText(
                  text: "ABOUT MY JOURNEY",
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  isPoppin: true,
                  isForground: true,
                  color: WebColor.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          const JourneyTimelineDesktop(),
        ],
      ),
    );
  }
}
