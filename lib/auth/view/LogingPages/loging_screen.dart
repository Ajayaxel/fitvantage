import 'package:flutter/material.dart';
import 'package:my_app/auth/view/LogingPages/OTPVerificationScreen.dart';

import 'package:my_app/constsatnce/const_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
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
          Positioned(
            top: screenHeight * 0.05,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // Add your action here
              },
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
                    'Login',
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
                  // Mobile Number Input
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          '+91',
                          style: TextStyle(
                            fontFamily: "Lufga",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              fontFamily: "Lufga",
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your mobile number',
                              hintStyle: TextStyle(
                                fontFamily: "Lufga",
                                color: Colors.white54,
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Continue Button
                   Constbutton(onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Otpverificationscreen()),
                    );
                   }, text: 'Continue',),

                  const SizedBox(height: 20),
                  // Or Connect With
                  const Text(
                    'Or Connect with',
                    style: TextStyle(
                      fontFamily: "Lufga",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Social Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialIcon(
                          'assets/loging/Google.png'), // Replace with your icon paths
                      _buildSocialIcon('assets/loging/apple.png'),
                      _buildSocialIcon('assets/loging/twitter.png'),
                      _buildSocialIcon('assets/loging/meta.png'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Footer Text
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur. Dui tristique erat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lufga",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



Widget _buildSocialIcon(String iconPath) {
  return Container(
    height: 50,
    width: 50,
    decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Center(
      child: Image.asset(
        iconPath,
        height: 24,
        width: 24,
      ),
    ),
  );
}
