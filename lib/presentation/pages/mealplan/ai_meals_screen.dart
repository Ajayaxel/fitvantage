import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/mainpages/notifications/notification_screen.dart';
import 'package:my_app/presentation/pages/mealplan/genrate_ai_meals_plan.dart';

class AiMealsScreen extends StatefulWidget {
  const AiMealsScreen({super.key});

  @override
  State<AiMealsScreen> createState() => _AiMealsScreenState();
}

class _AiMealsScreenState extends State<AiMealsScreen> {
  int selectedGoalIndex = -1;
  List<String> goals = [
    "Weight Loss",
    "Muscle Gain",
    "Maintenance",
    "Custom (e.g., Keto, Vegan)"
  ];

  List<String> dietaryPreferences = [
    "High Protein",
    "Vegetarian",
    "Gluten-Free"
  ];
  List<bool> selectedPreferences = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff010A04),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Your Smart Meal Planner',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationScreen()),
                );
              },
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Powered by AI – Personalized to your\ntastes, goals, and schedule",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF80FF80),
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "User Goals",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...goals.asMap().entries.map((entry) {
              int idx = entry.key;
              String label = entry.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGoalIndex = idx;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: selectedGoalIndex == idx
                        ? Colors.white10
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.white54,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedGoalIndex == idx
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          label,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),
            const Text(
              "Dietary Preferences",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: dietaryPreferences.asMap().entries.map((entry) {
                int idx = entry.key;
                String label = entry.value;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPreferences[idx] = !selectedPreferences[idx];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedPreferences[idx]
                            ? Colors.white24
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white54,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          label,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GenerateAiMealsPlanScreen()),
                );
                // Handle Generate action
              },
              child: Center(
                child: Container(
                    width: 265,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5EFFA4), Color(0xFF26FF70)],
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 8),
                        Text(
                          "Generate My Meal Plan",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black),
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
