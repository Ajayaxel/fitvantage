import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/pedometer/step_screen.dart';

class StepTrackerCard extends StatefulWidget {
  const StepTrackerCard({super.key});

  @override
  State<StepTrackerCard> createState() => _StepTrackerCardState();
}

class _StepTrackerCardState extends State<StepTrackerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: -pi / 30,
      end: -pi / 15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onCardTap() {
    if (isTapped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: _onCardTap,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: child,
                    );
                  },
                  child: Container(
                    height: 210,
                    decoration: BoxDecoration(
                      color: const Color(0xff7FFA88),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StepTrackerHomePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 210,
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                      // color: Color(0xff161816),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "StepTracker:",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            const Text(
                              "Today",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "667",
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    "Steps",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xff7FFA88),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "View now",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.arrow_outward,
                                        color: Colors.white, size: 18),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/Fitness/Group 48095507 (1).png',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
