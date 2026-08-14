import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/my_work/desktop/widgets/work_grid_desktop.dart';

class MyWorkDesktop extends StatelessWidget {
  const MyWorkDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          SizedBox(height: 140),
          CustomText(
            text: "MY WORKS IN CODE",
            fontSize: 35,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            isForground: true,
            color: WebColor.white,
          ),
          SizedBox(height: 50),
          WorkGridDesktop(),
        ],
      ),
    );
  }
}
