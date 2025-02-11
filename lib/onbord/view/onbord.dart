import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/auth/view/LogingPages/loging_screen.dart';
import 'package:my_app/constsatnce/const_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Automatically slide to the next page every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for Background Images
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 220,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Image.asset(
                  "assets/Onbordingnew/1st.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/Onbordingnew/2nd.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/Onbordingnew/3rd.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/Onbordingnew/4th.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          // Content Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20.0),
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
                  const Text(
                    'Welcome to Fitvantage',
                    style: TextStyle(
                      fontFamily: "Lufga",
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Unleash Your Inner Beast!',
                    style: TextStyle(
                      fontFamily: "Lufga",
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur. Dui tristique erat',
                    style: TextStyle(
                      fontFamily: "Lufga",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 36, // Indicator width
                        height: 4,
                        decoration: BoxDecoration(
                          color: index <= _currentPage
                              ? const Color(0xff7FFA88) // Green for completed
                              : const Color(0xffD9D9D9), // White for pending
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  // Continue Button
                  Constbutton(onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  }, text: 'Continue',),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
