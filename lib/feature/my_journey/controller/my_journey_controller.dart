import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyJourneyController extends GetxController {
  final scrollProgress = 0.0.obs;
  final GlobalKey journeyKey = GlobalKey();

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
}
