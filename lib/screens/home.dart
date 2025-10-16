import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/widgets/description_skills.dart';
import 'package:my_portfolio/core/widgets/projects_list_view.dart';
import 'package:my_portfolio/core/widgets/title_divider.dart';
import 'package:my_portfolio/core/widgets/typing_name.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final skillsSection = GlobalKey();
    final projectsSection = GlobalKey();

    final skillIcons = [
      'kotlin.svg',
      'dart.svg',
      'flutter.svg',
      'git.svg',
      'bloc.svg',
      'getx.svg',
    ];

    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBgColor,
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
                        children: [const TypingName()],
                      ),
                    ),
                    snap: true,
                    floating: true,
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 40)),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Column(
                        children: [
                          SafeArea(
                            child: Stack(
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
                                    fit: BoxFit.cover,
                                    height: 130,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DescriptionSkills(),
                                    TitleDivider(
                                      title: 'Projects </>',
                                      key: projectsSection,
                                    ),
                                    SizedBox(height: 20),
                                    ProjectsListView(),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                TitleDivider(
                                  key: skillsSection,
                                  title: 'Skills⚒️',
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 0.55.sw,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: skillIcons.map((icon) {
                                        final skillName = icon.split('.').first;
                                        return Column(
                                          children: [
                                            Tooltip(
                                              message: skillName.toUpperCase(),
                                              child: SvgPicture.asset(
                                                'assets/images/$icon',
                                                height: 40,
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),

                                TitleDivider(title: 'About 🔍'),
                                Text(
                                  'Flutter Developer | 🚀 Turning Ideas into Smooth, Beautiful AppsHey there! 👋 I’m Youssef — a passionate Flutter developer 🐦 with hands-on experience building modern, cross-platform mobile apps 📱I specialize in transforming ideas 💡 into fully functional ✅, pixel-perfect 🎨 applications that provide exceptional user experiences 🌟I’m always learning 📚 and improving 🔧, focusing on crafting clean ✍️, scalable 📐 code and delivering reliable 🔒, high-performance ⚡ productsI thrive on problem-solving 🧩 and enjoy turning visions 👀 into seamless, intuitive apps ✨Focused on continuous growth 🌱, I aim to create apps that not only work 💻 but also feel great ❤️Let’s connect 🤝 and build something awesome! 🌍',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                TitleDivider(title: 'Contact📞'),
                                Column(
                                  spacing: 10,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Email 📩:\nyoussefessam.work@gmail.com',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Mobile 📱:\n01099870599',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'Website 📱:',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Uri uri = Uri.parse(
                                              'https://youssef-essam-flutter-de-kl6z8fl.gamma.site/',
                                            );
                                            await launchUrl(uri);
                                          },
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  'https://youssef-essam-flutter-de-kl6z8fl.gamma.site/',
                                                  style: TextStyle(
                                                    color: Colors.cyanAccent,
                                                    fontSize: 16.sp,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        Colors.cyanAccent,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
