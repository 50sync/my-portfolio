import 'package:flutter/material.dart';
import 'package:my_portfolio/core/models/project_model.dart';
import 'package:my_portfolio/core/widgets/project_card.dart';

class ProjectsListView extends StatelessWidget {
  const ProjectsListView({super.key});
  @override
  Widget build(BuildContext context) {
    List<ProjectModel> projects = [
      ProjectModel(
        skills: ['Flutter', 'BloC', 'Rest API'],
        projectImg: 'mwsla.png',
        heroTag: 'mwsla',
        pageViewImgs: [
          'trips.png',
          'otp.png',
          'booked_trip.png',
          'account.png',
        ],

        title: 'Mwsla',
        description: 'Transportation app between Egypt governorates',
      ),
      ProjectModel(
        skills: ['Flutter', 'GetX', 'Rest API', 'Fire Base'],
        projectImg: 'xam.png',
        heroTag: 'xam',
        pageViewImgs: [
          'home.png',
          'calendar.png',
          'scan_1_side.png',
          'files_in_folder.png',
        ],

        title: 'XAM',
        description:
            'Safety starts with understanding how developers collect and share your data. Data privacy and security practices may vary based on your use, region, and age. The developer provided this information and may update it over time.',
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: List.generate(projects.length, (index) {
        return ProjectCard(projectModel: projects[index]);
      }),
    );
  }
}
