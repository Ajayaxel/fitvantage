// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/home/view/profilepages/profile_screen.dart';

class ProfileConainerHome extends StatelessWidget {
  const ProfileConainerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.9)),
          gradient: const LinearGradient(
            colors: [
              Colors.teal,
              Colors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 15),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(2), // White border width

                  decoration: BoxDecoration(
                    color: Colors.white, // Border color
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3096/3096983.png'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ONLY FOR YOU",
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none, // Removes underline
                    ),
                  ),
                  Text(
                    "Guarnteed best price enabled",
                    style: GoogleFonts.manrope(
                      color: Colors.greenAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none, // Removes underline
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "CLAIM",
                style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.none, // Removes underline
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
