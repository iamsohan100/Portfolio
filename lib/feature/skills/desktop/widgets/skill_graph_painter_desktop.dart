import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';

class SkillGraphPainterDesktop extends CustomPainter {
  final Offset centerOffset;
  final List<Offset> leftOffsets;
  final List<Offset> rightOffsets;
  final double animationValue;

  SkillGraphPainterDesktop({
    required this.centerOffset,
    required this.leftOffsets,
    required this.rightOffsets,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (centerOffset == Offset.zero) return;

    final basePaint = Paint()
      ..color = const Color(0xFF282830)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final glowBasePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final List<Color> themeColors = [
      WebColor.primaryColor.withValues(alpha: 0.2),
      WebColor.primaryColor,
      WebColor.secondaryColor,
    ];

    // Offsets for staggered sequential pulse wave (1/6 = ~0.166 spacing)
    final List<double> leftStaggerOffsets = [0.0, 0.33, 0.66];
    final List<double> rightStaggerOffsets = [0.16, 0.50, 0.83];

    // --- Left Paths (Flowing towards center) ---
    for (int i = 0; i < leftOffsets.length; i++) {
      final start = leftOffsets[i];
      final end = centerOffset;

      final path = Path();
      path.moveTo(start.dx, start.dy);

      final control1 = Offset(start.dx + (end.dx - start.dx) * 0.5, start.dy);
      final control2 = Offset(end.dx - (end.dx - start.dx) * 0.2, end.dy);

      path.cubicTo(
        control1.dx,
        control1.dy,
        control2.dx,
        control2.dy,
        end.dx,
        end.dy,
      );

      // Draw base dark curve
      canvas.drawPath(path, glowBasePaint);
      canvas.drawPath(path, basePaint);

      // Animate staggered theme gradient beam along path
      _drawAnimatedBeam(
        canvas: canvas,
        path: path,
        colors: themeColors,
        progress: (animationValue + leftStaggerOffsets[i]) % 1.0,
      );
    }

    // --- Right Paths (Flowing towards center) ---
    for (int i = 0; i < rightOffsets.length; i++) {
      final start = rightOffsets[i];
      final end = centerOffset;

      final path = Path();
      path.moveTo(start.dx, start.dy);

      final control1 = Offset(start.dx - (start.dx - end.dx) * 0.5, start.dy);
      final control2 = Offset(end.dx + (start.dx - end.dx) * 0.2, end.dy);

      path.cubicTo(
        control1.dx,
        control1.dy,
        control2.dx,
        control2.dy,
        end.dx,
        end.dy,
      );

      // Draw base dark curve
      canvas.drawPath(path, glowBasePaint);
      canvas.drawPath(path, basePaint);

      // Animate staggered theme gradient beam along path
      _drawAnimatedBeam(
        canvas: canvas,
        path: path,
        colors: themeColors,
        progress: (animationValue + rightStaggerOffsets[i]) % 1.0,
      );
    }
  }

  void _drawAnimatedBeam({
    required Canvas canvas,
    required Path path,
    required List<Color> colors,
    required double progress,
  }) {
    for (final metric in path.computeMetrics()) {
      final totalLength = metric.length;
      final beamLength = totalLength * 0.28; // Sleek laser pulse beam length

      // Calculate beam start & end distance along curve
      final currentPos = (progress * (totalLength + beamLength)) - beamLength;
      final startDist = currentPos.clamp(0.0, totalLength);
      final endDist = (currentPos + beamLength).clamp(0.0, totalLength);

      if (startDist < endDist) {
        final beamPath = metric.extractPath(startDist, endDist);
        final startTangent = metric.getTangentForOffset(startDist);
        final endTangent = metric.getTangentForOffset(endDist);

        if (startTangent != null && endTangent != null) {
          final beamPaint = Paint()
            ..shader = ui.Gradient.linear(
              startTangent.position,
              endTangent.position,
              colors,
              [0.0, 0.5, 1.0],
            )
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3.0
            ..strokeCap = StrokeCap.round;

          // Glowing background line
          final glowPaint = Paint()
            ..shader =
                ui.Gradient.linear(startTangent.position, endTangent.position, [
                  colors.first.withValues(alpha: 0.0),
                  colors.last.withValues(alpha: 0.6),
                ])
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6.0
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

          canvas.drawPath(beamPath, glowPaint);
          canvas.drawPath(beamPath, beamPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant SkillGraphPainterDesktop oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.centerOffset != centerOffset ||
        oldDelegate.leftOffsets != leftOffsets ||
        oldDelegate.rightOffsets != rightOffsets;
  }
}
