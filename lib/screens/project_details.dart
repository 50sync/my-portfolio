import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/models/project_model.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key, required this.projectModel});
  final ProjectModel projectModel;
  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final String folder = widget.projectModel.title.toLowerCase();
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  Hero(
                    tag: widget.projectModel.heroTag,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(
                        'assets/images/$folder/${widget.projectModel.projectImg}',
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: PageView.builder(
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            index =
                                index % widget.projectModel.pageViewImgs.length;
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: EasyImageView.imageWidget(
                                        Image.asset(
                                          'assets/images/$folder/${widget.projectModel.pageViewImgs[index]}',
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Image.asset(
                                'assets/images/$folder/${widget.projectModel.pageViewImgs[index]}',
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
