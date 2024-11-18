import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/head_nav.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/next_button.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/diet_screen_three.dart';

class SpecifySupplementScrenn extends StatelessWidget {
  const SpecifySupplementScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackgroundImage(),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                HeadNavgtion(
                  text: 'Nutrition',
                ),
                const SizedBox(
                  height: 45,
                ),
                FittedBox(
                  child: Text(
                    "Specify Supplement",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: Text(
                    "Please specify your supplement.",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 107,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "See All Supplements",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xff7FFA88),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(5), // Gap between boxes
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff24262B)),
                          height: 48,
                          width: 88,
                          child: Center(
                            child: Text('Protein',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5), // Gap between boxes
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xff24262B)),
                        height: 48,
                        width: 85,
                        child: Center(
                          child: Text('Whey',
                              maxLines: 1,
                              style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Flexible(
                        child: Container(
                          margin: const EdgeInsets.all(5), // Gap between boxes
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xff24262B)),
                            height: 48,
                            child: Center(
                              child: Text('BCAAs',
                                  style: GoogleFonts.manrope(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(5), // Gap between boxes
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff24262B)),
                          height: 48,
                          width: 88,
                          child: Center(
                            child: Text('Vitamin D',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(5), // Gap between boxes
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff24262B)),
                          height: 48,
                          //  width: 88,
                          child: Center(
                            child: Text('Magnesium',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(5), // Gap between boxes
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff24262B)),
                          height: 48,
                          // width: 88,
                          child: Center(
                            child: Text('Iron',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(5), // Gap between boxes
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff24262B)),
                          height: 48,
                          //  width: 88,
                          child: Center(
                            child: Text('Caffeine',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(5), // Gap between boxes
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff24262B)),
                          height: 48,
                          //width: 88,
                          child: Center(
                            child: Text('Omega 4',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(5), // Gap between boxes
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff24262B)),
                          height: 48,
                          child: Center(
                            child: Text('Omega 8',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5), // Gap between boxes
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xff24262B)),
                        height: 48,
                        width: 88,
                        child: Center(
                          child: Text('Calcium',
                              style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
                  const Spacer(),
                NextButton(onTap: () {
                  Get.to(const DietScreenThree());
                })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
