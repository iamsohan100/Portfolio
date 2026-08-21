import 'package:flutter/material.dart';
import 'package:sohan/core/constants/web_color.dart';

class JourneyLinePainterDesktop extends CustomPainter {
  final double progress;

  JourneyLinePainterDesktop({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final double lineX = size.width / 2;
    final double startY = 0;
    final double endY = size.height;

    // Background inactive line
    final Paint bgPaint = Paint()
      ..color = WebColor.white24
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(lineX, startY), Offset(lineX, endY), bgPaint);

    // Active progress line
    if (progress > 0) {
      final double activeEndY =
          startY + (endY - startY) * progress.clamp(0.0, 1.0);

      // Soft, subtle outer glow
      final Paint subtleGlowPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            WebColor.primaryColor.withValues(alpha: 0.35),
            WebColor.secondaryColor.withValues(alpha: 0.35),
          ],
        ).createShader(Rect.fromLTWH(0, startY, size.width, endY))
        ..strokeWidth = 4.0
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(
        Offset(lineX, startY),
        Offset(lineX, activeEndY),
        subtleGlowPaint,
      );

      // Core crisp gradient line
      final Paint activePaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [WebColor.primaryColor, WebColor.secondaryColor],
        ).createShader(Rect.fromLTWH(0, startY, size.width, endY))
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(
        Offset(lineX, startY),
        Offset(lineX, activeEndY),
        activePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant JourneyLinePainterDesktop oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
