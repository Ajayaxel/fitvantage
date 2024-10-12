import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/Home/home.dart';

// ignore: must_be_immutable
class HeadNavgtion extends StatelessWidget {
   String text="";
   HeadNavgtion({
    
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 23,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15.4),
        ),
        GestureDetector(
          onTap: () {
            Get.to(HomeScreen());
          },
          child: Text(
            "Skip",
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.4),
          ),
        ),
      ],
    );
  }
}
