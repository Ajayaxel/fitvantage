import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WorkoutPoster extends StatelessWidget {
  List<String> image = [
    "assets/Homeimages/Group 145.png",
    "assets/Homeimages/Group 146.png",
    "assets/Homeimages/Group 147.png",
  ];

  WorkoutPoster({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: image.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, ),
            child: Image.asset(
              image[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

