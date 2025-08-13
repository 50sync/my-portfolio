import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/widgets/skill.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.skills,
    required this.title,
    required this.description,
  });
  final List<String> skills;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shadowColor: kLabelsColor,
        color: kContainerBgColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    'https://play-lh.googleusercontent.com/oPxszaTdqd3NgAFEo_t-PtcZNSMXL6bvHEyMSYnOFghX0T9Hu6UMnlMcgyq67955rQ=w480-h960-rw',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(description),
                  Spacer(),
                  Row(
                    children: List.generate(skills.length, (index) {
                      return Row(
                        children: [
                          Skill(
                            bgColor: Color(0xFF162e31),
                            text: skills[index],
                          ),
                          SizedBox(width: 5),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
