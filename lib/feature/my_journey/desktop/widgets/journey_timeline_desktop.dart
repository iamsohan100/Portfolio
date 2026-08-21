import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/feature/my_journey/controller/my_journey_controller.dart';
import 'package:sohan/feature/my_journey/desktop/widgets/journey_item_desktop.dart';
import 'package:sohan/feature/my_journey/desktop/widgets/journey_line_painter_desktop.dart';
import 'package:sohan/feature/my_journey/model/journey_model.dart';

class JourneyTimelineDesktop extends StatelessWidget {
  const JourneyTimelineDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyJourneyController>();

    return Obx(() {
      final progress = controller.scrollProgress.value;

      return Container(
        constraints: const BoxConstraints(maxWidth: 1050),
        child: Stack(
          children: [
            // Vertical Line running through the node dots
            Positioned(
              left: 11, // Centered inside the 24px dot container
              top: 12, // Starts at middle of first dot
              bottom: 12, // Ends at middle of last dot
              child: CustomPaint(
                size: const Size(2, double.infinity),
                painter: JourneyLinePainterDesktop(progress: progress),
              ),
            ),

            // Timeline Items
            Column(
              children: List.generate(journeyList.length, (index) {
                final item = journeyList[index];
                final double threshold = index / (journeyList.length - 1);
                final bool isActive = progress >= (threshold - 0.05);

                return JourneyItemDesktop(
                  item: item,
                  isActive: isActive,
                  isLast: index == journeyList.length - 1,
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}
