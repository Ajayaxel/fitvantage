import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/BasicProfileSetUp/constwidget/percentage_details.dart';
import 'package:my_app/lifestylequestiner/view/life_style_scrren.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileSatusScreen extends StatefulWidget {
  const ProfileSatusScreen({super.key});

  @override
  State<ProfileSatusScreen> createState() => _ProfileSatusScreenState();
}

class _ProfileSatusScreenState extends State<ProfileSatusScreen> {
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Image.asset(
              "assets/setup/background setup.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Skip",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.4),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CircularPercentIndicator(
                    radius: 110,
                    lineWidth: 25,
                    percent: 0.7,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    animationDuration: 1800,
                    progressColor: Color(0xff96E912),
                    center: new Text(
                      "78%",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 34.4),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Flexible(
                    child: Text(
                      "Start your fitness journey with our \napp's guidance and support.",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  PercentageDeatils(
                    text: 'Setup account',
                    percent: '20 %',
                    icon: Icons.check,
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  PercentageDeatils(
                    text: 'Personal Info',
                    percent: '40 %',
                    icon: Icons.check,
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  PercentageDeatils(
                    text: 'Diet and health',
                    percent: '30 %',
                    icon: Icons.close,
                  ),
                  Flexible(
                    child: const SizedBox(
                      height: 33,
                    ),
                  ),
                  PercentageDeatils(
                    text: 'Upload Photo',
                    percent: '10 %',
                    icon: Icons.close,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(LifeStyleScrren());
                    },
                    child: Container(
                      height: 56,
                      width: 327,
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(31, 108, 105, 105)),
                      child: Center(
                          child: FittedBox(
                        child: Text(
                          "Complete Your Profile",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
