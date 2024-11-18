import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Glasscontainer extends StatelessWidget {
  String title;
  String subtitle;
   Glasscontainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 150,
      width: 170,
      border: -1,
      radius: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20,bottom: 10),
            child: Text(
             title,
              textAlign: TextAlign.start,
              style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const Divider(
            indent: 8,
            endIndent: 8,
          
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10,right: 10,bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                const CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                    child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
