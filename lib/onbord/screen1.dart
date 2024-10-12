import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/onbord/onbordcontent_model.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   left: 0,
          //   bottom: 0,
          //   child: Image.asset(
          //     "assets/Onbording/Aurora background.png",
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // const SizedBox(
          //   height: 69.38,
          // ),
          const OnbordContent(),
          // const SizedBox(height: 177)
        ],
      ),
    );
  }
}
