import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sohan/core/constants/web_color.dart';

class AnimatedGradientBorder extends StatefulWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final List<Color>? gradientColors;
  final Duration animationDuration;
  final double glowRadius;
  final bool enableGlow;

  const AnimatedGradientBorder({
    super.key,
    required this.child,
    this.borderWidth = 1.0,
    this.borderRadius = 14,
    this.gradientColors,
    this.animationDuration = const Duration(seconds: 3),
    this.glowRadius = 1.0,
    this.enableGlow = true,
  });

  @override
  State<AnimatedGradientBorder> createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultColors = [
      WebColor.primaryColor.withValues(alpha: 0.3),
      WebColor.primaryColor,
      const Color(0xFFD49BFF),
      WebColor.white.withValues(alpha: 0.9),
      const Color(0xFFD49BFF),
      WebColor.primaryColor,
      WebColor.primaryColor.withValues(alpha: 0.3),
    ];

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          foregroundPainter: GradientBorderPainter(
            animationValue: _controller.value,
            gradientColors: widget.gradientColors ?? defaultColors,
            borderWidth: widget.borderWidth,
            borderRadius: widget.borderRadius,
            glowRadius: widget.enableGlow ? widget.glowRadius : 0,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double animationValue;
  final List<Color> gradientColors;
  final double borderWidth;
  final double borderRadius;
  final double glowRadius;

  GradientBorderPainter({
    required this.animationValue,
    required this.gradientColors,
    required this.borderWidth,
    required this.borderRadius,
    required this.glowRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width == 0 || size.height == 0) return;

    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    final shader = SweepGradient(
      center: Alignment.center,
      colors: gradientColors,
      transform: GradientRotation(animationValue * 2 * math.pi),
    ).createShader(rect);

    // Glow effect
    if (glowRadius > 0) {
      final glowPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..shader = shader
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius);

      canvas.drawRRect(rrect, glowPaint);
    }

    // Border line
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader = shader;

    canvas.drawRRect(rrect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.gradientColors != gradientColors ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.glowRadius != glowRadius;
  }
}
