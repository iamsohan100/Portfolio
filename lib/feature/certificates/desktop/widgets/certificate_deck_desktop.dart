import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/feature/certificates/controller/certifications_controller.dart';
import 'package:sohan/feature/certificates/desktop/widgets/certificate_card_item.dart';

class CertificateDeckDesktop extends StatelessWidget {
  const CertificateDeckDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CertificationsController>();

    return Obx(() {
      final total = controller.certificates.length;
      if (total == 0) return const SizedBox.shrink();

      final activeIndex = controller.currentIndex.value;

      // Sort indices so that background cards (higher relativeIndex) are drawn first,
      // and the active front card (relativeIndex == 0) is drawn LAST (on top of the Stack).
      final sortedIndices = List.generate(total, (i) => i);
      sortedIndices.sort((a, b) {
        int relA = (a - activeIndex) % total;
        if (relA < 0) relA += total;
        int relB = (b - activeIndex) % total;
        if (relB < 0) relB += total;
        return relB.compareTo(
          relA,
        ); // Descending order: highest relativeIndex first, 0 last
      });

      return SizedBox(
        width: 520,
        height: 350,
        child: Stack(
          alignment: Alignment.center,
          children: sortedIndices.map((index) {
            // Calculate relative offset from active index
            int relativeIndex = (index - activeIndex) % total;
            if (relativeIndex < 0) relativeIndex += total;

            final isFront = relativeIndex == 0;

            // Compute Stack offsets & transforms
            final double translateX = isFront ? 0 : -relativeIndex * 24.0;
            final double translateY = isFront ? 0 : relativeIndex * 20.0;
            final double scale = isFront ? 1.0 : 1.0 - (relativeIndex * 0.05);
            final double opacity = isFront ? 1.0 : 0.85;

            return AnimatedPositioned(
              key: ValueKey<int>(
                index,
              ), // Preserve element identity for smooth card movement
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeInOutCubic,
              left: 25.0 + translateX,
              top: 25.0 + translateY,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOutCubic,
                opacity: opacity,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeInOutCubic,
                  scale: scale,
                  alignment: Alignment.center,
                  child: CertificateCardItem(
                    certificate: controller.certificates[index],
                    isFront: isFront,
                    onTap: () {
                      if (isFront) {
                        controller.openCertificateLink(
                          controller.certificates[index].driveUrl,
                        );
                      } else {
                        controller.selectCertificate(index);
                      }
                    },
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
