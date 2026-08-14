import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/feature/my_work/controller/my_work_controller.dart';
import 'package:portfolio/feature/my_work/desktop/widgets/work_card_desktop.dart';
import 'package:portfolio/feature/my_work/model/work_model.dart';

class WorkGridDesktop extends StatelessWidget {
  const WorkGridDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyWorkController>();

    return Container(
      constraints: const BoxConstraints(maxWidth: 1150),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: workList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          mainAxisExtent: 430,
        ),
        itemBuilder: (context, index) {
          final work = workList[index];
          return WorkCardDesktop(
            work: work,
            onTapLink: () => controller.openLink(work.githubUrl ?? ""),
          );
        },
      ),
    );
  }
}
