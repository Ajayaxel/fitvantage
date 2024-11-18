import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/Loging/widget/backbuttons.dart';
import 'package:my_app/auth/view/Loging/widget/input_buttons.dart';

class ResetPassordPage extends StatelessWidget {
  const ResetPassordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
          top: -5,
          right: -5,
          left: -5,
          bottom: -5,
          child: Image.asset(
            "assets/Onbording/Aurora background.png",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24,right: 24,bottom: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Align(
                    alignment: Alignment.centerLeft, child: ArrowBackButton()),
                const SizedBox(
                  height: 86.5,
                ),
                FittedBox(
                  child: Text(
                    "Reset Password",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 28),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: Text(
                    "Lorem ipsum dolor sit amet, onsectetur\n adipiscing elit and support.",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                    
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InputFileds(input: "New Password"),
                const SizedBox(
                  height: 16,
                ),
                InputFileds(input: "Confirm Password"),
                const Spacer(),
               const Flexible(
                 child: SizedBox(
                    height: 306,
                  ),
               ),
                GestureDetector(
                  onTap: () {
                    //   Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //     builder: (context) =>));
                  },
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black),
                    child: Center(
                        child: Text(
                      "Continue",
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
