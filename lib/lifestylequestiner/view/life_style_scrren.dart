
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';

import 'package:my_app/home/view/lifestyleScorescreens/nutrition_score_screen.dart';

import 'package:my_app/lifestylequestiner/controller/life_style_questionair_controller.dart';

class LifeStyleScrren extends StatefulWidget {
  const LifeStyleScrren({super.key});

  @override
  State<LifeStyleScrren> createState() => _LifeStyleScrrenState();
}

class _LifeStyleScrrenState extends State<LifeStyleScrren> {
  double _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              return const Center(
                child: Text("No data"),
              );
            }
            final question =
                d.data[controller.categoryI].questions[controller.questionI];
                // Ensure the slider value is within the range of options.
            _sliderValue =
                _sliderValue.clamp(1, question.options.length.toDouble());

            return Stack(
              children: [
                const BackgroundImage(),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sports_gymnastics_sharp,
                            color: Colors.white.withOpacity(0.7),
                            size: screenWidth * 0.15),
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          d.data[controller.categoryI].categoryName ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          question.questionName ?? "",
                          style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Center(
                          child: Text(
                            question.questionDescription ?? "",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                                color: Colors.white60,
                                fontSize: screenWidth * 0.03,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.2),
                         Text(
                          (_sliderValue.toInt() - 1 >= 0 &&
                                  _sliderValue.toInt() - 1 <
                                      question.options.length)
                              ? question.options[_sliderValue.toInt() - 1]
                                      .optionName ??
                                  ""
                              : "",
                          style: GoogleFonts.manrope(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w200),
                        ),

               
                                Slider(
                          value: _sliderValue,
                          min: 1,
                          max: question.options.length.toDouble(),
                          divisions: question.options.length > 1
                              ? question.options.length - 1
                              : 1,
                          activeColor: const Color(0xff7FFA88),
                          inactiveColor: Colors.white30,
                          thumbColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              _sliderValue = value.clamp(
                                  1, question.options.length.toDouble());
                            });
                          },
                        ),

                        SizedBox(height: screenHeight * 0.05),
                        const Spacer(),
                        // Row for Previous and Next buttons.
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Previous button
                              if (!controller.isFirstQuestion())
                                SizedBox(
                                  height: 53,
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (!controller.isFirstQuestion()) {
                                        controller.showPreviousQuestion();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      "Previous",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    ),
                                  ),
                                )
                              else
                                SizedBox(
                                    width: screenWidth *
                                        0.3), // Placeholder for alignment
                           
                              GestureDetector(
                                onTap: () {
                                  log('IS last question ${controller.isLastQuestion()}');
                                  if (controller.isLastQuestion()) {
                                    Get.offAll( const NutritionScoreScreen());
                                  } else {
                                    controller.showNextQuestion();
                                  }
                                },
                                child: Container(
                                  height: 56,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: const Color.fromARGB(
                                          31, 108, 105, 105)),
                                  child: Center(
                                      child: Text(
                                    "Next",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.03,
                  right: screenWidth * 0.03,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      // Handle the close action.
                    },
                  ),
                ),
              ],
            );
          });
        });
      }),
    );
  }
}

//chat gpt
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_app/auth/view/Home/home.dart';
// import 'package:my_app/lifestylequestiner/controller/life_style_questionair_controller.dart';

// class LifeStyleScrren extends StatefulWidget {
//   const LifeStyleScrren({super.key});

//   @override
//   State<LifeStyleScrren> createState() => _LifeStyleScrrenState();
// }

