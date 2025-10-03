import 'package:flutter/material.dart';
import 'package:my_app/presentation/myworkout/my_workout_screen.dart';

class ExerciseInstructionScreen extends StatefulWidget {
  const ExerciseInstructionScreen({super.key});

  @override
  State<ExerciseInstructionScreen> createState() =>
      _ExerciseInstructionScreenState();
}

class _ExerciseInstructionScreenState extends State<ExerciseInstructionScreen>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late AnimationController _controller;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();

    // Animate the progress bar
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // adjust as needed
    )..addListener(() {
        setState(() {
          _progress = _controller.value;
        });
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isCompleted) {
        _isCompleted = true;
        _navigateToNextPage();
      }
    });

    _controller.forward();
  }

  void _navigateToNextPage() {
    // Navigate to the next exercise or back to workout screen
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2BBB5), // similar bg color
      body: SafeArea(
        child: Stack(
          children: [
            // Centered Image
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/Fitness/bglastpullof.png', // <-- replace with your image
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.7,
              ),
            ),

            // Bottom Text and Progress
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _isCompleted
                          ? "Exercise Complete!"
                          : "Chest up &\nshoulder back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: _isCompleted ? Colors.green : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Dynamic Progress Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: _progress,
                          minHeight: 2,
                          backgroundColor: Colors.black12,
                          color: _isCompleted ? Colors.green : Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Skip button (only show if not completed)
                    if (!_isCompleted)
                      GestureDetector(
                        onTap: () {
                          _controller.stop();
                          _navigateToNextPage();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
