import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/constants/web_images.dart';
import 'package:portfolio/core/utils/responsive/screen.dart';
import 'package:portfolio/core/utils/responsive/sized_box.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Screen.screenWidth(context);
    // final scaleFactor = width / Screen.webWidth;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.15),
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

          Sh(h: 20),
          Container(
            width: width * 0.4,
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
                AboutName(),
                Sh(h: 20),
                AboutText(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutName extends StatelessWidget {
  const AboutName({
    super.key,
  });

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
        Sw(w: 0.01),
        Column(
          crossAxisAlignment: .start,
          children: [
            CustomText(
              text: "Md. Sabbir Ahmed Sohan",
              fontSize: 14,
              fontWeight: .w600,
              isPoppin: true,
              color: WebColor.lightSilver,
            ),
            Sh(h: 6),
            CustomText(
              text: "iamsohan11@gmail.com",
              fontSize: 11,
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
          '''I’m a Flutter developer who enjoys building real-world mobile applications that are clean, responsive, and actually useful for people. I mainly work with Flutter, Dart, Firebase, REST API integration, push notifications, deep linking, and modern mobile UI development. I like turning ideas into smooth user experiences while keeping the codebase organized, scalable, and easy to maintain. I enjoy solving problems, improving app performance, and building features that users can genuinely rely on.

I’ve worked on practical projects where deadlines, bug fixing, UI improvements, changing requirements, and deployment challenges are all part of the journey. Along the way, I’ve learned the importance of clear communication, teamwork, and writing maintainable code instead of overcomplicating things. I’m continuously learning and improving my skills with every project, and I always aim to build applications that not only look good but also deliver a smooth and reliable user experience.''',
      fontSize: 11,
      fontWeight: .w300,
      color: WebColor.lightSilver,
    );
  }
}
