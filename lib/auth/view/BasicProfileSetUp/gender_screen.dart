import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/BasicProfileSetUp/age_setup_screen.dart';

import 'package:my_app/home/view/home_screen.dart';


class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
   int selectedIndex=0;
  

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
            padding: const EdgeInsets.only(left: 24,right: 24,bottom: 35),
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
                      "Step 1 of 8",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.4),
                    ),
                    GestureDetector(
                      onTap: () {
                         Get.to(HomeScreen());
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
                  "What’s Your\n Gender",
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
                const SizedBox(
                  height: 57.76,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   GenderBox(gender: Icons.female,status: selectedIndex==0,onTap: () {
                     setState(() {
                        selectedIndex=0;
                     });
                   },),
                    const SizedBox(width: 16,),
                      GenderBox(gender: Icons.male,status: selectedIndex==1,onTap: () {
                        setState(() {
                          selectedIndex=1;
                        });
                      },),
                  ],
                ),
                const SizedBox(height: 8,),
                Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Female",style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),),
                  const SizedBox(width: 70,),
                    Text("Male",style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),),
                ],),
                       //     SizedBox(height: 330,),
                       const Spacer(
                        flex: 5,
                       ),
                 GestureDetector(
                   onTap: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AgeSetupScreen()));
                   },
                   child: Container(
                    height: 56,
                    width: 327,
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

// ignore: must_be_immutable
class GenderBox extends StatelessWidget {
  
  final IconData gender;
  final bool status;

  final Function()? onTap;
  const GenderBox({
    super.key, required this.gender, required this.status, this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(8),
           border:status? Border.all(color: const Color(0xff7FFA88)):null),
       child:Icon(gender,color: Colors.white,),
                          ),
    );
  }
}
