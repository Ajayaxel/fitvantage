


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/NetworkAuth/networkauth.dart';

class OnbordContent extends StatelessWidget {
  final bool showGetStarted;
  const OnbordContent({
    super.key,  this.showGetStarted=false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      
       
        children: [
          FittedBox(
            child: Text(
              "Start your \n Fitness Journey ",
              maxLines: 2,
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.montserrat(fontSize: 33, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: FittedBox(
              child: Text(
                "Start your fitness journey with our\n app's guidance and support.",
                 textAlign: TextAlign.center,
                 maxLines: 2,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 52,),
          Visibility(
            visible: showGetStarted,
            replacement: const SizedBox(height: 56,),
            child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Networkauth()));
            },
            child: Container(
              height: 56,
            
              padding: const EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black),
              child: Center(
                  child: Text(
                "Get Started",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              )),
            ),
                      ),
          )
        ],
      ),
    );
  }
}


