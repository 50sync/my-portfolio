import 'dart:async';
import 'package:flutter/material.dart';

class TypingName extends StatefulWidget {
  const TypingName({super.key});

  @override
  State<TypingName> createState() => _TypingNameState();
}

class _TypingNameState extends State<TypingName> {
  final List<String> letters = "Youssef Essam".split('');
  List<String> name = [''];
  bool forward = true;
  bool isOpac = false;
  Timer? cursorTimer;

  void safeSetState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  void _startCursorBlink() {
    cursorTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      safeSetState(() {
        isOpac = !isOpac;
      });
    });
  }

  void _animateText() {
    for (int i = 0; i < letters.length; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () {
        if (!mounted) return;
        if (forward) {
          name.insert(i, letters[i]);
          if (i == letters.length - 1) {
            Future.delayed(const Duration(seconds: 10), () {
              if (mounted) _deleteText();
            });
          }
        }
        safeSetState(() {});
      });
    }
  }

  void _deleteText() {
    for (int i = letters.length - 1; i >= 0; i--) {
      Future.delayed(Duration(milliseconds: (letters.length - i) * 100), () {
        if (!mounted) return;
        if (i == 0) {
          name = [''];
          forward = true;
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) _animateText();
          });
        }
        if (i < name.length) {
          name.removeAt(i);
        }
        safeSetState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _startCursorBlink();
    _animateText();
  }

  @override
  void dispose() {
    cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          curve: Curves.bounceIn,
          style: const TextStyle(
            height: 0,
            color: Colors.white,
            fontFamily: 'Tomorrow',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          child: Text(name.join()),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: isOpac ? 0.2 : 1,
          child: const Text(
            '|',
            style: TextStyle(
              height: 0,
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
