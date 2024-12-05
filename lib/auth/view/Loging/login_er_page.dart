import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/controller/auth_controller.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool? value = false;
  final _formKey = GlobalKey<FormState>();

  // Email validation regex
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }

    // Regular expression for email validation
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  // Name validation
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    // Minimum name length
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }

    // Optional: Check if name contains only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }

    return null;
  }

  // Password validation
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    // Minimum password length
    if (value.length < 6) {
      return 'Password must be at least 8 characters long';
    }

   

   

   

    return null;
  }

  // Confirm password validation
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  // Form submission method
  void _submitForm() {
    AuthController authController = Get.find();

    authController.signUpWithEmailAndPassword(
        email: _emailController.value.text,
        password: _passwordController.value.text,
        name: _nameController.value.text);
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with registration
    }
  }

  @override
  Widget build(BuildContext context) {

   
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
              child: Form(
                key: _formKey,
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
                    InputFields(
                      input: 'Name',
                      validator: _validateName,
                      controller: _nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // InputFileds(
                    //   input: 'Phone ',
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    InputFields(
                      input: 'Email ',
                      validator: _validateEmail,
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFields(
                      input: 'Password',
                      validator: _validatePassword,
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputFields(
                      input: 'Confirm Password',
                      validator: _validateConfirmPassword,
                      controller: _confirmPassController,
                      onFieldSubmitted: (s) {
                        _submitForm();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: false,
                      child: Row(
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
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder<AuthController>(
                      builder: (controller) => GestureDetector(
                        onTap: () {
                          if (controller.isLoading) {
                            return;
                          }
                          _submitForm();

                          // Get.to(const StartSetupScreen());
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
          ),
          Center(child: AuthLoading(),)
        ],
      ),
    );
  }
}
