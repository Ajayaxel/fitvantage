
import 'dart:ui';

import 'package:flutter/material.dart';

class ProgramsCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const ProgramsCards({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 267,
      height: 282,
      margin: const EdgeInsets.only(right: 16), // spacing between cards
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1.0,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgramsSection extends StatelessWidget {
  const ProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> programs = [
      {
        'title': 'Massive Upper Body',
        'subtitle': '7 Week . 5x/week',
        'imagePath': 'assets/Homeimages/glasscard.png',
      },
      {
        'title': 'Shred Fat',
        'subtitle': '8 Week . 4x/week',
        'imagePath': 'assets/Homeimages/galsscard2.png',
      },
   
    ];

    return SizedBox(
      height: 282,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: programs.length,
       
        itemBuilder: (context, index) {
          final program = programs[index];
          return ProgramsCards(
            title: program['title']!,
            subtitle: program['subtitle']!,
            imagePath: program['imagePath']!,
          );
        },
      ),
    );
  }
}
