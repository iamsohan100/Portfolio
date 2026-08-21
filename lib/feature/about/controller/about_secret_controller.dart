import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/feature/about/model/star_particle_model.dart';

class AboutSecretController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;
  final RxBool isHovered = false.obs;
  final List<StarParticleModel> stars = [];

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    )..repeat();

    final random = math.Random(42);
    for (int i = 0; i < 110; i++) {
      double directionX = (i % 2 == 0) ? 1.0 : -1.0;
      double speedMultiplier = (random.nextInt(3) + 1).toDouble();

      stars.add(
        StarParticleModel(
          x: random.nextDouble(),
          y: random.nextDouble(),
          size: random.nextDouble() * 0.9 + 0.4,
          baseAlpha: random.nextDouble() * 0.55 + 0.3,
          speedX: directionX * speedMultiplier,
          speedY: (random.nextDouble() - 0.5) * 0.1,
          twinkleSpeed: (random.nextInt(4) + 2).toDouble(),
          twinklePhase: random.nextDouble() * math.pi * 2,
        ),
      );
    }
  }

  void onEnter() => isHovered.value = true;
  void onExit() => isHovered.value = false;

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
