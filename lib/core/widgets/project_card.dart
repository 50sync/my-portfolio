import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/models/project_model.dart';
import 'package:my_portfolio/core/widgets/skill.dart';
import 'package:my_portfolio/screens/project_details.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.65.sw,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProjectDetails(projectModel: projectModel);
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
                      tag: projectModel.heroTag,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: Image.asset(
                            'assets/images/${projectModel.title.toLowerCase()}/${projectModel.projectImg}',
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
                          projectModel.title,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          projectModel.description,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),

                        Column(
                          spacing: 5,
                          children: List.generate(projectModel.skills.length, (
                            index,
                          ) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Skill(
                                    text: projectModel.skills[index],
                                  ),
                                ),
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
      ),
    );
  }
}
