import 'package:flutter/material.dart';

class SmallGroupClassesCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath; // Path to the image
  final Color gradientStartColor;
  final Color gradientEndColor;

  const SmallGroupClassesCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath, // Changed from IconData to String
    required this.gradientStartColor,
    required this.gradientEndColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6, // Responsive width
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStartColor, gradientEndColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imagePath,
            height: 100,
             width: 250,
            fit: BoxFit.cover,// Adjust the size of the image as needed
          ),
          const SizedBox(height: 16),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SmallGroupClassesScreen extends StatelessWidget {
  const SmallGroupClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 250, // Constrain the height of the ListView
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const SmallGroupClassesCard(
              title: "Small Group Classes",
              description:
                  "Achieve fitness goals with\n small group workout with your trainer.",
              imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrZJqDbUw5b2QLHCBnc_k20A6Qw5MhG95Dq1-MA8C1MQvCsj-8AQPZRKMhmnjUg9VB3aA&usqp=CAU', // Update with your image path
              gradientStartColor: Color(0xFF1C2B45),
              gradientEndColor: Color.fromARGB(255, 151, 171, 246),
            );
          },
        ),
      ),
    );
  }
}

