import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Constbutton extends StatelessWidget {
  final VoidCallback onTap;
  String text = ''; // Define a callback for the tap action

   Constbutton({
    super.key,
    required this.onTap,
    required this.text, // Make onTap required
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48, // Set the height
      width: double.infinity, // Set the width
      child: ElevatedButton(
        onPressed: onTap, // Use the passed onTap function
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff7FFA88),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: "Lufga",
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
