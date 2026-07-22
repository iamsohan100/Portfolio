import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/constants/web_images.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class AboutNameDesktop extends StatelessWidget {
  const AboutNameDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: .all(1),
          decoration: BoxDecoration(
            color: WebColor.lightSilver,
            borderRadius: .circular(8),
          ),
          child: Container(
            clipBehavior: .antiAlias,
            width: 73,
            height: 75,

            decoration: BoxDecoration(
              color: WebColor.transparent,

              borderRadius: .circular(8),
            ),
            child: Image.asset(WebImages.profile, fit: .cover),
          ),
        ),
        SizedBox(width: 14),
        Column(
          crossAxisAlignment: .start,
          children: [
            CustomText(
              text: "Sabbir Ahmed Sohan",
              fontSize: 18,
              fontWeight: .w600,
              isPoppin: true,
              color: WebColor.lightSilver,
            ),
            SizedBox(height: 6),
            CustomText(
              text: "iamsohan11@gmail.com",
              fontSize: 13,
              fontWeight: .w400,
              color: WebColor.lightSilver,
            ),
          ],
        ),
      ],
    );
  }
}
