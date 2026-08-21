import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyJourneyController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final scrollProgress = 0.0.obs;
  final GlobalKey journeyKey = GlobalKey();
  final GlobalKey titleKey = GlobalKey();
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

  void calculateScrollProgress(BuildContext context) {
    final renderBox =
        journeyKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final position = renderBox.localToGlobal(Offset.zero);
      final height = renderBox.size.height;
      final screenHeight = MediaQuery.of(context).size.height;

      final startOffset = screenHeight * 0.8;
      final totalDistance = height + screenHeight * 0.2;
      final currentOffset = startOffset - position.dy;

      final progress = (currentOffset / totalDistance).clamp(0.0, 1.0);
      scrollProgress.value = progress;
    }
  }

  void checkTitleVisibility(BuildContext context) {
    if (_hasAnimated) return;
    final renderBox = titleKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;

      if (position.dy < screenHeight * 0.90) {
        _hasAnimated = true;
        animationController.forward(from: 0.0);
      }
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
