import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Tomorrow'),
      debugShowCheckedModeBanner: false, home: Home());
  }
}
