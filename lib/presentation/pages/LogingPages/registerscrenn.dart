import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/auth/auth_bloc.dart';
import 'package:my_app/blocs/auth/auth_event.dart';
import 'package:my_app/blocs/auth/auth_state.dart';
import 'package:my_app/presentation/pages/LogingPages/loging_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';
import 'package:my_app/presentation/widgets/loding_indiactor.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

    void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF121212),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, color: Colors.redAccent, size: 50),
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
                backgroundColor: Colors.greenAccent,
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => LoginScreen()));
          } else if (state is AuthFailure) {
           showErrorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Back Button

              // Background Image
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 150,
                child: Image.asset(
                  'assets/loging/Rectangle 47.png', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),

              // Skip Button

              // Bottom Container
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Login Text
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: "Lufga",
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Subtitle
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
                      // Name TextField
                      buildInputField("name", nameController),
                      const SizedBox(height: 20),
                      // Email TextField
                      buildInputField("email", emailController,
                          inputType: TextInputType.emailAddress),
                      const SizedBox(height: 20),
                      // phone TextField
                      buildInputField("phone number", phoneController,
                          inputType: TextInputType.phone),
                      const SizedBox(height: 20),
                      // password TextField
                      buildInputField("password", passwordController,
                          inputType: TextInputType.visiblePassword),
                      const SizedBox(height: 20),
                      // confirm password TextField
                      buildInputField("confirm password", confirmPasswordController,
                          inputType: TextInputType.visiblePassword),
                      const SizedBox(height: 20),
                      // Email TextFiel
                      const SizedBox(height: 20),
                      state is AuthLoading
                          ? const SizedBox(height: 50)
                          : Constbutton(
                              onTap: () {
                                context.read<AuthBloc>().add(RegisterRequested(
                                      nameController.text,
                                      emailController.text,
                                      phoneController.text,
                                      passwordController.text,
                                      confirmPasswordController.text,
                                    ));
                              },
                              text: 'Continue'),

                      const SizedBox(height: 20),
                      // Or Connect With

                      const SizedBox(height: 20),
                      // Footer Text
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Already have an account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Lufga",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
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
}

 Widget buildInputField(String hint, TextEditingController controller,
      {TextInputType inputType = TextInputType.name}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontFamily: "Lufga",
          fontSize: 16,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: "Lufga",
            color: Colors.white54,
          ),
        ),
        keyboardType: inputType,
      ),
    );
  }

