import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';

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
  });

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? WebColor.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 12),
          border: Border.all(color: borderColor ?? WebColor.white, width: 1),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? WebColor.white,
              offset: Offset(offsetX ?? 1, offsetY ?? 1.5),
              blurRadius: 0,
            ),
          ],
        ),
        child: icon != null
            ? Row(
                spacing: 12,
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  if (title != '')
                    CustomText(
                      text: title,
                      textAlign: TextAlign.center,
                      textOverflow: TextOverflow.clip,
                      fontSize: fontSize ?? 14,
                      fontWeight: FontWeight.w400,
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
                fontWeight: FontWeight.w400,
                color: fontColor ?? WebColor.white,
              ),
      ),
    );
  }
}
