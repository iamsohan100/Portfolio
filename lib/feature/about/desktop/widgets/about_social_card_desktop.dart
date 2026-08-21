import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sohan/core/constants/web_color.dart';
import 'package:sohan/core/utils/button/primary_button.dart';

class AboutSocialCardDesktop extends StatelessWidget {
  const AboutSocialCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        _SocialContainer(icon: FontAwesomeIcons.linkedin),
        _SocialContainer(icon: FontAwesomeIcons.github),
        _SocialContainer(icon: FontAwesomeIcons.xTwitter),
        PrimaryButton(
          buttonWidth: 150,
          buttonHeight: 40,
          title: 'View Resume',
          fontSize: 13.5,
          backgroundColor: WebColor.bgColor,
          radius: 10,
          shadowColor: WebColor.primaryColor,
          isAnimatedBorder: true,
          offsetX: 0,
          offsetY: 0,
          blurRadius: 5,
          borderColor: WebColor.white,
          iconSpace: 8,
          icon: Icon(Icons.open_in_new_rounded, size: 16),
        ),
      ],
    );
  }
}

class _SocialContainer extends StatefulWidget {
  final FaIconData icon;

  const _SocialContainer({required this.icon});

  @override
  State<_SocialContainer> createState() => _SocialContainerState();
}

class _SocialContainerState extends State<_SocialContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0.2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isHovered ? 10 : 5,
              height: 2,
              decoration: BoxDecoration(
                color: WebColor.green.withValues(alpha: _isHovered ? 0.4 : 0.7),
                borderRadius: .circular(2),
                boxShadow: [
                  BoxShadow(
                    color: WebColor.green.withValues(
                      alpha: _isHovered ? 0.4 : 0.3,
                    ),
                    blurRadius: _isHovered ? 4 : 1,
                    spreadRadius: _isHovered ? 0.8 : 0.1,
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isHovered
                  ? WebColor.green.withValues(alpha: 0.04)
                  : WebColor.bgColor.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _isHovered
                    ? WebColor.green.withValues(alpha: 0.25)
                    : WebColor.white24,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: WebColor.green.withValues(
                    alpha: _isHovered ? 0.06 : 0.02,
                  ),
                  blurRadius: _isHovered ? 5 : 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: FaIcon(
              widget.icon,
              size: 20,
              color: _isHovered ? WebColor.white : WebColor.lightSilver,
            ),
          ),
        ],
      ),
    );
  }
}
