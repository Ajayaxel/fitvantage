import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RowBox extends StatelessWidget {
  const RowBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GlassContainer(
              borderRadius: BorderRadius.circular(15),
              border: 0.3,
              blur: 10,
              height: screenHeight * 0.25, // Responsive height
              width: screenWidth * 0.4, // Responsive width
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: screenHeight * 0.15, // Responsive image height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/premium-vector/man-gym-sport-workout-fitness-club-muscular-men-characters-training-with-dumbbell-barbell-room-with-sport-equipment-powerlifting-cartoon-bodybuilder-vector-concept_176411-5663.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      radius: 15,
                      child: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.17, // Responsive position
                    left: screenWidth * 0.1, // Responsive position
                    child: Text(
                      "Apparel",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.04, // Responsive font size
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.20, // Responsive position
                    left: screenWidth * 0.1, // Responsive position
                    child: Text(
                      "Starting at 699",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        fontSize: screenWidth * 0.035, // Responsive font size
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GlassContainer(
              borderRadius: BorderRadius.circular(15),
              border: 0.3,
              blur: 10,
              height: screenHeight * 0.25, // Responsive height
              width: screenWidth * 0.4, // Responsive width
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: screenHeight * 0.15, // Responsive image height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/premium-vector/man-gym-sport-workout-fitness-club-muscular-men-characters-training-with-dumbbell-barbell-room-with-sport-equipment-powerlifting-cartoon-bodybuilder-vector-concept_176411-5663.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      radius: 15,
                      child: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.17, // Responsive position
                    left: screenWidth * 0.1, // Responsive position
                    child: Text(
                      "Apparel",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.04, // Responsive font size
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.20, // Responsive position
                    left: screenWidth * 0.1, // Responsive position
                    child: Text(
                      "Starting at 699",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        fontSize: screenWidth * 0.035, // Responsive font size
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

