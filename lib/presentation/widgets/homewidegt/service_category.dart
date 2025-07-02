import 'package:flutter/material.dart';


class ServiceCategoryWidget extends StatelessWidget {
  const ServiceCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ServiceCategoryItem(
                imageUrl:
                    'assets/Homeimages/Group 203.png',
                title: 'Gyms',
              ),
              SizedBox(width: 20),
              ServiceCategoryItem(
                imageUrl:
                    'assets/Homeimages/Group 204.png',
                title: 'Play Sports',
              ),
              SizedBox(width: 20),
              ServiceCategoryItem(
                imageUrl:
                    'assets/Homeimages/Group 205.png',
                title: 'Live Workout',
              ),
              SizedBox(width: 20),
              ServiceCategoryItem(
                imageUrl:
                    "assets/Homeimages/Group 206.png",
                title: 'Weight Loss',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ServiceCategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ServiceCategoryItem({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 84,
          height: 84,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
            ),
        
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
