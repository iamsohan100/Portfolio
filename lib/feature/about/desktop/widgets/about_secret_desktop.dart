import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/text/custom_text.dart';
import 'package:sohan/feature/about/controller/about_secret_controller.dart';
import 'package:sohan/feature/about/model/star_particle_model.dart';

class AboutSecretDesktop extends StatelessWidget {
  const AboutSecretDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutSecretController());

    return MouseRegion(
      onEnter: (_) => controller.onEnter(),
      onExit: (_) => controller.onExit(),
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          color: Colors.transparent, // Ensures the entire area is hit-testable
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 50,
                  ),
                  child: AnimatedBuilder(
                    animation: controller.animationController,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: _StarFieldPainter(
                          stars: controller.stars,
                          progress: controller.animationController.value,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: CustomText(
                      key: ValueKey<bool>(controller.isHovered.value),
                      text: controller.isHovered.value
                          ? "There are no secrets :)"
                          : "Hover to reveal a secret",
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      isPoppin: true,
                      color: controller.isHovered.value
                          ? WebColor.white
                          : WebColor.grey.withValues(alpha: 0.4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StarFieldPainter extends CustomPainter {
  final List<StarParticleModel> stars;
  final double progress;

  _StarFieldPainter({required this.stars, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      double dx = (star.x + star.speedX * progress) % 1.0;
      if (dx < 0) dx += 1.0;
      double dy = (star.y + star.speedY * progress * 0.05) % 1.0;
      if (dy < 0) dy += 1.0;

      final posX = dx * size.width;
      final posY = dy * size.height;

      final twinkle = math.sin(
        progress * math.pi * 2 * star.twinkleSpeed + star.twinklePhase,
      );
      final alphaMultiplier = 0.65 + 0.35 * twinkle;
      final alpha = (star.baseAlpha * alphaMultiplier).clamp(0.0, 1.0);

      // Delicate glow for larger star particles
      if (star.size > 0.9) {
        final glowPaint = Paint()
          ..color = WebColor.white.withValues(alpha: alpha * 0.25)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
        canvas.drawCircle(Offset(posX, posY), star.size * 1.6, glowPaint);
      }

      final starPaint = Paint()
        ..color = WebColor.white.withValues(alpha: alpha)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(posX, posY), star.size, starPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarFieldPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
