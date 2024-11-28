import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/home/view/bootmNav/transformconst/divider_const.dart';
import 'package:my_app/home/view/bootmNav/transformconst/expert_card.dart';
import 'package:my_app/home/view/bootmNav/transformconst/four_box.dart';
import 'package:my_app/home/view/bootmNav/transformconst/google_riview_cards.dart';
import 'package:my_app/home/view/bootmNav/transformconst/samllcards.dart';
import 'package:my_app/home/view/lifestyleScorescreens/habit_screen.dart';

class AtHomePage extends StatelessWidget {
  const AtHomePage({super.key});

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
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 70,
                      width: 150,
                      child: SvgPicture.asset(
                        "assets/loging/Frame 131.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        "  INDIA'S BIGGEST FITNESS SALE  ",
                        style: GoogleFonts.manrope(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HabitScreen()),
                        );
                      },
                      child: Text(
                        "Extra 4,500 OFF",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 250,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: const Center(
                        child: Text(
                          "EXPLORE FIT TRANSFORM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Dividerwidget(text: 'What you’ll unlock'),
                    const ExpertCard(
                      title: "Nutrition",
                      subtitle: "Expert",
                      imageUrl: "assets/Onbording/fitness-banner.png",
                      bulletPoints: [
                        "Weekly 1:1 consultations with customized nutrition plans.",
                        "Real, homely meal plans—no quick fixes, just sustainable health.",
                        "Custom nutrition advice that fits your lifestyle and budget"
                      ],
                      gradientStartColor: Color(0xFF0D324D),
                      gradientEndColor: Color(0xFF7F5A83),
                    ),
                    const ExpertCard(
                      title: "Mindset",
                      subtitle: "Expert",
                      imageUrl: "assets/Onbording/fitness-banner.png",
                      bulletPoints: [
                        "1:1 online consultations to strengthen your mental clarity and focus.",
                        "Personalized mindset strategies to help you overcome challenges and stay positive.",
                        "Empowering you with techniques to manage stress, build resilience, and improve mental health."
                      ],
                      gradientStartColor: Color(0xFF0D324D),
                      gradientEndColor:
                          Color.fromARGB(255, 132, 246, 112),
                    ),
                    const ExpertCard(
                      title: "Fitness",
                      subtitle: "Expert",
                      imageUrl: "assets/Onbording/fitness-banner.png",
                      bulletPoints: [
                      "1:1 online consultations, tailored assessments, and progressive workout routines.",
                      "Live interactive training with your expert coach, anytime and anywhere.",
                      "Fitness plans designed to safely accommodate injuries and health conditions."

                      ],
                      gradientStartColor: Color(0xFF0D324D),
                      gradientEndColor: Color.fromARGB(255, 203, 28, 223),
                    ),
                    Dividerwidget(text: "There’s more to unlock"),
                    const ExpertCard(
                      title: "Medical Doctor",
                      subtitle: "Expert",
                      imageUrl: "assets/Onbording/fitness-banner.png",
                      bulletPoints: [
                      "1:1 online consultations with a trusted medical doctor for expert care and advice.",
                      "Tailored health plans designed to support your medical needs and promote wellness.",
                      "Comprehensive medical support for managing chronic conditions and improving overall health."
                      ],
                      gradientStartColor: Color(0xFF0D324D),
                      gradientEndColor: Color.fromARGB(225, 77, 103, 247),
                    ),
                    Dividerwidget(text: "AND YOU ALSO GET"),
                    const SmallGroupClassesScreen(),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: RatingSubtitleRow(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: RatingSubtitleRow(),
                    ),
                    GlassContainer(
                      borderRadius: BorderRadius.circular(12),
                      border: 0.4,
                      blur: 10,
                      height: screenHeight * 0.12,
                      width: screenWidth * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  "https://cdn-icons-png.flaticon.com/512/584/584554.png"),
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Which plan is right for you?",
                                  style: GoogleFonts.manrope(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "Let us recommend a right fit\nplan for your goal!",
                                  style: GoogleFonts.manrope(
                                      color: Colors.white54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "4.9 (2159+). Google Reviews",
                              style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(Icons.star,
                                color: Colors.yellow, size: 16),
                          ],
                        ),
                      ),
                    ),
                    const ReviewScreen(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "01",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                                color: Colors.white54,
                                fontSize: 19,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "What is fit pass play",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.add,
                            color: Colors.white54,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "02",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                                color: Colors.white54,
                                fontSize: 19,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "How can i purchaase fitpass paln",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.add,
                            color: Colors.white54,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "03",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                                color: Colors.white54,
                                fontSize: 19,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "How is fitpass play different from\notheer fitpass proelite",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.add,
                            color: Colors.white54,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45,
                        width: 170,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white38,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "EXPOLRE PLANS",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        height: 45,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "TALK TO US",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
