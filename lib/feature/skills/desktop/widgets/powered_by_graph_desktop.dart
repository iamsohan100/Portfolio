import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/constants/web_icons.dart';
import 'package:sohan/core/constants/web_images.dart';
import 'package:sohan/feature/skills/controller/skill_controller.dart';
import 'package:sohan/feature/skills/desktop/widgets/skill_graph_painter_desktop.dart';
import 'package:sohan/feature/skills/desktop/widgets/skill_node_badge_desktop.dart';

class PoweredByGraphDesktop extends StatelessWidget {
  const PoweredByGraphDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final skillController = Get.find<SkillController>();

    const double containerHeight = 260.0;
    const double badgeSize = 48.0;
    const double centerAvatarSize = 68.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double containerWidth = constraints.maxWidth > 650
            ? 600.0
            : (constraints.maxWidth - 30).clamp(280.0, 600.0);

        final double leftX = badgeSize / 2;
        final double rightX = containerWidth - (badgeSize / 2);
        final double centerX = containerWidth / 2;

        final double topY = badgeSize / 2;
        final double middleY = containerHeight / 2;
        final double bottomY = containerHeight - (badgeSize / 2);

        final List<Offset> leftOffsets = [
          Offset(leftX, topY),
          Offset(leftX, middleY),
          Offset(leftX, bottomY),
        ];

        final List<Offset> rightOffsets = [
          Offset(rightX, topY),
          Offset(rightX, middleY),
          Offset(rightX, bottomY),
        ];

        final Offset centerOffset = Offset(centerX, middleY);

        return Center(
          child: Container(
            width: containerWidth,
            height: containerHeight,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                // Obx for Reactive Custom Painter Bezier Animation
                Positioned.fill(
                  child: Obx(() {
                    return CustomPaint(
                      painter: SkillGraphPainterDesktop(
                        centerOffset: centerOffset,
                        leftOffsets: leftOffsets,
                        rightOffsets: rightOffsets,
                        animationValue: skillController.animationValue.value,
                      ),
                    );
                  }),
                ),

                // Left Column Skill Badges
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top Left: Flutter
                      SkillNodeBadgeDesktop(
                        size: badgeSize,
                        child: Image.asset(WebIcons.flutter, width: 24),
                      ),
                      // Middle Left: Dart
                      SkillNodeBadgeDesktop(
                        size: badgeSize,
                        child: Image.asset(WebIcons.dart, width: 24),
                      ),
                      // Bottom Left: REST API
                      SkillNodeBadgeDesktop(
                        size: badgeSize,
                        child: Image.asset(WebIcons.api, width: 24),
                      ),
                    ],
                  ),
                ),

                // Center Column Avatar Node
                Positioned(
                  left: centerX - (centerAvatarSize / 2),
                  top: middleY - (centerAvatarSize / 2),
                  child: Obx(() {
                    final animVal = skillController.animationValue.value;
                    final glowOpacity =
                        0.3 + 0.3 * (1 - (animVal - 0.5).abs() * 2);

                    return Container(
                      width: centerAvatarSize,
                      height: centerAvatarSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: WebColor.white,
                        boxShadow: [
                          BoxShadow(
                            color: WebColor.primaryColor.withValues(
                              alpha: glowOpacity,
                            ),
                            blurRadius: 16,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.35),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(color: WebColor.white, width: 3),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: ClipOval(
                        child: Image.asset(
                          WebImages.profile,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 36,
                              color: WebColor.bgColor,
                            );
                          },
                        ),
                      ),
                    );
                  }),
                ),

                // Right Column Skill Badges
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top Right: github
                      SkillNodeBadgeDesktop(
                        size: badgeSize,
                        child: Image.asset(WebIcons.github, width: 24),
                      ), // Middle Right: Firebase
                      SkillNodeBadgeDesktop(
                        size: badgeSize,
                        child: Image.asset(WebIcons.firebase, width: 24),
                      ),
                      // Bottom Right: Getx
                      SkillNodeBadgeDesktop(size: badgeSize, label: 'GetX'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
