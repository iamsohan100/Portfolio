import 'package:flutter/material.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/text/custom_text.dart';
import 'package:sohan/feature/about/desktop/widgets/strength_card_desktop.dart';
import 'package:sohan/feature/about/model/strength_model.dart';

class AboutStrengthsDesktop extends StatelessWidget {
  const AboutStrengthsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                colors: [WebColor.primaryColor, WebColor.secondaryColor],
              ),
            ),
            child: CustomText(
              text: "My Strengths",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              isPoppin: true,
              isForground: true,
              color: WebColor.white,
            ),
          ),
        ),
        const SizedBox(height: 25),
        InfiniteScrollRow(
          speed: 25.0,
          children: strengths
              .map((s) => StrengthCard(strengthModel: s))
              .toList(),
        ),
        const SizedBox(height: 10),
        InfiniteScrollRow(
          speed: 25.0,
          reverse: true,
          children: strengths.reversed
              .map((s) => StrengthCard(strengthModel: s))
              .toList(),
        ),
      ],
    );
  }
}

class InfiniteScrollRow extends StatefulWidget {
  final List<Widget> children;
  final double speed; // pixels per second
  final bool reverse;

  const InfiniteScrollRow({
    super.key,
    required this.children,
    this.speed = 25.0,
    this.reverse = false,
  });

  @override
  State<InfiniteScrollRow> createState() => _InfiniteScrollRowState();
}

class _InfiniteScrollRowState extends State<InfiniteScrollRow>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _setKey = GlobalKey();
  late final AnimationController _animController;
  double _singleSetWidth = 0.0;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this);

    _animController.addListener(() {
      if (_scrollController.hasClients && _singleSetWidth > 0) {
        final double progress = _animController.value;
        final double offset = widget.reverse
            ? (1.0 - progress) * _singleSetWidth
            : progress * _singleSetWidth;
        _scrollController.jumpTo(offset);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateWidthAndStart();
    });
  }

  void _calculateWidthAndStart() {
    if (!mounted) return;
    final context = _setKey.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox?;
      if (box != null && box.size.width > 0) {
        _singleSetWidth = box.size.width;
        final durationMs = ((_singleSetWidth / widget.speed) * 1000).toInt();
        _animController.duration = Duration(milliseconds: durationMs);
        _animController.repeat();
      }
    }
  }

  void _onEnter() {
    if (_animController.isAnimating) {
      _animController.stop(canceled: false);
    }
  }

  void _onExit() {
    if (!_animController.isAnimating && _singleSetWidth > 0) {
      _animController.repeat();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.children.isEmpty) return const SizedBox.shrink();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onEnter(),
      onExit: (_) => _onExit(),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            Row(
              key: _setKey,
              mainAxisSize: MainAxisSize.min,
              children: widget.children
                  .map(
                    (w) => Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: w,
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: widget.children
                  .map(
                    (w) => Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: w,
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: widget.children
                  .map(
                    (w) => Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: w,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
