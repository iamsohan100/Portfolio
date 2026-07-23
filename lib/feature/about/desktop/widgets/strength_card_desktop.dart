import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/about/model/strength_model.dart';

class StrengthCard extends StatelessWidget {
  const StrengthCard({super.key, required this.strengthModel});
  final StrengthModel strengthModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 14, vertical: 8),

      decoration: BoxDecoration(
        color: WebColor.bgColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WebColor.white24, width: 1),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: 8,
        children: [
          Icon(strengthModel.icon, color: WebColor.lightSilver, size: 20),
          CustomText(
            text: strengthModel.title,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: WebColor.lightSilver,
          ),
        ],
      ),
    );
  }
}
