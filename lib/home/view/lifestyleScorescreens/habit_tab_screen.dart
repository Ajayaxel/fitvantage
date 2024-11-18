import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitsTab extends StatelessWidget {
  const HabitsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/loging/6385d0ff975de43baebcb910_magic-wand@2x.svg',
                    height: screenHeight * 0.12, // Responsive height
                  ),
                  const Divider(
                    indent: 100,
                    endIndent: 100,
                    thickness: 2.5,
                    color: Colors.white,
                  ),
                  SizedBox(height: screenHeight * 0.05), // Responsive spacing
                  Text(
                    'Pro Tip:',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: screenWidth * 0.045, // Responsive font size
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "You can move a habit from 'Can be improved' to 'On Track' by being more consistent with your actions.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: const HabitCategory(
              title: "Can Be Improved",
              consistencyLabel: "Consistency < 50%",
              color: Colors.red,
              habits: [
                HabitItem(
                  title: "Workout Regularly",
                  actions: [
                    HabitAction(
                      action: "I will do 30 mins Home WOD",
                      progress: "0/24 TIMES",
                    ),
                    HabitAction(
                      action: "I will do HIIT on Cult Live",
                      progress: "0/11 TIMES",
                    ),
                  ],
                ),
                HabitItem(
                  title: "Walk Daily",
                  actions: [
                    HabitAction(
                      action: "Walk in the evening",
                      progress: "0/7 TIMES",
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(endIndent: 15, indent: 15),
         

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: const HabitCategory(
              title: "",
              consistencyLabel: "",
              color: Colors.red,
              habits: [
                HabitItem(
                  title: "Stay Hydrated",
                  actions: [
                    HabitAction(
                      action: "I will do",
                      progress: "1 Action",
                    ),
                  
                  ],
                ),
                HabitItem(
                  title: "Walk Daily",
                  actions: [
                    HabitAction(
                      action: "Walk in the evening",
                      progress: "0/7 TIMES",
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Repeat other HabitCategory as in your original code
          SizedBox(height: screenHeight * 0.03),
          Container(
            height: screenHeight * 0.28, // Responsive height
            color: Colors.white12,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(screenWidth * 0.06), // Responsive padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(
                        width: screenWidth * 0.7,
                        child: const Text(
                          "Lorem ipsum is a dummy or placeholder\ntext commonly used in graphic design,\npublishing, and web development to\nfill empty spaces.",
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                TwoButtonRow(),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Assume TwoButtonRow and HabitCategory are defined here

//BUTTON

class TwoButtonRow extends StatelessWidget {
  const TwoButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = (screenWidth - 40) / 2 -
        5; // Adjusting width based on screen size with padding

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Chat button with red text and white background
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button background color
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'CHAT',
                style: TextStyle(
                  color: Colors.red, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Schedule Call button with transparent background and white text
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0.4,

                backgroundColor: Colors.white30, // Button background color
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                      color: Colors.white), // Border to indicate button
                ),
              ),
              child: const Text(
                'SCHEDULE CALL',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//habit card category

class HabitCategory extends StatelessWidget {
  final String title;
  final String consistencyLabel;
  final Color color;
  final List<HabitItem> habits;

  const HabitCategory({super.key, 
    required this.title,
    required this.consistencyLabel,
    required this.color,
    required this.habits,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              consistencyLabel,
              style: GoogleFonts.manrope(
                color: color,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...habits,
      ],
    );
  }
}

class HabitItem extends StatelessWidget {
  final String title;
  final List<HabitAction> actions;

  const HabitItem({super.key, 
    required this.title,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.sentiment_dissatisfied,
                  color: Colors.orangeAccent),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...List.generate(actions.length, (index) {
            final isLast = index == actions.length + 3;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 16),
                Column(
                  children: [
                    if (!isLast)
                      Container(
                        width: 2,
                        height: 30,
                        color: Colors.white38, // Adjusted color
                      ),
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(child: actions[index]),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class HabitAction extends StatelessWidget {
  final String action;
  final String progress;

  const HabitAction({
    super.key,
    required this.action,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            progress,
            style: GoogleFonts.manrope(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          Expanded(
            child: Text(
              action,
              style: GoogleFonts.manrope(
                color: Colors.white54,
                fontSize: 12,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
        ],
      ),
    );
  }
}
