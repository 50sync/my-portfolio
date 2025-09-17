import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/widgets/skill.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.skills,
    required this.title,
    required this.description,
    required this.projectImage,
    required this.navigateTo,
    required this.heroTag,
  });
  final List<String> skills;
  final String title;
  final String description;
  final String projectImage;
  final String heroTag;
  final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return navigateTo;
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: kShadowColor, blurRadius: 10)],
          borderRadius: BorderRadius.circular(10),
          color: kBgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Hero(
                    tag: heroTag,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: Image.asset(
                          'assets/images/$projectImage',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        description,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),

                      Column(
                        spacing: 5,
                        children: List.generate(skills.length, (index) {
                          return Row(
                            children: [
                              Expanded(child: Skill(text: skills[index])),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
