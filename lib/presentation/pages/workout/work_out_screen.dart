import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/workout/work_out_start_screen.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color cardColor = Color(0xFF181B19);
    const Color green = Color(0xFF7FFA88);

    Widget buildDayCard(String day, bool isStartVisible) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/Tranfrom/workout.png",
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '3 min | 27 kcal',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            if (isStartVisible)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WorkOutStartScreen(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      );
    }

    Widget buildStage(String title, List<String> days, int progressDay) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              const Text(
                '1/8',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Activate you body',
            style: TextStyle(color: Colors.white60),
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(days.length, (index) {
              return Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                      if (index != days.length - 1)
                        Container(
                          height: 60,
                          width: 2,
                          color: Colors.white30,
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildDayCard(
                      days[index],
                      index == 0,
                    ),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 24),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(onTap: () {
                      Navigator.pop(context);
                    }, child: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                    const Text(
                      'Workout',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.more_vert, color: Colors.transparent), // Spacer
                  ],
                ),
                const SizedBox(height: 10),

                const Text(
                  'Full Body Strength Booster',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Stage 1
                buildStage(
                  'Stage 1',
                  ['Day 1', 'Day 2', 'Day 3', 'Day 4'],
                  1,
                ),

                // Stage 2
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stage 2',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '1/8',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const Text(
                  'Activate you body',
                  style: TextStyle(color: Colors.white60),
                ),
                buildStage(
                  '',
                  ['Day 1', 'Day 2', 'Day 3'],
                  1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
