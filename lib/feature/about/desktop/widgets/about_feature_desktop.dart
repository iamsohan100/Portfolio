import 'package:flutter/material.dart';
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
                    borderRadius: .only(topLeft: Radius.circular(20)),
                    border: Border(
                      right: BorderSide(color: WebColor.white24, width: 0.5),
                      bottom: BorderSide(color: WebColor.white24, width: 0.5),
                    ),
                  ),
                  child: FeatureCard(feature: features[0]),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: WebColor.transparent,
                    borderRadius: .only(topRight: Radius.circular(20)),
                    border: Border(
                      left: BorderSide(color: WebColor.white24, width: 0.5),
                      bottom: BorderSide(color: WebColor.white24, width: 0.5),
                    ),
                  ),
                  child: FeatureCard(feature: features[1]),
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
                    borderRadius: .only(bottomLeft: Radius.circular(20)),
                    border: Border(
                      right: BorderSide(color: WebColor.white24, width: 0.5),
                      top: BorderSide(color: WebColor.white24, width: 0.5),
                    ),
                  ),
                  child: FeatureCard(feature: features[2]),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: WebColor.transparent,
                    borderRadius: .only(bottomRight: Radius.circular(20)),
                    border: Border(
                      left: BorderSide(color: WebColor.white24, width: 0.5),
                      top: BorderSide(color: WebColor.white24, width: 0.5),
                    ),
                  ),
                  child: FeatureCard(feature: features[3]),
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

  const FeatureCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: .all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                feature.icon,
                color: WebColor.lightSilver.withValues(alpha: 0.65),
                size: 20,
              ),

              const SizedBox(height: 14),
              CustomText(
                text: feature.title,
                fontSize: 18,
                fontWeight: .w600,
                isPoppin: true,
                color: WebColor.lightSilver,
              ),

              const SizedBox(height: 10),
              CustomText(
                text: feature.description,
                fontSize: 14,
                fontWeight: .w300,
                color: WebColor.lightSilver,
              ),
            ],
          ),
        ),
        Positioned(
          left: -1, // border এর সাথে লাগানো
          top: 75,
          child: Container(
            width: 6,
            height: 35,
            decoration: BoxDecoration(
              color: WebColor.white24,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
