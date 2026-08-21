import 'package:flutter/material.dart';
import 'package:sohan/core/constants/web_color.dart';

class AnimatedGradientFill extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final List<Color>? gradientColors;
  final Duration animationDuration;

  const AnimatedGradientFill({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.borderRadius = 14,
    this.gradientColors,
    this.animationDuration = const Duration(seconds: 2),
  });

  @override
  State<AnimatedGradientFill> createState() => _AnimatedGradientFillState();
}

class _AnimatedGradientFillState extends State<AnimatedGradientFill>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultColors =
        widget.gradientColors ??
        [
          const Color(0xFFB08CFF),
          WebColor.primaryColor,
          const Color(0xFFB08CFF),
        ];

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final double t = _animation.value;
        return Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(-1.5 + (t * 1.0), -0.3),
              end: Alignment(0.8 + (t * 1.0), 0.3),
              colors: defaultColors,
            ),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
