import 'package:flutter/material.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/text/custom_text.dart';
import 'package:sohan/feature/certificates/model/certificate_model.dart';

class CertificateCardItem extends StatefulWidget {
  final CertificateModel certificate;
  final VoidCallback onTap;
  final bool isFront;

  const CertificateCardItem({
    super.key,
    required this.certificate,
    required this.onTap,
    this.isFront = true,
  });

  @override
  State<CertificateCardItem> createState() => _CertificateCardItemState();
}

class _CertificateCardItemState extends State<CertificateCardItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final cert = widget.certificate;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 460,
          height: 290,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E24),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                  alpha: widget.isFront ? 0.45 : 0.2,
                ),
                blurRadius: widget.isFront ? (isHovered ? 25 : 18) : 10,
                offset: Offset(0, widget.isFront ? (isHovered ? 12 : 8) : 4),
              ),
            ],
            border: Border.all(
              color: isHovered && widget.isFront
                  ? WebColor.primaryColor.withValues(alpha: 0.8)
                  : WebColor.white.withValues(alpha: 0.15),
              width: isHovered && widget.isFront ? 2 : 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Animated Switcher for smooth Image transition
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 450),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.96,
                              end: 1.0,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                  child: Image.asset(
                    cert.imagePath,
                    key: ValueKey<String>(cert.imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF1E1E24),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image_not_supported_rounded,
                            size: 48,
                            color: WebColor.primaryColor,
                          ),
                          const SizedBox(height: 12),
                          CustomText(
                            text: cert.title,
                            color: WebColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            isPoppin: true,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Hover overlay hint when front card is hovered
                if (isHovered && widget.isFront)
                  Positioned(
                    right: 14,
                    top: 14,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isHovered ? 1.0 : 0.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: WebColor.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.open_in_new_rounded,
                              size: 13,
                              color: WebColor.white,
                            ),
                            SizedBox(width: 5),
                            CustomText(
                              text: "View Certificate",
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              isPoppin: true,
                              color: WebColor.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
