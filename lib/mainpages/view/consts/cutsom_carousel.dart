

import 'package:flutter/material.dart';

class Caruslecards extends StatelessWidget {
  final Color startColor; // Start color for the gradient
  final Color endColor; // End color for the gradient
  String imagePath;
  String bgtext;
  String title;
  String subtitle;

  Caruslecards({
    super.key,
    required this.startColor,
    required this.endColor,
    required this.imagePath,
    required this.bgtext,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16,right: 16),
      width: double.infinity,
      height: 161,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            startColor, // Use parameterized color
            endColor, // Use parameterized color
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background "2025" text
            Positioned(
              left: 10,
              bottom: -30,
              child: Text(
                bgtext,
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.1),
                  fontFamily: "Lufga",
                ),
              ),
            ),

            // Woman with dumbbell image
            Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: 165,
                width: 151,
                child: Image.asset(
                  imagePath, // Replace with your image URL
                ),
              ),
            ),

            // Text content New Year\nSale
            Positioned(
              right: 20,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 36,
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  //Lorem ipsum dolor sit\namet consectetur.  sub text
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
