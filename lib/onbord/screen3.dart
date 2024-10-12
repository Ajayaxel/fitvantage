import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/NetworkAuth/networkauth.dart';
import 'package:my_app/onbord/onbordcontent_model.dart';
import 'package:my_app/onbord/screen1.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff7FFA88),
      // body: Column(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Stack(
      //       children: [
      //         // Image.asset("assets/Onbording/bg.png",height: 319,),
      //         Container(
      //         height: 319.62,
      //         decoration: const BoxDecoration(
      //             image: DecorationImage(
      //           image: AssetImage(
      //             "assets/Onbording/Layer_1.png",
      //           ),
      //           fit: BoxFit.cover,
      //         )),
      //       ),
      //       ],
      //     ),
      //     const SizedBox(height: 69.38),
      //     OnbordContent(),
      //     SizedBox(
      //       height: 52,
      //     ),

      //     GestureDetector(
      //       onTap: () {
      //                Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const LogingScreen()));
      //       },
      //       child: Container(
      //         height: 56,
      //         width: 327,
      //         padding: EdgeInsets.only(left: 24, right: 24),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(12), color: Colors.black),
      //         child: Center(
      //             child: Text(
      //           "Get Started",
      //           style: GoogleFonts.montserrat(
      //               color: Colors.white,
      //               fontWeight: FontWeight.w700,
      //               fontSize: 16),
      //         )),
      //       ),
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   left: 0,
          //   bottom: 0,
          //   child: Image.asset(
          //     "assets/Onbording/Aurora background.png",
          //     fit: BoxFit.cover,
          //   ),
          // ),
          //  SvgPicture.asset("assets/Onbording/Vector (1).svg"),

          // SizedBox(
          //   height: 69.38,
          // ),
          OnbordContent(showGetStarted: true,),
          // SizedBox(height: 177),
         
          
        ],
      ),
    );
  }
}
