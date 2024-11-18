import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/home/view/Homepages/home_screen.dart';



import 'package:my_app/lifestylequestiner/controller/life_style_questionair_controller.dart';

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
        GetBuilder<LifeStyleQuestionairController>(
          builder: (controller) {
            return Visibility(
              // visible:controller.categoryI!=0&& controller.questionI!=0 ,
              
              child: GestureDetector(
                onTap: () {
                  controller.showPreviousQuestion();
                  
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 23,
                ),
              ),
            );
          }
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15.4),
        ),
        GestureDetector(
          onTap: () {
            Get.to(const HomeScreen());
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
