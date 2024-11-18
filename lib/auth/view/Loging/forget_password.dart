import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/Loging/otp_page.dart';
import 'package:my_app/auth/view/Loging/widget/backbuttons.dart';
import 'package:my_app/auth/view/Loging/widget/input_buttons.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
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
                const SizedBox(height: 20,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: ArrowBackButton(leftPadding: 0,)),
                  const SizedBox(height: 86.5,),
                      Text(
                  "Forgot Password",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 28),
                ),
                const SizedBox(height: 20,),
                FittedBox(
                  child: Text(
                      "Lorem ipsum dolor sit amet,\n onsectetur adipiscing elit and support.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ),
                  const SizedBox(height: 30,),
                         InputFileds(input: "Enter email or phone"),
                         const Spacer(),
                    
                 GestureDetector(
                onTap: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OtpPage()));
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
