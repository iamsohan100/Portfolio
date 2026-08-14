import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/certificates/desktop/widgets/certificate_deck_desktop.dart';
import 'package:portfolio/feature/certificates/desktop/widgets/certificate_info_desktop.dart';

class CertificationsDesktop extends StatelessWidget {
  const CertificationsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 140),

          // Section Title
          const CustomText(
            text: "CERTIFICATIONS",
            fontSize: 35,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            isForground: true,
            color: WebColor.white,
          ),
          const SizedBox(height: 14),

          // Subtitle
          CustomText(
            text:
                "These certificates are just pieces of paper. Their real value lies in what I can do with the skills they represent.",
            fontSize: 15.5,
            fontWeight: FontWeight.w400,
            color: WebColor.grey,
            textAlign: TextAlign.center,
            lineHeight: 1.5,
          ),
          const SizedBox(height: 60),

          // Main Certifications Section Row (Deck + Info)
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1150),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left Side: Stacked Certificate Deck
                  Expanded(
                    flex: 11,
                    child: Center(
                      child: CertificateDeckDesktop(),
                    ),
                  ),

                  SizedBox(width: 40),

                  // Right Side: Selected Certificate Details & Navigation
                  Expanded(
                    flex: 10,
                    child: CertificateInfoDesktop(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
