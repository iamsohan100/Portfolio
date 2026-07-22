import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class AboutTextDesktop extends StatelessWidget {
  const AboutTextDesktop({super.key});

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
