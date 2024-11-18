import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 75.75,
        height: 90,

        // width: 339,
        // height: 90,
        margin: const EdgeInsets.only(left: 20, right: 5),
        textStyle: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
        decoration: BoxDecoration(
            color: const Color(0xffF2F4F7), borderRadius: BorderRadius.circular(14)));
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0, left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                        Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back)),
                Center(
                  child: Text(
                    "OTP Verification",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "We’ve just send you 4 digits to your email ",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    color: const Color(0xff667085),
                  ),
                ),
                Text(
                  "example@example.com",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff435A39),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 18),
            child: Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!
                      .copyWith(border: Border.all(color:const Color(0xffE0E0E0)))),
              onCompleted: (value) => debugPrint(value),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn’t receive the verification code? ",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff667085),
                ),
              ),
              Text("Resend Code",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff435A39),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
