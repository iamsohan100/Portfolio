import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class HireMeHeaderDesktop extends StatelessWidget {
  const HireMeHeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: [
            const CustomText(
              text: 'Hire The',
              fontSize: 35,
              fontWeight: FontWeight.w700,
              isPoppin: true,
              color: WebColor.white,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    WebColor.primaryColor,
                    WebColor.secondaryColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CustomText(
                text: 'Right Talent',
                fontSize: 35,
                fontWeight: FontWeight.w700,
                isPoppin: true,
                color: WebColor.white,
              ),
            ),
            const CustomText(
              text: 'To Get The Best Results',
              fontSize: 35,
              fontWeight: FontWeight.w700,
              isPoppin: true,
              color: WebColor.white,
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomText(
          text: "If you want to hire the right talent, get in touch and let's make it happen.",
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: WebColor.lightSilver.withValues(alpha: 0.8),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
