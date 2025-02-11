import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: const Color(0xff010A04),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, // 4% of screen width
              vertical: screenHeight * 0.02, // 2% of screen height
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Text(
                      "MY QR",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lufga",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.15), // 15% of screen height
                SizedBox(
                  height: screenWidth * 0.6, // 60% of screen width
                  width: screenWidth * 0.6,
                  child: Image.asset(
                    "assets/icons/qrcode.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                const Text(
                  "Lorem ipsum dolor sit amet consectetur.\nInteger ut quis cras",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Lufga",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                Container(
                  width: screenWidth * 0.6, // 60% of screen width
                  height: screenHeight * 0.05, // 5% of screen height
                  decoration: BoxDecoration(
                    color: const Color(0xff7FFA88),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Scan QR",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

