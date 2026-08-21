import 'package:flutter/material.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/text/custom_text.dart';
import 'package:sohan/feature/skills/desktop/widgets/powered_by_graph_desktop.dart';

class SkillDesktop extends StatelessWidget {
  const SkillDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 140),
          CustomText(
            text: "POWERED BY",
            fontSize: 32,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            isForground: true,
            color: WebColor.white,
          ),
          const SizedBox(height: 30),
          const PoweredByGraphDesktop(),
        ],
      ),
    );
  }
}
