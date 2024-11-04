import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_app/home/view/components/caroule_screen.dart';
import 'package:my_app/home/view/components/fadeedge.dart';
import 'package:my_app/home/view/components/iconwithtext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // BackgroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                CarouleScreen(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, bottom: 10, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconWithText(
                        icon: Icons.scale, // Placeholder icon for "weight loss"
                        label: "weight\nloss",
                      ),
                      IconWithText(
                        icon: Icons
                            .fitness_center, // Placeholder icon for "workout at home"
                        label: "workout\nat home",
                      ),
                      IconWithText(
                        icon: Icons
                            .self_improvement, // Placeholder icon for "meditate at home"
                        label: "meditate\nat home",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, bottom: 10, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconWithText(
                        icon: Icons
                            .sports_bar, // Placeholder icon for "weight loss"
                        label: "buy sports\nwear",
                      ),
                      IconWithText(
                        icon: Icons
                            .play_lesson_sharp, // Placeholder icon for "workout at home"
                        label: "play\nsports",
                      ),
                      IconWithText(
                        icon: Icons
                            .bookmark, // Placeholder icon for "meditate at home"
                        label: "book a\ncult class",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for the button
                  },
                  child: Text(
                    "SEE MORE",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GlassContainer(
                  borderRadius: BorderRadius.circular(12),
                  border: 0,
                  blur: 10,
                  height: 90,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "FITSTART",
                              style: GoogleFonts.manrope(
                                  color: const Color.fromARGB(240, 236, 83, 44),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: SizedBox(
                                height: 15,
                                child: ColoredBox(
                                    color: Colors.white,
                                    child: Text(
                                      "INDIA'S BIGGEST FITNESS SALE",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.manrope(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 8),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const VerticalDivider(
                          color: Color.fromARGB(255, 241, 57, 1),
                          thickness: 2,
                          width: 20, // Width of the space the divider takes
                          indent: 10, // Spacing from the top
                          endIndent: 10, // Spacing from the bottom
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOWEST PRICES ON\nCULTPASS",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "EXPOLORE NOW >",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 8,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //DISCOVER MORE //
                Text(
                  "Discover more",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GlassContainer(
                  borderRadius: BorderRadius.circular(15),
                  border: 0.3,
                  blur: 10,
                  height: 130,
                  width: 350,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              left: 10,
                            ),
                            child: Container(
                              height: 110,
                              width: 135,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://img.freepik.com/premium-vector/two-men-running-across-blue-white-background-vector-illustration-2d_1173418-1004.jpg'), // Network image URL
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Personal\nTraining",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.6),
                        radius: 15,
                        child: Icon(Icons.chevron_right_outlined),
                      ),
                      SizedBox(width: 15,)
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
