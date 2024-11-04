
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/head_nav.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/next_button.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/question_selcted_box.dart';
import 'package:my_app/home/view/home_screen.dart';


import 'package:my_app/lifestylequestiner/controller/life_style_questionair_controller.dart';

class FirstQuestionScreen extends StatelessWidget {
  const FirstQuestionScreen({super.key});

  //int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Get.put(LifeStyleQuestionairController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<LifeStyleQuestionairController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return controller.lifeStyleQuestionairData.fold(() {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }, (either) {
          return either.fold((e) {
            return Center(
              child: Text(e.message),
            );
          }, (d) {
            if (controller.categoryIsEmpty()) {
              return Center(
                child: Text("No data"),
              );
            }
            final question =
                d.data[controller.categoryI].questions[controller.questionI];

            return Stack(
              children: [
                const BackgroundImage(),
                SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 24,right: 24,left: 24,bottom: 24),
                      child: Column(
                        children: [
                          HeadNavgtion(
                            text:
                                d.data[controller.categoryI].categoryName ?? '',
                          ),
                          Flexible(
                            child: const SizedBox(
                              height: 45,
                            ),
                          ),
                          Text(
                            question.questionName ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 30),
                          ),
                          Flexible(
                            child: const SizedBox(
                              height: 20,
                            ),
                          ),
                          Text(
                            question.questionDescription ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                           // overflow: TextOverflow.clip,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Flexible(
                            child: const SizedBox(
                              height: 50,
                            ),
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return QuestionSelctedBox(
                                    onTap: () {
                                      controller.selectOption(index);
                                    },
                                    text: question.options[index].optionName ??
                                        "",
                                    status: controller.selectedOptionindex ==
                                        index);
                              },
                              separatorBuilder: (cont, index) => Flexible(
                                child: Flexible(
                                  child: SizedBox(
                                        height: 10,
                                      ),
                                ),
                              ),
                              itemCount: question.options.length),
                           Spacer(flex: 6,),
                          NextButton(
                            onTap: () {
                              log('IS last question ${controller.isLastQuestion()}');
                              if (controller.isLastQuestion()) {
                                Get.offAll( HomeScreen());
                              } else {
                                controller.showNextQuestion();
                              }
                            },
                          ),
                        ],
                      )),
                ),
              ],
            );
          });
        });
      }),
    );
  }
}


