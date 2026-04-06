import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/constants/web_color.dart';
import 'package:my_portfolio/core/utils/button/custom_text_button.dart';
import 'package:my_portfolio/feature/main/controller/main_controller.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 26),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: WebColor.bgColor.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: WebColor.white24, width: 1),
        ),
        child: Obx(() {
          final selectedNav = mainController.selectedNav.value;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < mainController.navItems.length; i++)
                CustomTextButton(
                  onPressed: () {
                    mainController.selectedNav.value = i;
                  },
                  title: mainController.navItems[i],
                  fontSize: selectedNav == i ? 16 : 14,
                  fontWeight: selectedNav == i
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: selectedNav == i
                      ? WebColor.primaryColor
                      : WebColor.lightSilver,
                ),
            ],
          );
        }),
      ),
    );
  }
}
