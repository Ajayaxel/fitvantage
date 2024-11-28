import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/home/view/bootmNav/transformconst/pages/Bottmshet/bottm_sheet.dart';
import 'package:my_app/home/view/lifestyleScorescreens/habit_screen.dart';
import 'package:my_app/videocall/videocall.dart';

class TransformScreen extends StatelessWidget {
  const TransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 18),
            child: Row(
              children: [
                Text(
                  "Weight Loss",
                  style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HabitScreen()),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/loging/ecg_heart_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg",
                    color: Colors.white,
                    height: 25,
                    width: 25,
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  child: const Icon(Icons.contact_emergency_outlined, color: Colors.white),
                ),
                const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  VideocallScreen()),
                    );
                },
                child: const Icon(Icons.video_call, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Your action",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateTile('10', 'SUN'),
                _buildDateTile('11', 'MON', isSelected: true),
                _buildDateTile('12', 'TUE'),
                _buildDateTile('13', 'TODAY'),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white70)
            ),
            padding: const EdgeInsets.all(16),
            // ignore: prefer_const_constructors
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Center(
                  child: Text(
                    'BUILD YOUR "FIT PLATE"',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'I will balance my breakfast and lunch\n\n'
                    'with cult plate ratio of 25 : 25 : 50 of Carbs : Protein : Fibre\n\n'
                    'and go with NO CARB dinner',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Color(0xff7FFA88)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red, size: 40),
                onPressed: () {
                  // Handle close
                },
              ),
              IconButton(
                icon: const Icon(Icons.check, color: Colors.green, size: 40),
                onPressed: () {
                  // Handle confirm
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          const MealPlanScreen(), // Call your MealPlanScreen as a widget
        ],
      );
    
  }

  Widget _buildDateTile(String day, String label, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.teal : Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.teal : Colors.white,
          ),
        ),
      ],
    );
  }
}

