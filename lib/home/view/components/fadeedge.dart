
import 'package:flutter/material.dart';

class FadedEdges extends StatelessWidget {
  const FadedEdges(
      {super.key,
      required this.child,
      this.colors,
      this.stops,
      this.isHorizontal = false});
  final Widget child;
  final List<Color>? colors;
  final List<double>? stops;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.dstOut,
        shaderCallback: (Rect rect) => LinearGradient(
                colors: colors ??
                    [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(1)
                    ],
                stops: stops ?? const [0.1, 0.15, 0.9, 1.0],
                begin: !isHorizontal
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                end: !isHorizontal
                    ? Alignment.bottomCenter
                    : Alignment.bottomCenter)
            .createShader(rect),
        child: child);
  }
}