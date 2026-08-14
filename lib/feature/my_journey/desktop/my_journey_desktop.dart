import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/my_journey/controller/my_journey_controller.dart';
import 'package:portfolio/feature/my_journey/desktop/widgets/journey_timeline_desktop.dart';

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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: controller.journeyKey,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 140),
          CustomText(
            text: "ABOUT MY JOURNEY",
            fontSize: 35,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            isForground: true,
            color: WebColor.white,
          ),
          SizedBox(height: 60),
          JourneyTimelineDesktop(),
        ],
      ),
    );
  }
}
