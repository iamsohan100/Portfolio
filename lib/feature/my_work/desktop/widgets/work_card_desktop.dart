import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/constants/web_icons.dart';
import 'package:sohan/core/utils/text/custom_text.dart';
import 'package:sohan/feature/my_work/desktop/widgets/work_tech_badge_desktop.dart';
import 'package:sohan/feature/my_work/model/work_model.dart';

class WorkCardDesktop extends StatelessWidget {
  final WorkModel work;
  final VoidCallback? onTapLink;

  const WorkCardDesktop({super.key, required this.work, this.onTapLink});

  @override
  Widget build(BuildContext context) {
    final isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: WebColor.bgColor.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered.value
                  ? WebColor.primaryColor.withValues(alpha: 0.6)
                  : WebColor.white24,
              width: 1,
            ),
            boxShadow: isHovered.value
                ? [
                    BoxShadow(
                      color: WebColor.primaryColor.withValues(alpha: 0.15),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image / Banner Mockup Container
              Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: work.bannerBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: work.imagePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          work.imagePath!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildDummyMockup(),
                        ),
                      )
                    : _buildDummyMockup(),
              ),
              const SizedBox(height: 20),

              // Title & Platforms / Github Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: work.title,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      isPoppin: true,
                      color: WebColor.white,
                      maxLine: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (work.hasAndroid) ...[
                        Image.asset(
                          WebIcons.playStore,
                          width: 20,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                      ],
                      if (work.hasIos) ...[
                        Image.asset(
                          WebIcons.appStore,
                          width: 20,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                      ],
                      if (work.githubUrl != null)
                        InkWell(
                          onTap: onTapLink,
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            child: CustomText(
                              text: "Github",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: WebColor.blueGrey.withValues(alpha: 0.7),
                              textDecoration: .underline,
                              textDecorationColor: WebColor.blueGrey.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Description
              CustomText(
                text: work.description,
                fontSize: 13.5,
                fontWeight: FontWeight.w400,
                color: WebColor.grey,
                maxLine: 2,
                textOverflow: TextOverflow.ellipsis,
                lineHeight: 1.5,
              ),
              const SizedBox(height: 14),

              // Technology Stack Icons & Badges
              TechStackSweeperDesktop(techStack: work.techStack),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds dummy mockup placeholder matching mobile app / web preview
  Widget _buildDummyMockup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++) ...[
          Container(
            width: 80,
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                // Camera notch
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 16),
                // Screen content representation
                Container(
                  width: 50,
                  height: 35,
                  decoration: BoxDecoration(
                    color: WebColor.primaryColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.code_rounded,
                    color: WebColor.white,
                    size: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 55,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 40,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
