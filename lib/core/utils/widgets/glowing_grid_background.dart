import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';

enum GridType { dots, lines, combined }

class GlowingGridBackground extends StatelessWidget {
  final Widget child;
  final GridType gridType;
  final double transitionStart;
  final double transitionEnd;

  const GlowingGridBackground({
    super.key,
    required this.child,
    this.gridType = GridType.combined,
    this.transitionStart = 600.0,
    this.transitionEnd = 950.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Base dark background
        Positioned.fill(
          child: Container(
            color: WebColor.bgColor,
          ),
        ),

        // 2. Glowing Diagonal Beam (Linear Gradient) / Radial Glows
        // Diagonal purple beam from top-left to bottom-right
        Positioned(
          top: -200,
          left: -200,
          child: Transform.rotate(
            angle: -0.5, // Rotate to make it diagonal
            child: Container(
              width: 300,
              height: 1500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    WebColor.primaryColor.withValues(alpha: 0.15),
                    WebColor.primaryColor.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Right side soft glow
        Positioned(
          top: 200,
          right: -250,
          child: Container(
            width: 700,
            height: 700,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  WebColor.primaryColor.withValues(alpha: 0.1),
                  WebColor.primaryColor.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),

        // Bottom-left secondary color glow
        Positioned(
          bottom: -150,
          left: -150,
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  WebColor.secondaryColor.withValues(alpha: 0.08),
                  WebColor.secondaryColor.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),

        // 3. Grid Layer (Dots, Lines, or Combined)
        Positioned.fill(
          child: CustomPaint(
            painter: GridPainter(
              gridType: gridType,
              color: WebColor.white.withValues(alpha: 0.035), // Soft grid color
              spacing: gridType == GridType.lines ? 45.0 : 24.0,
              lineWidth: 0.8,
              dotRadius: 1.0,
              transitionStart: transitionStart,
              transitionEnd: transitionEnd,
            ),
          ),
        ),

        // 4. Content
        child,
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  final GridType gridType;
  final Color color;
  final double spacing;
  final double lineWidth;
  final double dotRadius;
  final double transitionStart;
  final double transitionEnd;

  GridPainter({
    required this.gridType,
    required this.color,
    required this.spacing,
    required this.lineWidth,
    required this.dotRadius,
    required this.transitionStart,
    required this.transitionEnd,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth;

    if (gridType == GridType.dots) {
      paint.style = PaintingStyle.fill;
      for (double x = spacing / 2; x < size.width; x += spacing) {
        for (double y = spacing / 2; y < size.height; y += spacing) {
          canvas.drawCircle(Offset(x, y), dotRadius, paint);
        }
      }
    } else if (gridType == GridType.lines) {
      paint.style = PaintingStyle.stroke;
      // Draw vertical grid lines
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      }
      // Draw horizontal grid lines
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      }
    } else if (gridType == GridType.combined) {
      // 1. Draw horizontal grid lines (fading out)
      for (double y = 0; y < size.height; y += spacing) {
        double opacityFactor = 1.0;
        if (y > transitionEnd) {
          opacityFactor = 0.0;
        } else if (y >= transitionStart) {
          opacityFactor = 1.0 - (y - transitionStart) / (transitionEnd - transitionStart);
        }

        if (opacityFactor > 0.0) {
          final linePaint = Paint()
            ..color = color.withValues(alpha: color.a * opacityFactor)
            ..strokeWidth = lineWidth
            ..style = PaintingStyle.stroke;
          canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
        }
      }

      // 2. Draw vertical grid lines (fading out using LinearGradient shader)
      final double endY = size.height;
      if (endY > 0) {
        final double startFraction = (transitionStart / endY).clamp(0.0, 1.0);
        final double endFraction = (transitionEnd / endY).clamp(0.0, 1.0);

        for (double x = 0; x < size.width; x += spacing) {
          final linePaint = Paint()
            ..strokeWidth = lineWidth
            ..style = PaintingStyle.stroke;

          linePaint.shader = ui.Gradient.linear(
            Offset(x, 0),
            Offset(x, endY),
            [
              color,
              color.withValues(alpha: 0.0),
            ],
            [
              startFraction,
              endFraction,
            ],
          );

          canvas.drawLine(Offset(x, 0), Offset(x, endY), linePaint);
        }
      }

      // 3. Draw dots (fading in)
      final dotPaint = Paint()..style = PaintingStyle.fill;
      // In combined mode, we align dots to the grid line spacing (45) to ensure symmetry
      final double dotSpacing = 45.0;
      for (double x = dotSpacing / 2; x < size.width; x += dotSpacing) {
        for (double y = dotSpacing / 2; y < size.height; y += dotSpacing) {
          double opacityFactor = 0.0;
          if (y > transitionEnd) {
            opacityFactor = 1.0;
          } else if (y >= transitionStart) {
            opacityFactor = (y - transitionStart) / (transitionEnd - transitionStart);
          }

          if (opacityFactor > 0.0) {
            dotPaint.color = color.withValues(alpha: color.a * opacityFactor);
            canvas.drawCircle(Offset(x, y), dotRadius, dotPaint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) {
    return oldDelegate.gridType != gridType ||
        oldDelegate.color != color ||
        oldDelegate.spacing != spacing ||
        oldDelegate.lineWidth != lineWidth ||
        oldDelegate.dotRadius != dotRadius ||
        oldDelegate.transitionStart != transitionStart ||
        oldDelegate.transitionEnd != transitionEnd;
  }
}
