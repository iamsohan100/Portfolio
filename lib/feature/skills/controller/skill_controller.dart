import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final animationValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(() {
            animationValue.value = animationController.value;
          });
    animationController.repeat();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
