import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/button/primary_button.dart';
import 'package:sohan/feature/hire_me/controller/hire_me_controller.dart';
import 'package:sohan/feature/hire_me/desktop/widgets/hire_me_footer_desktop.dart';
import 'package:sohan/feature/hire_me/desktop/widgets/hire_me_header_desktop.dart';

class HireMeDesktop extends StatelessWidget {
  const HireMeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<HireMeController>()
        ? Get.find<HireMeController>()
        : Get.put(HireMeController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkVisibility(context);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 140),
          const HireMeHeaderDesktop(),
          const SizedBox(height: 40),
          PrimaryButton(
            buttonWidth: 145,
            buttonHeight: 45,
            title: 'Hire me',
            fontSize: 14,
            backgroundColor: WebColor.bgColor,
            radius: 10,
            shadowColor: WebColor.primaryColor,
            offsetX: 0,
            offsetY: 0,
            blurRadius: 5,
            borderColor: WebColor.white,
            isAnimatedBorder: true,
            onTap: () {},
          ),
          const SizedBox(height: 140),
          const HireMeFooterDesktop(),
        ],
      ),
    );
  }
}
