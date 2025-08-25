
import 'dart:ui';

import 'package:flutter/material.dart';

class FitnessCard extends StatelessWidget {
  const FitnessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage(
                'assets/Homeimages/Rectangle 40.png'), // Your gym image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Top Badge
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "DAILY CLASSES",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),

            // Bottom Glass Blur Section
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.25),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Left glowing circle
                        Positioned(
                          left: -50,
                          top: -3,
                          child: Container(
                            width: 60,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF3EFF7B),
                                  Color(0x883EFF7B),
                                  Color(0x443EFF7B),
                                  Color(0x003EFF7B),
                                ],
                                stops: [0.0, 0.3, 0.6, 1.0],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF3EFF7B)
                                      .withValues(alpha: 0.5),
                                  blurRadius: 40,
                                  spreadRadius: 20,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Right glowing circle
                        Positioned(
                          right: -50,
                          bottom: -3,
                          child: Container(
                            width: 50,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF3EFF7B),
                                  Color(0x883EFF7B),
                                  Color(0x443EFF7B),
                                  Color(0x003EFF7B),
                                ],
                                stops: [0.0, 0.3, 0.6, 1.0],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF3EFF7B)
                                      .withValues(alpha: 0.5),
                                  blurRadius: 40,
                                  spreadRadius: 20,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Bottom content
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mass Fitness",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "Jumeirah",
                                        style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withValues(alpha: 0.2),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.3),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "BOOK NOW",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
