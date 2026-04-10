import 'package:flutter/material.dart';
import 'package:my_portfolio/feature/home/desktop/home_desktop.dart';
import 'package:my_portfolio/feature/main/widget/desktop/custom_top_bar.dart';

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
                child: Column(children: [HomeDesktop()]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
