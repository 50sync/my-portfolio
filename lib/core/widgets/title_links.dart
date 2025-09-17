import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/widgets/social_icon_button.dart';

class TitleLinks extends StatelessWidget {
  const TitleLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Flutter Developer',
          style: TextStyle(color: kTitleColor, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kContainerBgColor,
            boxShadow: [BoxShadow(color: kShadowColor, blurRadius: 10)],
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                SocialIconButton(
                  svgIcon: 'linkedin',
                  url: 'https://www.linkedin.com/in/youssef-essam-flutter/',
                ),
                SocialIconButton(
                  svgIcon: 'github',
                  url: 'https://github.com/50sync',
                ),
                SocialIconButton(
                  icon: Icons.public,
                  url: 'https://youssef-essam-flutter-de-kl6z8fl.gamma.site/',
                ),
                SocialIconButton(
                  svgIcon: 'discord',
                  url: 'https://discord.com/users/716052671408373841',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
