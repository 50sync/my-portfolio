import 'package:flutter/material.dart';

class Skill extends StatelessWidget {
  const Skill({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              height: 0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
