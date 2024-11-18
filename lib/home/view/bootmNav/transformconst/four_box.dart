import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter

class RatingSubtitleRow extends StatelessWidget {
  const RatingSubtitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for dynamic adjustments
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      // Space the boxes apart
      children: [
        // First Box: Rating
        Expanded(
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // BackdropFilter for Glassmorphism effect
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 10, sigmaY: 10), // Apply blur
                      child: Container(
                        color: Colors.black
                            .withOpacity(0), // Transparent background
                      ),
                    ),
                  ),
                  // Content with same glassmorphism background
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.2), // Semi-transparent background
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center content horizontally
                      children: [
                        Text(
                          '4.8 Rating',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Based on 200 reviews',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
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

        // Second Box: Subtitle
        SizedBox(width: screenWidth * 0.05), // Add some space between boxes
        Expanded(
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // BackdropFilter for Glassmorphism effect
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 10, sigmaY: 10), // Apply blur
                      child: Container(
                        color: Colors.black
                            .withOpacity(0), // Transparent background
                      ),
                    ),
                  ),
                  // Content with same glassmorphism background
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.2), // Semi-transparent background
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center content horizontally
                      children: [
                        Text(
                          'Top-rated classes!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "based on 300 review",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