// class _LifeStyleScrrenState extends State<LifeStyleScrren> {
//   double _sliderValue = 1;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     Get.put(LifeStyleQuestionairController());

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: GetBuilder<LifeStyleQuestionairController>(builder: (controller) {
//         if (controller.isLoading) {
//           return const Center(
//             child: CircularProgressIndicator.adaptive(),
//           );
//         }
//         return controller.lifeStyleQuestionairData.fold(() {
//           return const Center(
//             child: CircularProgressIndicator.adaptive(),
//           );
//         }, (either) {
//           return either.fold((e) {
//             return Center(
//               child: Text(e.message),
//             );
//           }, (d) {
//             if (controller.categoryIsEmpty()) {
//               return const Center(
//                 child: Text("No data"),
//               );
//             }

//             final question =
//                 d.data[controller.categoryI].questions[controller.questionI];

//             // Ensure that options list is not empty before accessing it.
//             if (question.options.isEmpty) {
//               return const Center(
//                 child: Text("No options available"),
//               );
//             }

//             // Ensure the slider value is within the range of options.
//             _sliderValue =
//                 _sliderValue.clamp(1, question.options.length.toDouble());

//             return Stack(
//               children: [
//                 Image.asset(
//                   "assets/setup/background setup.png",
//                   fit: BoxFit.cover,
//                   height: double.infinity,
//                   width: double.infinity,
//                   scale: 1,
//                 ),
//                 SafeArea(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: screenWidth * 0.05,
//                         vertical: screenHeight * 0.05),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.sports_gymnastics_sharp,
//                             color: Colors.white.withOpacity(0.7),
//                             size: screenWidth * 0.15),
//                         SizedBox(height: screenHeight * 0.03),
//                         Text(
//                           d.data[controller.categoryI].categoryName ?? "",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: screenWidth * 0.05,
//                               letterSpacing: 1.5,
//                               fontWeight: FontWeight.w800),
//                         ),
//                         SizedBox(height: screenHeight * 0.01),
//                         Text(
//                           question.questionName ?? "",
//                           style: GoogleFonts.manrope(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.06,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         Center(
//                           child: Text(
//                             question.questionDescription ?? "",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.manrope(
//                                 color: Colors.white60,
//                                 fontSize: screenWidth * 0.03,
//                                 letterSpacing: 1.5,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.1),
//                         Text(
//                           (_sliderValue.toInt() - 1 >= 0 &&
//                                   _sliderValue.toInt() - 1 <
//                                       question.options.length)
//                               ? question.options[_sliderValue.toInt() - 1]
//                                       .optionName ??
//                                   ""
//                               : "",
//                           style: GoogleFonts.manrope(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w200),
//                         ),
//                         Slider(
//                           value: _sliderValue,
//                           min: 1,
//                           max: question.options.length.toDouble(),
//                           divisions: question.options.length > 1
//                               ? question.options.length - 1
//                               : 1,
//                           activeColor: const Color(0xff7FFA88),
//                           inactiveColor: Colors.white30,
//                           thumbColor: Colors.white,
//                           onChanged: (value) {
//                             setState(() {
//                               _sliderValue = value.clamp(
//                                   1, question.options.length.toDouble());
//                             });
//                           },
//                         ),
//                         SizedBox(height: screenHeight * 0.05),
//                         Spacer(),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 12, right: 12),
//                           child: Flexible(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 // Previous button
//                                 if (!controller.isFirstQuestion())
//                                   Container(
//                                     height: screenHeight * 0.06,
//                                     width: 150,
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         if (!controller.isFirstQuestion()) {
//                                           controller.showPreviousQuestion();
//                                         }
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(14)),
//                                         backgroundColor: Colors.white,
//                                       ),
//                                       child: const Text(
//                                         "Previous",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w900,
//                                             fontSize: 16),
//                                       ),
//                                     ),
//                                   )
//                                 else
//                                   SizedBox(
//                                       width: screenWidth *
//                                           0.3), // Placeholder for alignment
//                                 // Next button
//                                 GestureDetector(
//                                   onTap: () {
//                                     log('IS last question ${controller.isLastQuestion()}');
//                                     if (controller.isLastQuestion()) {
//                                       Get.offAll(const HomeScreen());
//                                     } else {
//                                       controller.showNextQuestion();
//                                     }
//                                   },
//                                   child: Flexible(
//                                     child: Container(
//                                       // height: 56,

//                                       width: 150,
//                                       height: screenHeight * 0.06,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(14),
//                                           color: const Color.fromARGB(
//                                               31, 108, 105, 105)),
//                                       child: Center(
//                                           child: Text(
//                                         "Next",
//                                         style: GoogleFonts.montserrat(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 16),
//                                       )),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: screenHeight * 0.03,
//                   right: screenWidth * 0.03,
//                   child: IconButton(
//                     icon: Icon(Icons.close, color: Colors.white),
//                     onPressed: () {
//                       // Handle the close action.
//                     },
//                   ),
//                 ),
//               ],
//             );
//           });
//         });
//       }),
//     );
//   }
// }
