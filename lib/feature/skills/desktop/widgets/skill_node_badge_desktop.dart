import 'package:flutter/material.dart';
import 'package:sohan/core/constants/web_color.dart';

class SkillNodeBadgeDesktop extends StatelessWidget {
  final Widget? child;
  final String? label;
  final IconData? icon;
  final Color? iconColor;
  final double size;

  const SkillNodeBadgeDesktop({
    super.key,
    this.child,
    this.label,
    this.icon,
    this.iconColor,
    this.size = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: WebColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: WebColor.white.withValues(alpha: 0.2),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
      ),
      alignment: Alignment.center,
      child:
          child ??
          (icon != null
              ? Icon(
                  icon,
                  color: iconColor ?? WebColor.bgColor,
                  size: size * 0.45,
                )
              : Text(
                  label ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: WebColor.bgColor,
                    fontSize: size * 0.25,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                )),
    );
  }
}
