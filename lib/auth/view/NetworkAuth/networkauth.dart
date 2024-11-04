import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/controller/auth_controller.dart';
import 'package:my_app/auth/view/BasicProfileSetUp/start_setup_screen.dart';
import 'package:my_app/auth/view/Loging/login_er_page.dart';
import 'package:my_app/auth/view/Loging/signup_page.dart';

import 'package:my_app/auth/view/NetworkAuth/buttonsauth.dart';

class Networkauth extends StatelessWidget {
  const Networkauth({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    ever(authController.signInWithGoogleEither, (value) {
      value?.fold(
        () => null,
        (either) => either.fold((exception) {
          Get.snackbar(
            'Error',
            exception.message,
          );
        }, (r) {
          Get.offAll(const StartSetupScreen());
        }),
      );
    });
    
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
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
            bottom: 30,
            left: 24,
            right: 24,
            top: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset("assets/Onbording/Frame .svg"),
                const SizedBox(
                  height: 37.78,
                ),
                Flexible(
                  child: FittedBox(
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
                ),
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SignupPage());
                  },
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.only(left: 24, right: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black),
                    child: Center(
                        child: FittedBox(
                      child: Text(
                        "Sign in with Email or Phone",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //loging with apple and google buttons start,
                ButtonScreen(
                  onPressed: () {
                    authController.signInWithApple();
                  },
                  image: 'assets/loging/foundation_social-apple.svg',
                  data: 'Sign in with Apple',
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonScreen(
                  onPressed: () {
                       authController.signInWithGoogle();
                       log("you toched");
                  },
                  image: 'assets/loging/flat-color-icons_google.svg',
                  data: 'Sign in with Google',
                ),
                const Flexible(
                  child: SizedBox(
                    height: 110,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginErPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.montserrat(
                                color: Color(0xff7FFA88),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                //loging with apple and google buttons End,
              ],
            ),
          ),
          Center(
            child: GetBuilder<AuthController>(
              builder: (controller) {
                log('is Loading' + controller.isLoading.toString());
                return Visibility(
                  visible: controller.isLoading,
                  child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      color: Colors.black.withOpacity(.7),
                      child: const CupertinoActivityIndicator(
                        color: Colors.white,
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
