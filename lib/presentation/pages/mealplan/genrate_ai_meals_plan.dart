import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/mainpages/notifications/notification_screen.dart';

class GenerateAiMealsPlanScreen extends StatelessWidget {
  const GenerateAiMealsPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F0C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NotificationScreen()),
                  );
                },
                child: const Icon(Icons.notifications, color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Ai Generated Meal Plan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Ai– Prepared for your balanced meal plan for everyday',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB0FFB4),
                  fontSize: 16, // optional: adjust font size
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: const [
                  MealCard(
                    imageUrl:
                        'https://www.themealdb.com/images/media/meals/1520084413.jpg',
                    title: 'Steak and Eggs',
                    mealType: 'Breakfast',
                    mealColor: Color(0xFF7B3F9B),
                  ),
                  SizedBox(height: 16),
                  MealCard(
                    imageUrl:
                        'https://www.themealdb.com/images/media/meals/1548772327.jpg',
                    title: 'Lean Steak and Kale',
                    mealType: 'Lunch',
                    mealColor: Color(0xFF255F4F),
                  ),
                  SizedBox(height: 16),
                  MealCard(
                    imageUrl:
                        'https://www.themealdb.com/images/media/meals/sypxpx1515365095.jpg',
                    title: 'Lean Beef Burger',
                    mealType: 'Lunch',
                    mealColor: Color(0xFF8C8A39),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String mealType;
  final Color mealColor;

  const MealCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.mealType,
    required this.mealColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: mealColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    mealType,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('461 kcal',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                    SizedBox(width: 16),
                    Text('40 C',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                    SizedBox(width: 16),
                    Text('26 P',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                    SizedBox(width: 16),
                    Text('24 F',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
