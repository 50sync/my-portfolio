import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/project_card.dart';
import 'package:my_portfolio/screens/project_details.dart';

class ProjectsListView extends StatelessWidget {
  const ProjectsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Expanded(
          child: ProjectCard(
            skills: ['Flutter', 'BloC', 'Rest API'],
            projectImage: 'mwsla.png',
            heroTag: 'mwsla',
            navigateTo: ProjectDetails(
              heroTag: 'mwsla',
              projectImg: 'mwsla.png',
              pageViewImgs: [
                'trips.png',
                'otp.png',
                'booked_trip.png',
                'account.png',
              ],
            ),
            title: 'Mwsla',
            description: 'Transportation app between all of Egypt provinces',
          ),
        ),

        Expanded(
          child: ProjectCard(
            skills: ['Flutter', 'Getx', 'Rest API'],
            projectImage: 'mwsla.png',
            heroTag: 'xam',
            navigateTo: ProjectDetails(
              heroTag: 'xam',
              projectImg: 'mwsla.png',
              pageViewImgs: [
                'trips.png',
                'otp.png',
                'booked_trip.png',
                'account.png',
              ],
            ),
            title: 'XAM',
            description: 'Transportation app between all of Egypt provinces',
          ),
        ),
      ],
    );
  }
}
