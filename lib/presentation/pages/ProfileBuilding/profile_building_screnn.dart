import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/LogingPages/loging_screen.dart';
import 'package:my_app/presentation/pages/ProfileBuilding/gender_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenbuilding extends StatefulWidget {
  const ProfileScreenbuilding({super.key});

  @override
  State<ProfileScreenbuilding> createState() => _ProfileScreenbuildingState();
}

class _ProfileScreenbuildingState extends State<ProfileScreenbuilding> {
    String userName = '';
      @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? '';
    });
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff0A0B0A),
      resizeToAvoidBottomInset: true, // Allow resizing when keyboard appears
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: screenHeight * 0.08),
                          const Text(
                            'Fill out the profile',
                            style: TextStyle(
                              fontFamily: 'Lufga',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.07),
                          CircleAvatar(
                            radius: screenWidth * 0.13,
                            backgroundImage: const AssetImage(
                              'assets/loging/Rectangle 28.png',
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(userName, style: const TextStyle(color: Colors.white ,fontSize: 24)),
                          SizedBox(height: screenHeight * 0.08),
                          CustomTextField(
                            hintText: 'Name',
                            width: screenWidth * 0.9,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          CustomTextField(
                            hintText: 'Date Of Birth',
                            width: screenWidth * 0.9,
                          ),
                          SizedBox(height: screenHeight * 0.04),
                        ],
                      ),
                    ),
                  ),
                  // Bottom Buttons Aligned Properly
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.03,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Constbutton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const IdentifyGenderScreen(),
                                ),
                              );
                            },
                            text: 'Continue',
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const IdentifyGenderScreen()),
                              );
                              // Skip action
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontFamily: 'Lufga',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double width;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48, // Fixed height
      width: width, // Dynamic width based on screen size
      child: TextField(
        style: const TextStyle(color: Colors.white, fontFamily: 'Lufga'),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.white54, fontFamily: 'Lufga'),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
