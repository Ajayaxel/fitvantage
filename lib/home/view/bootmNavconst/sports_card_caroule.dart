
import 'package:flutter/material.dart';
import 'package:my_app/home/view/bootmNavconst/spotrs_cards.dart';

class SportsCarousel extends StatelessWidget {
  final List<Map<String, String>> sports = [

    {
      // 'title': 'RUNNING',
      // 'subtitle': 'IMPROVE YOUR SPEED',
      'image': 'assets/Onbording/card1.webp', // Replace with your asset image
    },
        {
      // 'title': 'SWIMMING',
      // 'subtitle': 'FOR ALL LEVELS',
      'image': 'assets/Onbording/card2.webp', // Replace with your asset image
    },
    // Add more sports as needed
        {
      // 'title': 'RUNNING',
      // 'subtitle': 'IMPROVE YOUR SPEED',
      'image': 'assets/Onbording/card3.webp', // Replace with your asset image
    },
        {
      // 'title': 'RUNNING',
      // 'subtitle': 'IMPROVE YOUR SPEED',
      'image': 'assets/Onbording/card4.webp', // Replace with your asset image
    },
  ];

   SportsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sports.length,
        itemBuilder: (context, index) {
          return SportCard(
            // title: sports[index]['title']!,
            // subtitle: sports[index]['subtitle']!,
            imagePath: sports[index]['image']!,
          );
        },
      ),
    );
  }
}