import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/my_work/model/work_model.dart';

class WorkTechBadgeDesktop extends StatelessWidget {
  final TechItem item;

  const WorkTechBadgeDesktop({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF222226),
        border: Border.all(color: WebColor.white24, width: 1),
      ),
      child: item.iconPath != null
          ? Padding(
              padding: const EdgeInsets.all(7.0),
              child: Image.asset(
                item.iconPath!,
                fit: BoxFit.contain,
                width: 22,
              ),
            )
          : CustomText(
              text: item.label ?? "",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: WebColor.lightSilver,
            ),
    );
  }
}
