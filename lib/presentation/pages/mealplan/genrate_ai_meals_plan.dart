import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/mainpages/notifications/notification_screen.dart';
import 'package:my_app/models/ai_meal_plan_models.dart';

class GenerateAiMealsPlanScreen extends StatelessWidget {
  final AiMealPlan mealPlan;
  
  const GenerateAiMealsPlanScreen({super.key, required this.mealPlan});

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
            // Total Nutrition Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Nutrition Summary',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNutritionItem('Calories', '${mealPlan.totalNutrition.calories}'),
                      _buildNutritionItem('Protein', '${mealPlan.totalNutrition.protein}g'),
                      _buildNutritionItem('Carbs', '${mealPlan.totalNutrition.carbs}g'),
                      _buildNutritionItem('Fats', '${mealPlan.totalNutrition.fats}g'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Meals List
            Expanded(
              child: ListView.builder(
                itemCount: mealPlan.meals.length,
                itemBuilder: (context, index) {
                  final meal = mealPlan.meals[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: MealCard(
                      title: meal.name,
                      mealType: meal.mealType,
                      mealColor: _getMealTypeColor(meal.mealType),
                      nutrition: meal.nutrition,
                      description: meal.description,
                      ingredients: meal.ingredients,
                      instructions: meal.instructions,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Color _getMealTypeColor(String mealType) {
    switch (mealType.toLowerCase()) {
      case 'breakfast':
        return const Color(0xFFFF6B6B);
      case 'lunch':
        return const Color(0xFF4ECDC4);
      case 'dinner':
        return const Color(0xFF45B7D1);
      case 'snack':
        return const Color(0xFF96CEB4);
      default:
        return const Color(0xFF6C5CE7);
    }
  }
}

class MealCard extends StatelessWidget {
  final String title;
  final String mealType;
  final Color mealColor;
  final AiNutrition nutrition;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;

  const MealCard({
    super.key,
    required this.title,
    required this.mealType,
    required this.mealColor,
    required this.nutrition,
    required this.description,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: mealColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  mealType,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '${nutrition.calories} kcal',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNutritionInfo('Protein', '${nutrition.protein}g'),
              _buildNutritionInfo('Carbs', '${nutrition.carbs}g'),
              _buildNutritionInfo('Fats', '${nutrition.fats}g'),
            ],
          ),
          const SizedBox(height: 16),
          ExpansionTile(
            title: const Text(
              'Ingredients',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            children: [
              ...ingredients.map((ingredient) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  '• $ingredient',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              )),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Instructions',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            children: [
              ...instructions.asMap().entries.map((entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '${entry.key + 1}. ${entry.value}',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionInfo(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
