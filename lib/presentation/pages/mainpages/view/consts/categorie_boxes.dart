import 'package:flutter/material.dart';

class HorizontalCategoryCards extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': 'assets/Homeimages/Hand grip.png', 'label': 'Book Now'},
    {'icon': 'assets/Homeimages/Group 142.png', 'label': 'Gyms'},
    {'icon': 'assets/Homeimages/Group 143.png', 'label': 'Play Sports'},
    {'icon': 'assets/Homeimages/Fitness.png', 'label': 'Live Workout'},
    {'icon': 'assets/Homeimages/Group 141.png', 'label': 'Wellness Locker'},
  ];

   HorizontalCategoryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.only(left: 16,top: 16,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Service category",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 110, // Adjusted to accommodate text below
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        CategoryCard(iconPath: category['icon']), // Icon in Box
                        const SizedBox(height: 6), // Space between box & text
                        Text(
                          category['label'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// **Category Card Widget (Image Centered Inside)**
class CategoryCard extends StatelessWidget {
  final String iconPath;

  const CategoryCard({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xff262525), // Dark background
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 35,
          height: 35,
          color: Colors.greenAccent, // Icon color
        ),
      ),
    );
  }
}

