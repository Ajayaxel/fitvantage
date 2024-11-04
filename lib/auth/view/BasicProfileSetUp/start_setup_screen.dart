import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/BasicProfileSetUp/gender_screen.dart';

import 'package:my_app/home/view/home_screen.dart';

class StartSetupScreen extends StatelessWidget {
  const StartSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( children: [
        Positioned(
          left: -5,
          right: -5,
          top: -5,
          bottom: -5,
          child: Image.asset(
            "assets/setup/Start Set Up.png",
           fit: BoxFit.cover,
          ),
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24,right: 24,bottom: 35),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                       Get.to( HomeScreen());
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.4),
                    ),
                  ),
                ),
                 Spacer(
                  flex: 3,
                 ),
                Flexible(
                  child: const SizedBox(
                    height: 459,
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    child: Text(
                      "Start your\n Fitness Journey",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 33),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: FittedBox(
                    child: Text(
                      "Start your fitness journey with our \napp's guidance and support.",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 52,
                ),
              
                GestureDetector(
                      onTap: (){
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>GenderScreen()));
                        },
                  child: Container(
                    height: 56,
                    width: 327,
                    padding: EdgeInsets.only(left: 24, right: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black),
                    child: Center(
                        child: Text(
                      "Set UP",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    )),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
