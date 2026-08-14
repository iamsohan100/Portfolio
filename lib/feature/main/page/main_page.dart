import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/feature/about/desktop/about_desktop.dart';
import 'package:portfolio/feature/certificates/desktop/certifications_desktop.dart';
import 'package:portfolio/feature/hire_me/desktop/hire_me_desktop.dart';
import 'package:portfolio/feature/home/desktop/home_desktop.dart';
import 'package:portfolio/feature/main/widget/desktop/custom_top_bar.dart';
import 'package:portfolio/feature/my_journey/controller/my_journey_controller.dart';
import 'package:portfolio/feature/my_journey/desktop/my_journey_desktop.dart';
import 'package:portfolio/feature/my_work/desktop/my_work_desktop.dart';
import 'package:portfolio/feature/skills/desktop/skill_desktop.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final journeyController = Get.find<MyJourneyController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomTopBar(),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  journeyController.calculateScrollProgress(context);
                  return false;
                },
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeDesktop(),
                      AboutDesktop(),
                      SkillDesktop(),
                      MyJourneyDesktop(),
                      MyWorkDesktop(),
                      CertificationsDesktop(),
                      HireMeDesktop(),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
