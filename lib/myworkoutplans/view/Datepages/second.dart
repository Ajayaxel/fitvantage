import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/myworkoutplans/view/const/tutorial.dart';


class Second extends StatelessWidget {
  const Second ({super.key});

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
            "assets/loging/12501301-Weighted-Crunch-(behind-head)_Waist_720.gif",
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 23,
                  ),
                ),

                const SizedBox(
                  height: 45,
                ),
                Text(
                  "Step 3 of 3",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.4),
                ),
                Text(
                  "final work out",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 33),
                ),

                const SizedBox(
                  height: 280,
                ),
                Text(
                  "10",
                  style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 45),
                ),
                const Text(
                  "RES",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
          
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[800],
                                child: const Icon(Icons.edit, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              const Text("Log",
                                  style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[800],
                                child: const Icon(Icons.refresh, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              const Text("Replace",
                                  style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoScreen()));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[800],
                                  child: const Icon(Icons.play_circle_outline,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                const Text("Tutorial",
                                    style: TextStyle(color: Colors.white70)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      // Timer Box
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(   color: Colors.grey[800],borderRadius: const BorderRadius.all(Radius.circular(24))),
                     
                        child: Row(
                          children: [
                            Container(
                              
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10, top: 10),
                              //height: 80,
                              width: 80,
                              decoration: const BoxDecoration(color: Colors.white30,borderRadius: BorderRadius.all(Radius.circular(18))),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "30",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22),
                                  ),
                                  Text("SECS",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Next Up",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Text("Rest",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14)),
                              ],
                            ),
                            const SizedBox(width: 100,),
                            const Expanded(
                              child: Icon(Icons.play_arrow,
                                  color: Colors.white, size: 36),
                            ),
                          ],
                        ),
                      )
                    ],
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