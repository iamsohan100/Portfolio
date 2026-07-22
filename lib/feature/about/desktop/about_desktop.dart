import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/about/desktop/widgets/about_name_desktop.dart';
import 'package:portfolio/feature/about/desktop/widgets/about_social_card_desktop.dart';
import 'package:portfolio/feature/about/desktop/widgets/about_text_desktop.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = Screen.screenWidth(context);
    // final scaleFactor = width / Screen.webWidth;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomText(
            text: "ABOUT ME",
            fontSize: 35,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            isForground: true,
            color: WebColor.white,
          ),

          SizedBox(height: 40),
          Container(
            width: 600,
            height: 385,
            padding: .symmetric(vertical: 20, horizontal: 24),
            decoration: BoxDecoration(
              color: WebColor.bgColor.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: WebColor.white24, width: 1),
            ),
            alignment: .center,
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .start,
              children: [
                AboutNameDesktop(),
                SizedBox(height: 20),
                AboutTextDesktop(),
                SizedBox(height: 25),
                AboutSocialCardDesktop(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
