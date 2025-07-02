import 'package:flutter/material.dart';

class ShadowClone extends StatelessWidget {
  final double width;
  final double height;
  final Color shadowColor;

  const ShadowClone({
    super.key,
    this.width = 300,
    this.height = 120,
    this.shadowColor = const Color(0xff010A04),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            // ignore: deprecated_member_use
            shadowColor.withValues(alpha: 1.0),
            shadowColor.withValues(alpha: 0.8),
            shadowColor.withValues(alpha: 0.4),
            shadowColor.withValues(alpha: 0.1),
            shadowColor.withValues(alpha: 0.0),
          ],
          stops: const [0.0, 0.3, 0.6, 0.85, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.9),
            blurRadius: 30,
            spreadRadius: 10,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: shadowColor.withValues(alpha: 1),
            blurRadius: 70,
            spreadRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }
}