import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gif/gif.dart';
import 'package:my_portfolio/core/constants/theme.dart';
import 'package:my_portfolio/core/utils/download_file.dart';
import 'package:my_portfolio/core/widgets/social_icon_button.dart';

class DescriptionSkills extends StatelessWidget {
  const DescriptionSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            Text(
              "Hi, I'm Youssef ",
              style: TextStyle(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Gif(
              image: AssetImage('assets/images/waving.gif'),
              autostart: Autostart.loop,
              fps: 30,
              height: 30,
            ),
          ],
        ),
        Text(
          'a passionate mobile developer from Egypt. With strong expertise in Flutter, along with solid experience in Dart and Kotlin, I enjoy exploring diverse technologies and platforms to expand my skills and build impactful applications.',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            SvgPicture.asset(
              'assets/images/map-marker-outline.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              height: 20,
            ),
            Text('Egypt, Cairo', style: TextStyle(color: Colors.white)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Text('•', style: TextStyle(color: Colors.green, fontSize: 30)),
              Text(
                'Available for new projects',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            spacing: 10,
            children: [
              SocialIconButton(
                url: 'https://www.linkedin.com/in/youssef-essam-flutter/',
                svgIcon: 'linkedin',
              ),
              SocialIconButton(
                url: 'https://github.com/50sync',
                svgIcon: 'github',
              ),
              SocialIconButton(
                url: 'https://discord.com/users/716052671408373841',
                svgIcon: 'discord',
              ),
              SocialIconButton(
                url: 'https://youssef-essam-flutter-de-kl6z8fl.gamma.site/',
                icon: CupertinoIcons.globe,
              ),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: () {
                  void showDownloadDialog(String message) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            width: 0.5.sw,
                            height: 0.3.sh,
                            decoration: BoxDecoration(
                              color: kBgColor,
                              boxShadow: [
                                BoxShadow(color: Colors.indigo, blurRadius: 10),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    message,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  downloadFile('assets/my-resume.pdf', 'youssef-cv.pdf')
                      .then((onValue) {
                        showDownloadDialog('CV Downloaded');
                      })
                      .catchError((ex) {
                        showDownloadDialog(ex.toString());
                      });
                },
                child: Text(
                  'Download CV',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
