import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/home/view/lifestyleScorescreens/habit_screen.dart';


class NutritionScoreScreen extends StatelessWidget {
  const NutritionScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600], // Matches the dark gradient background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>HabitScreen()),
              );

              // Handle close button
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.spa, size: 60, color: Colors.yellowAccent),
              const SizedBox(height: 20),
              const Text(
                'Your Nutrition Score is',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '50',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'You’ve got this, Mohammed! Talk to your Habit\nCoach'
                'to align your nutrition habits to your goal.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 40),
              // Animated character placeholder
              Container(
                height: 100,
                child: SvgPicture.asset(
                  'assets/loging/6385d0ff975de43baebcb910_magic-wand@2x.svg',
                  fit: BoxFit.contain,
                  // Responsive height
                ),
              ),
              const SizedBox(height: 40),
              // Icon Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconWithLabel(Icons.directions_run, "Movement"),
                    _buildIconWithLabel(Icons.spa, "Nutrition"),
                    _buildIconWithLabel(Icons.self_improvement, "Stress"),
                    _buildIconWithLabel(Icons.nightlight_round, "Sleep"),
                  ],
                ),
              ),
              //const Spacer(),
              // Button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.white,
                    minimumSize:
                        const Size(double.infinity, 50), // Full width button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Handle button press
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>HabitScreen()),
                );
                  },
                  child: const Text(
                    'REASSESS YOUR STRESS SCORE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white12,
          child: Icon(icon, size: 30, color: Colors.white),
          radius: 30,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
