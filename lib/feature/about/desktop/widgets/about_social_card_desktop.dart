import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/button/primary_button.dart';

class AboutSocialCardDesktop extends StatelessWidget {
  const AboutSocialCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        _socialContainer(icon: FontAwesomeIcons.linkedin),
        _socialContainer(icon: FontAwesomeIcons.github),
        _socialContainer(icon: FontAwesomeIcons.xTwitter),
        PrimaryButton(
          buttonWidth: 150,
          buttonHeight: 40,
          title: 'View Resume',
          fontSize: 13.5,
          backgroundColor: WebColor.bgColor,
          radius: 10,
          shadowColor: WebColor.primaryColor,
          offsetX: 0,
          offsetY: 0,
          blurRadius: 5,
          borderColor: WebColor.white,
          iconSpace: 8,
          icon: Icon(Icons.open_in_new_rounded, size: 16),
        ),
      ],
    );
  }
}

Container _socialContainer({required FaIconData icon}) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: WebColor.bgColor.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: WebColor.white24, width: 1),
      boxShadow: [
        BoxShadow(
          color: WebColor.primaryColor.withValues(alpha: 0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    alignment: .center,
    child: FaIcon(icon, size: 20, color: WebColor.lightSilver),
  );
}
