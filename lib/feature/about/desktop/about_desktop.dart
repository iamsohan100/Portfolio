import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/constants/web_images.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

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
            height: 320,
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
              children: [AboutName(), SizedBox(height: 20), AboutText()],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutName extends StatelessWidget {
  const AboutName({super.key});

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

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text:
          '''I'm a Flutter developer passionate about building clean, responsive, and user-friendly mobile applications. I work with Flutter, Dart, Firebase, REST APIs, push notifications, deep linking, and modern UI development, focusing on scalable and maintainable code.

I enjoy solving real-world problems, improving app performance, and creating smooth user experiences. With experience delivering practical projects, I value clean code, teamwork, and continuous learning to build reliable, high-quality mobile applications.''',
      fontSize: 14,
      fontWeight: .w300,
      color: WebColor.lightSilver,
    );
  }
}
