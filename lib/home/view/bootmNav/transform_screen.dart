import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/home/view/lifestyleScorescreens/habit_screen.dart';

class TransformScreen extends StatelessWidget {
  const TransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                // SVG asset for the heart icon
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HabitScreen()),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/loging/ecg_heart_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg",
                    color: Colors.black,
                    height: 25,
                    width: 25,
                  ),
                ),
                const SizedBox(width: 15),

                // "Contact Emergency" icon with GestureDetector for navigation
                GestureDetector(
                  child: const Icon(Icons.contact_emergency_outlined),
                ),
                const SizedBox(width: 15),

                // Chat icon
                const Icon(Icons.chat),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Your action",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateTile('10', 'SUN'),
                _buildDateTile('11', 'MON', isSelected: true), // Selected date
                _buildDateTile('12', 'TUE'),
                _buildDateTile('13', 'TODAY'),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.close, color: Colors.red, size: 40),
                onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransformScreen()),
              );
                  // handle close
                },
              ),
              IconButton(
                icon: Icon(Icons.check, color: Colors.green, size: 40),
                onPressed: () {
                  // handle confirm
                },
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
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



