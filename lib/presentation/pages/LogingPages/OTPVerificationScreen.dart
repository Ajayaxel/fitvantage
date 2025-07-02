import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/presentation/pages/ProfileBuilding/profile_building_screnn.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class Otpverificationscreen extends StatelessWidget {
  const Otpverificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 120,
            child: Image.asset(
              'assets/loging/Rectangle 47 (1).png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          //  Skip Button
          Positioned(
            top: screenHeight * 0.05,
            right: 16,
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
          Positioned(
            top: screenHeight * 0.05,
            left: 16,
            child: GestureDetector(
              onTap: () {
                // Add your action here
              },
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
     
          // Bottom Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 327,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontFamily: "Lufga",
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Enter OTP sent to +91 85******77',
                    style: TextStyle(
                        fontFamily: "Lufga",
                        color: Colors.white,
                        fontSize: 14.0),
                  ),
                  const SizedBox(height: 24),
                  // OTP Input fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 50,
                       // height: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: const TextStyle(
                              color: Color(0xffD9D9D9), fontSize: 20.0),
                          decoration: InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 30.0),
                  Constbutton(onTap: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreenbuilding()),
                    );
                  }, text: 'Continue',),
                  const SizedBox(height: 16.0),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        
                        // Add resend OTP functionality here
                      },
                      child: const Text(
                        'Resend OTP',
                        style: TextStyle(
                            fontFamily: "Lufga",
                            color: Colors.white,
                            fontSize: 14.0),
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
