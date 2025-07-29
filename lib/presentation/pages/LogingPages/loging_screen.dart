import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:my_app/blocs/auth/auth_bloc.dart';
import 'package:my_app/blocs/auth/auth_event.dart';
import 'package:my_app/blocs/auth/auth_state.dart';
import 'package:my_app/presentation/pages/LogingPages/forgetpassword.dart';
import 'package:my_app/presentation/pages/LogingPages/registerscrenn.dart';
import 'package:my_app/presentation/pages/mainpages/view/main_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';
import 'package:my_app/presentation/widgets/loding_indiactor.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginScreen({super.key});

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xff171917),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF7FFA88)),
          borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           CircleAvatar(
            backgroundColor: Colors.black38,
            radius: 50,
            child: Image.asset("assets/loging/page-found_4380549 1.png", fit: BoxFit.cover, height: 50, width: 50),
            ),
            const SizedBox(height: 10),
            const Text("Error !",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7FFA88),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("Try Again",
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const  MainScreen()));
          } else if (state is AuthFailure) {
            showErrorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Background Image
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 150,
                child: Image.asset(
                  'assets/loging/Rectangle 47.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Skip Button
              Positioned(
                top: screenHeight * 0.05,
                right: 20,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        fontFamily: "Lufga",
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              // Bottom Login Form
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02),
                  decoration: const BoxDecoration(
                    color: Color(0xff0A0B0A),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        const SizedBox(height: 10),
                        const Text(
                          'Lorem ipsum dolor sit amet consectetur.\nDui tristique erat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Lufga",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Email Field
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white),
                          ),
                          child: TextField(
                            controller: emailController,
                            style: const TextStyle(
                              fontFamily: "Lufga",
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                fontFamily: "Lufga",
                                color: Colors.white54,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password Field
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white),
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            style: const TextStyle(
                              fontFamily: "Lufga",
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                fontFamily: "Lufga",
                                color: Colors.white54,
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Continue Button or Loading
                        state is AuthLoading
                            ? const SizedBox(height: 50)
                            : Constbutton(
                                onTap: () {
                                  context.read<AuthBloc>().add(LoginRequested(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                      ));
                                },
                                text: 'Continue'),

                        const SizedBox(height: 10),
                        const Text(
                          'Or Connect with',
                          style: TextStyle(
                            fontFamily: "Lufga",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSocialIcon('assets/loging/Google.png'),
                            _buildSocialIcon('assets/loging/apple.png'),
                            _buildSocialIcon('assets/loging/twitter.png'),
                            _buildSocialIcon('assets/loging/meta.png'),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                         RegisterScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontFamily: "Lufga",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                                     onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                       const ForgetPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "forgot password?",
                                style: TextStyle(
                                  fontFamily: "Lufga",
                                  fontSize: 12,
                                  color: Color(0xff7FFA88),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              // Center loading on entire screen
              if (state is AuthLoading)
                Positioned.fill(
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      const Center(child: CustomLoadingIndicator()),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSocialIcon(String iconPath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
