import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

class AboutSecretDesktop extends StatefulWidget {
  const AboutSecretDesktop({super.key});

  @override
  State<AboutSecretDesktop> createState() => _AboutSecretState();
}

class _AboutSecretState extends State<AboutSecretDesktop> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.transparent, // Ensures the entire area is hit-testable
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: CustomText(
            key: ValueKey<bool>(_isHovered),
            text: _isHovered
                ? "I can speak English :)"
                : "Hover to reveal a secret",
            fontSize: 32,
            fontWeight: FontWeight.w700,
            isPoppin: true,
            color: _isHovered
                ? WebColor.white
                : WebColor.grey.withValues(alpha: 0.4),
          ),
        ),
      ),
    );
  }
}
