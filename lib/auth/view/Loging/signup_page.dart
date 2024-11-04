import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/controller/auth_controller.dart';

import 'package:my_app/auth/view/BasicProfileSetUp/start_setup_screen.dart';
import 'package:my_app/auth/view/Loging/forget_password.dart';
import 'package:my_app/auth/view/Loging/login_er_page.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
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
        children: [
          Positioned(
            top: -5,
            left: -5,
            right: -5,
            bottom: -5,
            child: Image.asset(
              "assets/Onbording/Aurora background.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                    height: 65,
                  ),
                  Text(
                    "Welcome",
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 56,

                    // padding: const EdgeInsets.only(left: 20, top: 3.3),
                    padding: EdgeInsets.only(
                        left: 20, top: 18, bottom: 16, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // suffixIcon: Icon(Icons.visibility),
                        hintText: "Email or Phone",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Color(0xff0A0B0A).withOpacity(0.4),
                            fontWeight: FontWeight.w500),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 56,

                    // padding: const EdgeInsets.only(left: 20, top: 3.3),
                    padding: EdgeInsets.only(
                        left: 20, top: 18, bottom: 16, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // suffixIcon: Icon(Icons.visibility),
                        hintText: "Password",
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Color(0xff0A0B0A).withOpacity(0.4),
                            fontWeight: FontWeight.w500),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password !';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPassword()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: const Color(0xff0A0B0A),
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartSetupScreen()));
                    },
                    child: Container(
                      height: 56,
                      padding: EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black),
                      child: Center(
                          child: Text(
                        "Sign In",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "or sign up with",
                    style: GoogleFonts.leagueSpartan(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: SvgPicture.asset(
                              "assets/loging/flat-color-icons_google.svg"),
                          onPressed: () {
                            authController.signInWithGoogle();
                          },
                          label: FittedBox(
                            child: Text(
                              "Google",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.white,
                            fixedSize: const Size(155, 56),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: SvgPicture.asset(
                              "assets/loging/foundation_social-apple.svg"),
                          onPressed: () {
                            authController.signInWithApple();
                          },
                          label: FittedBox(
                            child: Text(
                              "Apple",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.white,
                            fixedSize: const Size(155, 56),
                          ),
                        ),
                      ),
                    ],
                  ),
                
                     SizedBox(
                      height: 97,
                    ),
                  
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginErPage()));
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
                              maxLines: 1,
                              style: GoogleFonts.montserrat(
                                  color: Color(0xff7FFA88),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: GetBuilder<AuthController>(
              builder: (controller) {
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
