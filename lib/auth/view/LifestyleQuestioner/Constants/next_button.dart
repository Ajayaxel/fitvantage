

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class NextButton extends StatelessWidget {
  final  onTap ;
   const NextButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 327,
        padding: const EdgeInsets.only(left: 24, right: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(31, 108, 105, 105)),
        child: Center(
            child: Text(
          "Next",
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16),
        )),
      ),
    );
  }
}
