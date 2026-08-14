import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class AboutFeatureDesktop extends StatelessWidget {
  const AboutFeatureDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: WebColor.transparent,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                    border: Border(
                      right: BorderSide(color: WebColor.white24, width: 0.5),
                      bottom: BorderSide(color: WebColor.white24, width: 0.5),
                    ),
                  ),
                  child: FeatureCard(
                    feature: features[0],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: WebColor.transparent,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                    border: Border(
                      left: BorderSide(color: WebColor.white24, width: 0.5),
                      bottom: BorderSide(color: WebColor.white24, width: 0.5),
                    ),
                  ),
                  child: FeatureCard(
                    feature: features[1],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: WebColor.transparent,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                    border: Border(
                      right: BorderSide(color: WebColor.white24, width: 0.5),
                      top: BorderSide(color: WebColor.white24, width: 0.5),
                    ),
                  ),
                  child: FeatureCard(
                    feature: features[2],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: WebColor.transparent,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border(
                      left: BorderSide(color: WebColor.white24, width: 0.5),
                      top: BorderSide(color: WebColor.white24, width: 0.5),
                    ),
                  ),
                  child: FeatureCard(
                    feature: features[3],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FeatureModel {
  final IconData icon;
  final String title;
  final String description;

  FeatureModel({
    required this.icon,
    required this.title,
    required this.description,
  });
}

final List<FeatureModel> features = [
  FeatureModel(
    icon: Icons.mobile_friendly_outlined,
    title: "App Focus",
    description:
        "I build fast, responsive mobile apps that are easy to use and easy to maintain.",
  ),
  FeatureModel(
    icon: Icons.handshake_outlined,
    title: "Good Communication",
    description:
        "I ask the right questions and keep everyone aligned during development.",
  ),
  FeatureModel(
    icon: Icons.lightbulb_outline,
    title: "Problem Solver",
    description:
        "I prefer practical solutions over complexity and over-engineering.",
  ),
  FeatureModel(
    icon: Icons.trending_up,
    title: "Always Improving",
    description:
        "I want each project I work on to be smoother and better than the last one.",
  ),
];

class FeatureCard extends StatelessWidget {
  final FeatureModel feature;
  final BorderRadius borderRadius;

  const FeatureCard({
    super.key,
    required this.feature,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      cursor: SystemMouseCursors.click,
      child: Obx(
        () => ClipRRect(
          borderRadius: borderRadius,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: isHovered.value
                  ? LinearGradient(
                      colors: [
                        WebColor.primaryColor.withValues(alpha: 0.22),
                        WebColor.primaryColor.withValues(alpha: 0.02),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        feature.icon,
                        color: isHovered.value
                            ? WebColor.white
                            : WebColor.lightSilver.withValues(alpha: 0.65),
                        size: 20,
                      ),
                      const SizedBox(height: 14),
                      CustomText(
                        text: feature.title,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        isPoppin: true,
                        color: isHovered.value
                            ? WebColor.white
                            : WebColor.lightSilver,
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        text: feature.description,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: isHovered.value
                            ? WebColor.lightSilver
                            : WebColor.lightSilver.withValues(alpha: 0.8),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 75,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 5,
                    height: 35,
                    decoration: BoxDecoration(
                      color: isHovered.value
                          ? WebColor.primaryColor
                          : WebColor.white24,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(8),
                      ),
                      boxShadow: isHovered.value
                          ? [
                              BoxShadow(
                                color: WebColor.primaryColor.withValues(alpha: 0.8),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ]
                          : [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
