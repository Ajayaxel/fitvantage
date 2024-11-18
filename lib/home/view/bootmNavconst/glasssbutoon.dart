
import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

// ignore: must_be_immutable
class Glassbutoon extends StatelessWidget {
  String text;
   Glassbutoon({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: 80,
      child: GlassButton(
        onPressed: () {},
        radius: 14,
        border: 0.5,
        child:  Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )),
      ),
    );
  }
}
