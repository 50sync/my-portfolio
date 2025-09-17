import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/widgets/description_skills.dart';
import 'package:my_portfolio/core/widgets/projects_list_view.dart';
import 'package:my_portfolio/core/widgets/title_links.dart';
import 'package:my_portfolio/core/widgets/typing_name.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBgColor,
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: kBgColor,
        child: Column(children: const [
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Body
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    flexibleSpace: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.3),
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TypingName(),
                          GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState?.openEndDrawer();
                            },
                            child: const Icon(Icons.menu, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    actions: [SizedBox.shrink()],
                    snap: true,
                    floating: true,
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                bottom: 50,
                                child: Transform.rotate(
                                  angle: 50,
                                  child: SvgPicture.asset(
                                    'assets/images/kotlin.svg',
                                    height: 100,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                child: Transform.rotate(
                                  angle: 25,
                                  child: SvgPicture.asset(
                                    'assets/images/flutter.svg',
                                    height: 100,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 60,
                                child: SvgPicture.asset(
                                  'assets/images/dart.svg',
                                  height: 100,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.vertical(
                                  bottom: Radius.circular(8),
                                ),
                                child: Image.asset(
                                  'assets/images/me-no-bg.png',
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                DescriptionSkills(),
                                SizedBox(height: 20),
                                ProjectsListView(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Skills',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 0.65.sw,
                            child: const Divider(thickness: 2),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/kotlin.svg',
                                  height: 40,
                                ),
                                SvgPicture.asset(
                                  'assets/images/dart.svg',
                                  height: 40,
                                ),
                                SvgPicture.asset(
                                  'assets/images/flutter.svg',
                                  height: 40,
                                ),
                                SvgPicture.asset(
                                  'assets/images/git.svg',
                                  height: 40,
                                ),

                                SvgPicture.asset(
                                  'assets/images/bloc.svg',
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
