import 'package:flutter/material.dart';
import 'package:portfolio/feature/about/desktop/about_desktop.dart';
import 'package:portfolio/feature/home/desktop/home_desktop.dart';
import 'package:portfolio/feature/main/widget/desktop/custom_top_bar.dart';
import 'package:portfolio/feature/skills/desktop/skill_desktop.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTopBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeDesktop(),
                    AboutDesktop(),
                    SkillDesktop(),
                    SizedBox(height: 500),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
