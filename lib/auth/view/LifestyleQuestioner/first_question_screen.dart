import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/head_nav.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/next_button.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/question_selcted_box.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/specify_supplement_screnn.dart';
import 'package:my_app/main.dart';

class FirstQuestionScreen extends StatefulWidget {
  const FirstQuestionScreen({super.key});

  @override
  State<FirstQuestionScreen> createState() => _FirstQuestionScreenState();
}

class _FirstQuestionScreenState extends State<FirstQuestionScreen> {
  int selectedIndex = 0;
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
                      text: 'Nutrition',
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    FittedBox(
                      child: Text(
                        "Are you taking any\n supplements?",
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
                      height: 20,
                    ),
                    FittedBox(
                      child: Text(
                        "Start your fitness journey with our \napp's guidance and support.",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    QuestionSelctedBox(
                      text: 'Yes',
                      status: selectedIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    QuestionSelctedBox(
                      text: 'No',
                      status: selectedIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    Spacer(),
                    NextButton(onTap: (){
                      Get.to(SpecifySupplementScrenn());
                    },),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
