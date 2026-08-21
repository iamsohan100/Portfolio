import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HireMeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GlobalKey hireMeKey = GlobalKey();
  bool _hasAnimated = false;

  late AnimationController animationController;
  late Animation<double> boxWidthAnimation;
  late Animation<double> boxFadeAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    boxWidthAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.35, 0.9, curve: Curves.easeOutCubic),
      ),
    );

    boxFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.35, 0.7, curve: Curves.easeOut),
      ),
    );
  }

  void checkVisibility(BuildContext context) {
    if (_hasAnimated) return;
    final renderBox =
        hireMeKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;

      // Trigger animation when the header text is actually visible in lower 75% of viewport
      if (position.dy > 0 && position.dy < screenHeight * 0.75) {
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
