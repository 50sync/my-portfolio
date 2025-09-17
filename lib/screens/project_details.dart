import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/theme.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({
    super.key,
    required this.pageViewImgs,
    required this.projectImg,
    required this.heroTag
  });
  final List<String> pageViewImgs;
  final String projectImg;
  final String heroTag;
  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 20,
                ),
              ],
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.indigo],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Hero(
                      tag: widget.heroTag,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: Image.asset(
                          'assets/images/${widget.projectImg}',
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    height: 500,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          itemCount: widget.pageViewImgs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: EasyImageView.imageWidget(
                                        Image.asset(
                                          'assets/images/${widget.pageViewImgs[index]}',
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Image.asset(
                                'assets/images/${widget.pageViewImgs[index]}',
                              ),
                            );
                          },
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
          ),
        ],
      ),
    );
  }
}
