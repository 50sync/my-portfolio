import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/theme.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.code,
        color: kIconsColor,
        size: 40,
        shadows: [
          Shadow(color: kLabelsColor.withValues(alpha: 0.5), blurRadius: 20),
        ],
      ),
    );
  }
}
