import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/about/desktop/widgets/about_social_card_desktop.dart';

class HireMeFooterDesktop extends StatelessWidget {
  const HireMeFooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text:
                '© Copyright ${DateTime.now().year} Sabbir Ahmed Sohan - All rights reserved',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: WebColor.lightSilver.withValues(alpha: 0.6),
          ),
          const AboutSocialCardDesktop(),
        ],
      ),
    );
  }
}
