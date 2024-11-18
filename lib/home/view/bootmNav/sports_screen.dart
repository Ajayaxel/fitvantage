import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/home/view/bootmNavconst/glass_conatiner.dart';

import 'package:my_app/home/view/bootmNavconst/main_galss.dart';
import 'package:my_app/home/view/bootmNavconst/sports_card_caroule.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

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
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "sports",
                        style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 26,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   "FITSTART",
                  //   style: GoogleFonts.manrope(
                  //       color: const Color.fromARGB(255, 80, 196, 2),
                  //       fontSize: 38,
                  //       fontWeight: FontWeight.w900),
                  // ),
                  SizedBox(
                      height: 70,
                      width: 150,
                      child: SvgPicture.asset(
                        "assets/loging/Frame 131.svg",
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 18,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "  INDIA'S BIGGEST FITENSS SALE  ",
                      style: GoogleFonts.manrope(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Extra 4,500 OFF\n + 1.5 months extension  FREE",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: GlassButton(
                      onPressed: () {},
                      radius: 8,
                      border: -1,
                      child: const Text(
                        "BUY NOW, START ANYTIME",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 40, right: 40, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        iconWithLabel(
                            "https://cdn-icons-png.freepik.com/256/10568/10568709.png",
                            "play\nbadminton"),
                        iconWithLabel(
                            "https://cdn-icons-png.flaticon.com/512/10806/10806266.png",
                            "learn\nswimming"),
                        iconWithLabel(
                            "https://cdn-icons-png.flaticon.com/512/9978/9978844.png",
                            "play\ntable tennis"),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Get unlimited access",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Glasscontainer(
                        title: 'One sport at\none center',
                        subtitle: 'Pick a sport',
                      ),
                      Glasscontainer(
                        title: 'All sports at all\ncenters',
                        subtitle: '812/month',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "center near Kerala ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Maingalssconatiner(),
                  const SizedBox(
                    height: 60,
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
                            radius: 25, // Adjust the size of the circle
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7apWX5sTwU972TWkCnumETpJS-bQLA_qTDw&s"),
                            // Optional: set a background color
                            backgroundColor: Colors.black,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Need help?",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                    color: Colors.white54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "CHAT WITH US >",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Expolore all sports",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                          color: Colors.white60,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SportsCarousel(),
                  const SizedBox(
                    height: 40,
                  ),
                  //ending section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "FAQs",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w800),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
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
                     const SizedBox(height: 22,),
                    Row(
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
                  const SizedBox(height: 22,),
                    Row(
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
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//icons with text
Widget iconWithLabel(String imageUrl, String label) {
  return Column(
    children: [
      Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(8), // Adjust for rounded square
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}
