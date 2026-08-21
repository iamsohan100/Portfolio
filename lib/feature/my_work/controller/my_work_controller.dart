import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWorkController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final hoveredCardIndex = (-1).obs;
  final GlobalKey workKey = GlobalKey();
  bool _hasAnimated = false;

  late AnimationController animationController;
  late Animation<double> titleFadeAnimation;
  late Animation<double> titleScaleAnimation;
  late Animation<Offset> titleSlideAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    titleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    titleScaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
      ),
    );
  }

  void checkVisibility(BuildContext context) {
    if (_hasAnimated) return;
    final renderBox = workKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;

      if (position.dy < screenHeight * 0.90) {
        _hasAnimated = true;
        animationController.forward(from: 0.0);
      }
    }
  }

  void setHoveredIndex(int index) {
    hoveredCardIndex.value = index;
  }

  void openLink(String url) {
    debugPrint("Opening URL: $url");
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
