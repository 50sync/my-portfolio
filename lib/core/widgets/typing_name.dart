import 'dart:async';
import 'package:flutter/material.dart';

class TypingName extends StatefulWidget {
  const TypingName({super.key});

  @override
  State<TypingName> createState() => _TypingNameState();
}

class _TypingNameState extends State<TypingName> {
  final String fullText = "Youssef Essam";
  String displayed = '';
  bool isDeleting = false;
  bool isCursorVisible = true;
  Timer? typingTimer;
  Timer? cursorTimer;

  @override
  void initState() {
    super.initState();
    _startCursorBlink();
    _startTyping();
  }

  void _startCursorBlink() {
    cursorTimer = Timer.periodic(const Duration(milliseconds: 1200), (_) {
      if (mounted) {
        setState(() => isCursorVisible = !isCursorVisible);
      }
    });
  }

  void _startTyping() {
    const typingSpeed = Duration(milliseconds: 100);
    const pauseDuration = Duration(seconds: 2);

    typingTimer = Timer.periodic(typingSpeed, (timer) {
      if (!mounted) return;

      setState(() {
        if (!isDeleting) {
          if (displayed.length < fullText.length) {
            displayed = fullText.substring(0, displayed.length + 1);
          } else {
            isDeleting = true;
            timer.cancel();
            Future.delayed(pauseDuration, _startTyping);
          }
        } else {
          if (displayed.isNotEmpty) {
            displayed = displayed.substring(0, displayed.length - 1);
          } else {
            isDeleting = false;
            timer.cancel();
            Future.delayed(pauseDuration, _startTyping);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    typingTimer?.cancel();
    cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          displayed,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Tomorrow',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 1200),
          opacity: isCursorVisible ? 1 : 0.2,
          child: const Text(
            '|',
            style: TextStyle(
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
