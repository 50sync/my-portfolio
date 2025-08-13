import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/theme.dart';

class Skill extends StatelessWidget {
  const Skill({super.key, required this.text, this.bgColor});
  final String text;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? kContainerBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              height: 0,
              color: kLabelsColor,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: kLabelsColor.withValues(alpha: 0.5),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
