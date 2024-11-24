import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/lifestylequestiner/view/life_style_scrren.dart';

class LifestyleScoreTab extends StatelessWidget {
  const LifestyleScoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appBarHeight = AppBar().preferredSize.height;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your lifestyle score is ',
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                Text(
                  '56',
                  style: GoogleFonts.manrope(
                    color: Colors.yellow,
                    fontWeight: FontWeight.w900,
                    fontSize: screenWidth * 0.08,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              height: screenHeight * 0.35,
              width: screenWidth * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildScoreSection(
                      '81', 'Awesome', Colors.yellow, screenWidth),
                  _buildScoreSection(
                      '61', 'Doing Well', Colors.white, screenWidth),
                  _buildScoreSection(
                      '41', 'On Track', Colors.white, screenWidth),
                  _buildScoreSection(
                      '0', 'Off Track', Colors.grey, screenWidth),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            const Text(
              "Your current lifestyle may be working well in\nsome areas, but you're probably struggling in\nothers.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildProgressCircle(
                    'MOVEMENT', 0.6, Colors.yellow, screenWidth),
                _buildProgressCircle(
                    'NUTRITION', 0.52, Colors.yellow, screenWidth),
                _buildProgressCircle('STRESS', 0.6, Colors.yellow, screenWidth),
                _buildProgressCircle('SLEEP', 0.6, Colors.yellow, screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              height: screenHeight - appBarHeight - (screenHeight * 0.24),
              child: PageView(
                children: [
                  _buildSwipeableContent(
                      'MOVEMENT', 0.6, Colors.yellow, screenWidth),
                  _buildSwipeableContent(
                      'NUTRITION', 0.52, Colors.yellow, screenWidth),
                  _buildSwipeableContent(
                      'STRESS', 0.6, Colors.yellow, screenWidth),
                  _buildSwipeableContent(
                      'SLEEP', 0.6, Colors.yellow, screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreSection(
      String score, String label, Color color, double screenWidth) {
    return Column(
      children: [
        Text(
          score,
          style: GoogleFonts.manrope(
            color: color,
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style:
              GoogleFonts.manrope(color: color, fontSize: screenWidth * 0.03),
        ),
      ],
    );
  }

  Widget _buildProgressCircle(
      String label, double progress, Color color, double screenWidth) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: screenWidth * 0.12,
              width: screenWidth * 0.12,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: screenWidth * 0.02,
                backgroundColor: Colors.grey,
                color: color,
              ),
            ),
            Text(
              (progress * 100).toInt().toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ],
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          label,
          style: GoogleFonts.manrope(
              color: Colors.white, fontSize: screenWidth * 0.03),
        ),
      ],
    );
  }

  Widget _buildSwipeableContent(
      String label, double progress, Color color, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Details for $label',
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: screenWidth * 0.05,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Row(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.08,
                backgroundColor: Colors.white,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnl88kLPQxDseAl9-p9IyBB5jtyHK0gq7L-Q&s",
                  fit: BoxFit.cover,
                  height: screenWidth * 0.1,
                  width: screenWidth * 0.1,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              const Text(
                "A quick chat with your Habit Coach can\nhelp you get aligned with your goals.",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.04),
          for (int i = 0; i < 6; i++)
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Dottext(text: 'Meditate Regularly'),
            ),
          // const Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(() => const LifeStyleScrren());
            },
            child: Container(
              // height: screenWidth * 0.13,
              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "REASSESS $label SCORE",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.redAccent,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

//dot text//

class Dottext extends StatelessWidget {
  final String text;

  const Dottext({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize =
        screenWidth * 0.035; // Adjust font size based on screen width
    double spacing = screenWidth * 0.05; // Adjust spacing

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 253, 228, 3),
          radius: screenWidth * 0.025, // Responsive circle radius
        ),
        SizedBox(width: spacing),
        Flexible(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
      ],
    );
  }
}
