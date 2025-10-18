import 'package:flutter/material.dart';

class PulsingOnlineIndicator extends StatefulWidget {
  const PulsingOnlineIndicator({super.key});

  @override
  State<PulsingOnlineIndicator> createState() => _PulsingOnlineIndicatorState();
}

class _PulsingOnlineIndicatorState extends State<PulsingOnlineIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation _curve;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      builder: (_, __) {
        double scale = 1 + _curve.value;
        double opacity = 1 - _curve.value;
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: scale,
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withValues(alpha: opacity * 0.5),
                ),
              ),
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ],
        );
      },
    );
  }
}
