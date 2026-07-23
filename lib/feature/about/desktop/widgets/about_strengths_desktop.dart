import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_color.dart';
import 'package:portfolio/core/utils/text/custom_text.dart';
import 'package:portfolio/feature/about/desktop/widgets/strength_card_desktop.dart';
import 'package:portfolio/feature/about/model/strength_model.dart';

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

class _InfiniteScrollRowState extends State<InfiniteScrollRow> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _setKey = GlobalKey();
  double _singleSetWidth = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateWidthAndStart();
    });
  }

  void _calculateWidthAndStart() {
    if (!mounted) return;
    final context = _setKey.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox?;
      if (box != null) {
        setState(() {
          _singleSetWidth = box.size.width;
        });
        _scroll();
      }
    }
  }

  void _scroll() {
    if (!mounted || !_scrollController.hasClients || _singleSetWidth == 0.0) {
      return;
    }

    final double targetOffset = widget.reverse ? 0.0 : _singleSetWidth;
    final double currentOffset = _scrollController.offset;
    final double distance = (targetOffset - currentOffset).abs();

    if (distance <= 1.0) {
      _scrollController.jumpTo(widget.reverse ? _singleSetWidth : 0.0);
      WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());
      return;
    }

    final duration = Duration(
      milliseconds: (distance / widget.speed * 1000).toInt(),
    );

    _scrollController
        .animateTo(targetOffset, duration: duration, curve: Curves.linear)
        .then((_) {
          if (mounted) {
            _scroll();
          }
        });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.children.isEmpty) return const SizedBox.shrink();
    return SingleChildScrollView(
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
    );
  }
}
