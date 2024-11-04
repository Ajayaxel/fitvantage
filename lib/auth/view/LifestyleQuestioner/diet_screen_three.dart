import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/cards.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/head_nav.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/next_button.dart';

class DietScreenThree extends StatelessWidget {
  const DietScreenThree({super.key});

  //int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackgroundImage(),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                HeadNavgtion(
                  text: 'Diet',
                ),
                const SizedBox(
                  height: 45,
                ),
                FittedBox(
                  child: Text(
                    "Do you have a specific\n diet preference?",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 69,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardS(
                      titil: 'Plant Based',
                      subtitile: 'Vegan', status: false,
                      // onTap: () {
                      //   setState(() {
                      //     selectedIndex=1;
                      //   });
                      // },
                    ),
                    CardS(
                      titil: 'Carbo Diet',
                      subtitile: 'Bread, etc',
                      status: false,
                      onTap: () {
                      
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardS(
                      titil: 'Specialized',
                      subtitile: 'Paleo, keto, etc',
                      status: false,
                      onTap: () {
                       
                      },
                    ),
                    CardS(
                      titil: 'Traditional',
                      subtitile: 'Fruit diet',
                      status:false,
                      onTap: () {
                        
                      },
                    ),
                  ],
                ),
                const Spacer(),
                NextButton(onTap: () {}),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
