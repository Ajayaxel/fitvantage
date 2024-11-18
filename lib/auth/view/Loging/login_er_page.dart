import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/BasicProfileSetUp/start_setup_screen.dart';
import 'package:my_app/auth/view/Loging/signup_page.dart';
import 'package:my_app/auth/view/Loging/widget/input_buttons.dart';

class LoginErPage extends StatefulWidget {
  const LoginErPage({
    super.key,
  });

  @override
  State<LoginErPage> createState() => _LoginErPageState();
}

class _LoginErPageState extends State<LoginErPage> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 16,
                left: 24,
                right: 24,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/loging/arrowback.svg"),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Back",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35.5,
                  ),
                  Text(
                    "Create Account",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: FittedBox(
                      child: Text(
                        "Start your fitness journey with our \napp's guidance and support.",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFileds(
                    input: 'Name',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFileds(
                    input: 'Phone ',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFileds(
                    input: 'Email ',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFileds(
                    input: 'Password',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFileds(
                    input: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          checkColor: Colors.black,
                          activeColor: const Color(0xff7FFA88),
                          // Example with tristate
                          value: value,
                          onChanged: (bool? newValue) {
                            setState(() {
                              value = newValue;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: 'By continuing, you agree to  ',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            /*defining default style is optional */
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Terms of Use ',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  )),
                              TextSpan(
                                text: 'and ',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const StartSetupScreen());
                    },
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      )),
                    ),
                  ),
                  const SizedBox(height: 38),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()));
                    },
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign In',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: const Color(0xff7FFA88),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
