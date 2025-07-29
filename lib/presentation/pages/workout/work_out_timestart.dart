import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/workout/time_start.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class WorkoutTimerScreen extends StatelessWidget {
  const WorkoutTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Top Navigation Row
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Squats',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Woman Image + "Ready to Go" + "10"
              Stack(
                alignment: Alignment.center,
                children: [
                  // Woman image behind
                  SizedBox(
                    width: 150,
                    height: 271,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/workout/workoutwomen.png',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 271,
                        ),
                        Container(
                          width: 150,
                          height: 271,
                          color: const Color(0xff010A04).withValues(alpha: 0.4), // Adjust opacity here for "deme" effect
                        ),
                      ],
                    ),
                  ),

                  // Foreground Text
                  const Column(
                    children: [
                      SizedBox(height: 200),
                      Text(
                        'Ready to Go',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 150,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Training Text
              const Text(
                'Lower Body Training',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Timer
              const Text(
                '00:30',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              // Start Now Button
              Constbutton(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimeStart(),
                  ),
                );
              }, text: 'Start Now'),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
