import 'package:flutter/material.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/text/custom_text.dart';
import 'package:sohan/core/utils/widgets/animated_gradient_border.dart';
import 'package:sohan/core/utils/widgets/animated_gradient_fill.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? icon;
  final double? radius;
  final double buttonHeight;
  final double buttonWidth;
  final Color? fontColor;
  final bool? isShadow;
  final Color? shadowColor;
  final double? offsetX;
  final double? offsetY;
  final bool? isManjari;
  final double? fontSize;
  final double? blurRadius;
  final double? iconSpace;
  final bool isAnimatedBorder;
  final bool isAnimatedFill;
  final List<Color>? gradientColors;
  final double? borderWidth;
  final Duration? animationDuration;
  final double? glowRadius;

  const PrimaryButton({
    super.key,
    this.onTap,
    required this.title,
    this.backgroundColor,
    this.borderColor,
    this.icon,
    this.radius,
    required this.buttonHeight,
    this.fontColor,
    this.isShadow,
    this.shadowColor,
    this.offsetX,
    this.offsetY,
    this.isManjari,
    this.fontSize,
    required this.buttonWidth,
    this.blurRadius,
    this.iconSpace,
    this.isAnimatedBorder = false,
    this.isAnimatedFill = false,
    this.gradientColors,
    this.borderWidth,
    this.animationDuration,
    this.glowRadius,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveRadius = radius ?? 14;

    Widget innerChild = icon != null
        ? Row(
            spacing: iconSpace ?? 12,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              if (title != '')
                CustomText(
                  text: title,
                  textAlign: TextAlign.center,
                  textOverflow: TextOverflow.clip,
                  fontSize: fontSize ?? 14,
                  fontWeight: FontWeight.w500,
                  color: fontColor ?? WebColor.white,
                ),
              icon!,
            ],
          )
        : CustomText(
            text: title,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.clip,
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w500,
            color: fontColor ?? WebColor.white,
          );

    Widget buttonContent;

    if (isAnimatedFill) {
      buttonContent = AnimatedGradientFill(
        width: buttonWidth,
        height: buttonHeight,
        borderRadius: effectiveRadius,
        gradientColors: gradientColors,
        animationDuration: animationDuration ?? const Duration(seconds: 4),
        child: innerChild,
      );
    } else {
      buttonContent = Container(
        width: buttonWidth,
        height: buttonHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? WebColor.primaryColor,
          borderRadius: BorderRadius.circular(effectiveRadius),
          border: isAnimatedBorder
              ? null
              : Border.all(color: borderColor ?? WebColor.white, width: 1),
          boxShadow: isAnimatedBorder
              ? null
              : [
                  BoxShadow(
                    color: shadowColor ?? WebColor.white,
                    offset: Offset(offsetX ?? 1, offsetY ?? 1.5),
                    blurRadius: blurRadius ?? 0,
                  ),
                ],
        ),
        child: innerChild,
      );
    }

    if (isAnimatedBorder) {
      buttonContent = AnimatedGradientBorder(
        borderRadius: effectiveRadius,
        borderWidth: borderWidth ?? 1.0,
        glowRadius: glowRadius ?? 1.0,
        gradientColors: gradientColors,
        animationDuration: animationDuration ?? const Duration(seconds: 3),
        child: buttonContent,
      );
    }

    return GestureDetector(onTap: onTap, child: buttonContent);
  }
}
