import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_app/mainpages/view/at_home_screen.dart';
import 'package:my_app/mainpages/view/fitness_screen.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  _ToggleScreenState createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  bool isAtHomeSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrolling content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: isAtHomeSelected
                        ? const AtHomeScreen()
                        : const FitnessPage(),
                  ),
                ),
              ],
            ),
          ),
          // Fixed toggle buttons at the bottom with blur effect only on the button container
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 25),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.4), // Semi-transparent background
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ToggleButton(
                      label: 'At Home',
                      isSelected: isAtHomeSelected,
                      onPressed: () {
                        setState(() {
                          isAtHomeSelected = true;
                        });
                      },
                    ),
                    ToggleButton(
                      label: 'At Centre',
                      isSelected: !isAtHomeSelected,
                      onPressed: () {
                        setState(() {
                          isAtHomeSelected = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const ToggleButton(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 38, // Set height
        width: 174, // Set width
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xff7FFA88)
              : Colors.transparent, // Highlight color when selected
          borderRadius: BorderRadius.circular(30), // Rounded corners
          border: Border.all(
            color: isSelected
                ? const Color(0xff7FFA88)
                : Colors.transparent, // Border color when selected
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white, // Text color
              fontSize: 14,
              fontWeight: FontWeight.w400, // Text style
            ),
          ),
        ),
      ),
    );
  }
}
