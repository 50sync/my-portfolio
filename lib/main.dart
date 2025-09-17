import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => ScreenUtilInit(
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Tomorrow',
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
      ),
    );
  }
}
