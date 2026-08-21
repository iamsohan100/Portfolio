import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/my_work/controller/my_work_controller.dart';
import 'package:portfolio/feature/my_work/desktop/widgets/work_grid_desktop.dart';

class MyWorkDesktop extends StatelessWidget {
  const MyWorkDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<MyWorkController>()
        ? Get.find<MyWorkController>()
        : Get.put(MyWorkController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkVisibility(context);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 140),
          SlideTransition(
            key: controller.workKey,
            position: controller.titleSlideAnimation,
            child: FadeTransition(
              opacity: controller.titleFadeAnimation,
              child: ScaleTransition(
                scale: controller.titleScaleAnimation,
                child: const CustomText(
                  text: "MY WORKS IN CODE",
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  isPoppin: true,
                  isForground: true,
                  color: WebColor.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          const WorkGridDesktop(),
        ],
      ),
    );
  }
}
