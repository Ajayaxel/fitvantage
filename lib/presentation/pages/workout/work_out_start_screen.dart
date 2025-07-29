import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/workout/work_out_timestart.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class WorkOutStartScreen extends StatelessWidget {
  const WorkOutStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF7FFA88);
    const Color cardColor = Color(0xFF898989);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back + Title
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios,
                              color: Colors.white)),
                      const Spacer(),
                      const Text(
                        'Day 1',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 24), // To balance the back icon width
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Main image with overlay
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/Tranfrom/workoutstart.png',
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // Aligned Bottom Card Overlay
                        Positioned(
                          bottom: 12,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                color: cardColor.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.timer_outlined,
                                          color: green, size: 18),
                                      SizedBox(width: 6),
                                      Text(
                                        'Time\n30 min',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          height: 1.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Colors.white24,
                                    thickness: 1,
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.local_fire_department,
                                          color: green, size: 18),
                                      SizedBox(width: 6),
                                      Text(
                                        'Burn\n89 kcal',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          height: 1.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Title and description
                  const Text(
                    'Lower Body Training',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lower body training is crucial for overall fitness, focusing on exercises that strengthen the legs.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Rounds section
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rounds',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '1/8',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Round item
                  const Cards(cardColor: cardColor),
                  const SizedBox(height: 10,),
                      const Cards(cardColor: cardColor),
                  const SizedBox(height: 10,),
                      const Cards(cardColor: cardColor),
                  const SizedBox(height: 10,),
                ],
              ),
            ),

            // Bottom Button
            Align(
              alignment: Alignment.bottomCenter,
              child: Constbutton(
                onTap: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkoutTimerScreen(),
                  ),
                );
                },
                text: "Let’s Workout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.cardColor,
  });

  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/Tranfrom/workout.png',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jumping Jacks',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '00:30',
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
          ),
          const Icon(Icons.play_circle_fill,
              color: Colors.white38, size: 36),
        ],
      ),
    );
  }
}
