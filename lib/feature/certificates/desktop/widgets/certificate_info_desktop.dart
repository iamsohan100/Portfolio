import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/certificates/controller/certifications_controller.dart';

class CertificateInfoDesktop extends StatelessWidget {
  const CertificateInfoDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CertificationsController>();

    return Obx(() {
      final cert = controller.currentCertificate;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated text switcher when active certificate changes
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.04, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: Column(
              key: ValueKey<int>(controller.currentIndex.value),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Certificate Title
                CustomText(
                  text: cert.title,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  isPoppin: true,
                  color: WebColor.white,
                ),
                const SizedBox(height: 8),

                // Byline / Issuer & Date
                CustomText(
                  text: "By ${cert.issuer} (${cert.issueDate})",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: WebColor.grey,
                ),
                const SizedBox(height: 28),

                // Detailed Description
                CustomText(
                  text: cert.description,
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400,
                  color: WebColor.lightSilver,
                  lineHeight: 1.65,
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),

          // Navigation Controls (Left & Right Arrow Buttons)
          Row(
            children: [
              _NavButton(
                icon: Icons.arrow_back_rounded,
                onPressed: controller.previousCertificate,
              ),
              const SizedBox(width: 16),
              _NavButton(
                icon: Icons.arrow_forward_rounded,
                onPressed: controller.nextCertificate,
              ),
            ],
          ),
        ],
      );
    });
  }
}

class _NavButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _NavButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isHovered
                ? WebColor.primaryColor
                : WebColor.white.withValues(alpha: 0.1),
            border: Border.all(
              color: isHovered
                  ? WebColor.primaryColor
                  : WebColor.white.withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: WebColor.primaryColor.withValues(alpha: 0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Icon(
              widget.icon,
              size: 20,
              color: WebColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
