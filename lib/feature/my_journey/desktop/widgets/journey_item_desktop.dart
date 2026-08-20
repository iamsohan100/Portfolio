import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/my_journey/model/journey_model.dart';

class JourneyItemDesktop extends StatelessWidget {
  final JourneyModel item;
  final bool isActive;
  final bool isLast;

  const JourneyItemDesktop({
    super.key,
    required this.item,
    required this.isActive,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 55),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Node Dot Indicator aligned with the vertical line
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? WebColor.primaryColor : WebColor.bgColor,
              border: Border.all(
                color: isActive ? WebColor.primaryColor : WebColor.white24,
                width: 2,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: WebColor.primaryColor.withValues(alpha: 0.35),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ]
                  : [],
            ),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? WebColor.white : WebColor.grey,
              ),
            ),
          ),
          const SizedBox(width: 30),

          // Year Text
          SizedBox(
            width: 110,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color: isActive
                    ? WebColor.grey.withValues(alpha: 0.8)
                    : WebColor.grey.withValues(alpha: 0.2),
              ),
              child: CustomText(
                text: item.year,
                fontSize: 34,
                fontWeight: FontWeight.w700,
                isPoppin: true,
                color: isActive
                    ? WebColor.grey.withValues(alpha: 0.8)
                    : WebColor.grey.withValues(alpha: 0.2),
              ),
            ),
          ),
          const SizedBox(width: 40),

          // Content Box: Title & Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: item.title,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  isPoppin: true,
                  color: WebColor.bec,
                ),
                const SizedBox(height: 12),
                CustomText(
                  text: item.description,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: WebColor.lightGrey.withValues(alpha: 0.7),
                  lineHeight: 1.6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
