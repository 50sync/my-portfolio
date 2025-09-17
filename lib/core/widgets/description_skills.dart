import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gif/gif.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/widgets/skill.dart';
import 'package:my_portfolio/core/widgets/social_icon_button.dart';

class DescriptionSkills extends StatelessWidget {
  const DescriptionSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            Text(
              "Hi, I'm Youssef ",
              style: TextStyle(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Gif(
              image: AssetImage('assets/images/waving.gif'),
              autostart: Autostart.loop,
              fps: 30,
              height: 30,
            ),
          ],
        ),
        Text(
          'a passionate mobile developer from Egypt. With strong expertise in Flutter, along with solid experience in Dart and Kotlin, I enjoy exploring diverse technologies and platforms to expand my skills and build impactful applications.',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            SvgPicture.asset(
              'assets/images/map-marker-outline.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              height: 20,
            ),
            Text('Egypt, Cairo', style: TextStyle(color: Colors.white)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Text('•', style: TextStyle(color: Colors.green, fontSize: 30)),
              Text(
                'Available for new projects',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            spacing: 10,
            children: [
              SocialIconButton(
                url: 'https://www.linkedin.com/in/youssef-essam-flutter/',
                svgIcon: 'linkedin',
              ),
              SocialIconButton(
                url: 'https://github.com/50sync',
                svgIcon: 'github',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
