import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/Loging/reset_passord_page.dart';
import 'package:my_app/auth/view/Loging/widget/backbuttons.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
            child: GestureDetector(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft, child: ArrowBackButton()),
                  const SizedBox(
                    height: 68,
                  ),
                  Text(
                    "OTP",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FittedBox(
                    child: Text(
                      "Start your fitness journey with our\n app's guidance and support.",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 56,
                    // width: 327,
                    // padding: const EdgeInsets.only(left: 20, top: 3.3),
                    padding:
                        const EdgeInsets.only(left: 20, top: 18, bottom: 16, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: const BorderRadius.all(Radius.circular(12))),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Text("0:29",style: GoogleFonts.montserrat(
                          color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14,
                        ),),
              
                        // suffixIcon: Icon(Icons.visibility),
                        hintText: "Enter Code",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: const Color(0xff0A0B0A).withOpacity(0.4),
                            fontWeight: FontWeight.w500),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Spacer(),
                   const Flexible(
                     child: SizedBox(
                      height: 306,
                                     ),
                   ),
                  GestureDetector(
                                    onTap: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPassordPage()));
                    },
                    child: Container(
                      height: 56,
                    //  width: 327,
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black),
                      child: Center(
                          child: Text(
                        "Verify",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Resent code",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
