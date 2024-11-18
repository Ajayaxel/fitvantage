import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/myworkoutplans/view/myworkout_details_screen.dart';

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackgroundImage(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.01,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AT CENTER",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.035,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(thickness: 2),
                  SizedBox(height: screenHeight * 0.01),
                  GlassContainer(
                    borderRadius: BorderRadius.circular(15),
                    border: 0.3,
                    blur: 10,
                    height: screenHeight * 0.3,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenHeight * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "fitpass ELITE",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 0.04,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            "PACKS STARTING AT 862/MONTH",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w800,
                              fontSize: screenWidth * 0.05,
                              color: Colors.white,
                              shadows: const [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Extra 1500 off+3 months \nextension",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.04,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    "Your smart workout plans",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyworkoutDetailsScreen()));
                    },
                    child: GlassContainer(
                      borderRadius: BorderRadius.circular(15),
                      border: 0.3,
                      blur: 10,
                      height: screenHeight * 0.25,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenHeight * 0.05),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today's\nworkout plan",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w800,
                                    fontSize: screenWidth * 0.05,
                                    color: Colors.white,
                                    shadows: const [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black,
                                        offset: Offset(5.0, 5.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  "VIEW >",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/Onbording/content-management.webp',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Explore fitpass",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    height: screenHeight * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                          child: GlassContainer(
                            borderRadius: BorderRadius.circular(15),
                            border: 0.3,
                            blur: 10,
                            height: screenHeight * 0.22,
                            width: screenWidth * 0.3,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ELITE",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w800,
                                      fontSize: screenWidth * 0.04,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "862/month",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenWidth * 0.03,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "onwards",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenWidth * 0.03,
                                      color: Colors.white54,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  Container(
                                    height: screenHeight * 0.04,
                                    width: screenWidth * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "VIEW",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

