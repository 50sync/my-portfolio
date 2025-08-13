import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/widgets/project_card.dart';
import 'package:my_portfolio/core/widgets/skill.dart';
import 'package:my_portfolio/core/widgets/social_icon_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Youssef Essam',
                  style: TextStyle(
                    height: 0,
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: kTitleColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kContainerBgColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      spacing: 20,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SocialIconButton(),
                        SocialIconButton(),
                        SocialIconButton(),
                        SocialIconButton(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ABOUT ME',
                        style: TextStyle(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Experienced Flutter Developer Specializing in Building high-quality, performant applications',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        spacing: 5,
                        children: [
                          Skill(text: 'Flutter'),
                          Skill(text: 'BloC'),
                          Skill(text: 'FireBase'),
                          Skill(text: 'Clean Architecture'),
                        ],
                      ),
                      SizedBox(height: 10),
                      ProjectCard(
                        skills: ['Flutter', 'BloC'],
                        title: 'Project one',
                        description: 'fed',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
