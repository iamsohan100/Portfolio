import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/my_work/model/work_model.dart';

/// Wraps tech stack badges with a continuous sweeping light beam and sparkle particles
class TechStackSweeperDesktop extends StatefulWidget {
  final List<TechItem> techStack;

  const TechStackSweeperDesktop({super.key, required this.techStack});

  @override
  State<TechStackSweeperDesktop> createState() =>
      _TechStackSweeperDesktopState();
}

class _TechStackSweeperDesktopState extends State<TechStackSweeperDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _sweepController;

  @override
  void initState() {
    super.initState();
    _sweepController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7000),
    )..repeat();
  }

  @override
  void dispose() {
    _sweepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sweepController,
      builder: (context, child) {
        return ClipRect(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.techStack
                      .asMap()
                      .entries
                      .map(
                        (entry) => WorkTechBadgeDesktop(
                          item: entry.value,
                          index: entry.key,
                          totalCount: widget.techStack.length,
                        ),
                      )
                      .toList(),
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: CustomPaint(
                      painter: BeamSparklePainter(
                        progress: _sweepController.value,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Custom painter that renders a glowing vertical light beam with sparkle particle trail matching portfolio theme
class BeamSparklePainter extends CustomPainter {
  final double progress;

  BeamSparklePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    // Strict local bounds clipping to prevent bleeding into neighboring project cards
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final beamX = progress * (size.width + 40) - 20;

    double opacity = 1.0;
    if (progress < 0.08) {
      opacity = progress / 0.08;
    } else if (progress > 0.92) {
      opacity = (1.0 - progress) / 0.08;
    }

    if (opacity > 0) {
      // Theme colors matching portfolio primary (purple) and secondary (amber)
      final lineShader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          WebColor.primaryColor.withValues(alpha: 0.0),
          const Color(0xFFC77DFF).withValues(alpha: 0.9 * opacity),
          WebColor.primaryColor.withValues(alpha: 0.95 * opacity),
          WebColor.secondaryColor.withValues(alpha: 0.85 * opacity),
          WebColor.primaryColor.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(beamX - 1, 0, 2, size.height));

      final linePaint = Paint()
        ..shader = lineShader
        ..strokeWidth = 1.6
        ..style = PaintingStyle.stroke;

      final glowPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            WebColor.primaryColor.withValues(alpha: 0.0),
            WebColor.primaryColor.withValues(alpha: 0.45 * opacity),
            WebColor.primaryColor.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromLTWH(beamX - 6, 0, 12, size.height))
        ..strokeWidth = 6.0
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4)
        ..style = PaintingStyle.stroke;

      canvas.drawLine(Offset(beamX, 0), Offset(beamX, size.height), glowPaint);
      canvas.drawLine(Offset(beamX, 0), Offset(beamX, size.height), linePaint);

      // Fine, delicate sparkle micro-particles (9 starry dots with organic sway/float motion)
      final baseOffsets = [
        Offset(beamX - 6, size.height * 0.10),
        Offset(beamX + 7, size.height * 0.20),
        Offset(beamX - 9, size.height * 0.31),
        Offset(beamX + 6, size.height * 0.42),
        Offset(beamX - 5, size.height * 0.53),
        Offset(beamX + 8, size.height * 0.64),
        Offset(beamX - 7, size.height * 0.75),
        Offset(beamX + 5, size.height * 0.86),
        Offset(beamX - 4, size.height * 0.95),
      ];

      for (int i = 0; i < baseOffsets.length; i++) {
        // Organic sway / float motion as particles sweep across
        final swayX = math.sin(progress * 6 * math.pi + i * 0.7) * 3.5;
        final swayY = math.cos(progress * 6 * math.pi + i * 0.5) * 2.0;

        final pos = Offset(
          baseOffsets[i].dx + swayX,
          baseOffsets[i].dy + swayY,
        );

        final radius = (i % 3 == 0) ? 0.25 : ((i % 3 == 1) ? 0.45 : 0.65);
        final dotColor = (i % 2 == 0)
            ? Colors.white.withValues(alpha: 0.95 * opacity)
            : const Color(0xFFE0AAFF).withValues(alpha: 0.95 * opacity);

        final dotPaint = Paint()..color = dotColor;
        final dotGlow = Paint()
          ..color = dotColor.withValues(alpha: 0.35 * opacity)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.8);

        canvas.drawCircle(pos, radius + 0.25, dotGlow);
        canvas.drawCircle(pos, radius, dotPaint);
      }
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant BeamSparklePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class WorkTechBadgeDesktop extends StatefulWidget {
  final TechItem item;
  final int index;
  final int totalCount;

  const WorkTechBadgeDesktop({
    super.key,
    required this.item,
    this.index = 0,
    this.totalCount = 1,
  });

  @override
  State<WorkTechBadgeDesktop> createState() => _WorkTechBadgeDesktopState();
}

class _WorkTechBadgeDesktopState extends State<WorkTechBadgeDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetYAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Slow continuous wave bounce animation loop across all badges in sequence
    const cycleDurationMs = 10500;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: cycleDurationMs),
    );

    final count = widget.totalCount > 0 ? widget.totalCount : 1;
    final double slot = 0.75 / count;
    final double start = (widget.index * slot).clamp(0.0, 0.85);
    final double end = (start + slot * 1.1).clamp(0.0, 1.0);

    _offsetYAnimation =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.0,
              end: -3.0,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 45,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: -3.0,
              end: 0.0,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 55,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end, curve: Curves.linear),
          ),
        );

    _scaleAnimation =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 45,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 55,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end, curve: Curves.linear),
          ),
        );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _offsetYAnimation.value),
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 45,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.07),
                border: null,
              ),
              child: widget.item.iconPath != null
                  ? Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image.asset(
                        widget.item.iconPath!,
                        fit: BoxFit.contain,
                        width: 22,
                      ),
                    )
                  : CustomText(
                      text: widget.item.label ?? "",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: WebColor.lightSilver,
                    ),
            ),
          ),
        );
      },
    );
  }
}
