import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/BasicProfileSetUp/weight_setup_screen.dart';
import 'package:my_app/home/view/bootmNav/bottm_nav.dart';





class AgeSetupScreen extends StatefulWidget {
  const AgeSetupScreen({super.key});

  @override
  State<AgeSetupScreen> createState() => _AgeSetupScreenState();
}

class _AgeSetupScreenState extends State<AgeSetupScreen> {
  int count = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(fit: StackFit.expand, children: [
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
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 35),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
                    Text(
                      "Step 2 of 8",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.4),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const BottmNav());
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.4),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  "How old are you?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 33),
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
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
                const Flexible(
                  child: SizedBox(
                    height: 97,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: SvgPicture.asset(
                      "assets/setup/Polygon 1.svg",
                      fit: BoxFit.cover,
                      height: 32,
                      width: 46,
                    )),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  "$count",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff7FFA88),
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                GestureDetector(
                    onTap: () {
                      if (count > 0) {
                        setState(() {
                          count--;
                        });
                      }
                    },
                    child: SvgPicture.asset(
                      "assets/setup/Polygon 2.svg",
                      fit: BoxFit.cover,
                      height: 32,
                      width: 46,
                    )),
                const Flexible(
                    child: SizedBox(
                  height: 308,
                )),
                const Spacer(flex: 2,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WeightSetupScreen()));
                  },
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(31, 108, 105, 105)),
                    child: Center(
                        child: Text(
                      "Next",
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
