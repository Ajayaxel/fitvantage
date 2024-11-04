// import 'package:flutter/material.dart';
// import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';

// class LifeStyleScrren extends StatefulWidget {
//   const LifeStyleScrren({super.key});

//   @override
//   State<LifeStyleScrren> createState() => _LifeStyleScrrenState();
// }

// class _LifeStyleScrrenState extends State<LifeStyleScrren> {
//   double _sliderValue = 1; // Slider value ranging from 1 to 3.

//   // Step options based on slider position.
//   final List<String> stepRanges = [
//     "Less than 5,000 steps daily (~30 min)",
//     "5,000-7,500 steps daily (~60 min)",
//     "More than 7,500 steps daily (~90 min)"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Get the screen width and height for responsive UI.
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           BackgroundImage(),
//           // Main content.
//           SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth * 0.05,
//                   vertical: screenHeight * 0.05),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Movement icon.
//                   Icon(Icons.sports_gymnastics_sharp,
//                       color: Colors.white, size: screenWidth * 0.15),
//                   SizedBox(height: screenHeight * 0.03),
//                   Text(
//                     "MOVEMENT",
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: screenWidth * 0.05,
//                       letterSpacing: 1.5,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.01),
//                   // Descriptive text.
//                   Text(
//                     "I walk regularly",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: screenWidth * 0.06,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: screenHeight * 0.2),
//                   // Slider and its label.
//                   Text(
//                     stepRanges[_sliderValue.toInt() - 1],
//                     style: TextStyle(
//                         color: Colors.white70, fontSize: screenWidth * 0.045),
//                     textAlign: TextAlign.center,
//                   ),
//                   Slider(
//                     value: _sliderValue,
//                     min: 1,
//                     max: 3,
//                     divisions: 2,
//                     activeColor: Colors.yellow,
//                     inactiveColor: Colors.white24,
//                     onChanged: (value) {
//                       setState(() {
//                         _sliderValue = value;
//                       });
//                     },
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   Spacer(),
//                   // "Next" button.
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:  Color.fromARGB(31, 234, 228, 228),
//                       minimumSize: Size(double.infinity, screenHeight * 0.07),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       // Handle "Next" action.
//                       print(
//                           "Selected steps: ${stepRanges[_sliderValue.toInt() - 1]}");
//                     },
//                     child: Text(
//                       'NEXT',
//                       style: TextStyle(
//                         fontSize: screenWidth * 0.045,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xffffffff)
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Close button at the top right.
//           Positioned(
//             top: screenHeight * 0.03,
//             right: screenWidth * 0.03,
//             child: IconButton(
//               icon: Icon(Icons.close, color: Colors.white),
//               onPressed: () {
//                 // Handle the close action.
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//this currnt code
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_app/auth/view/Home/home.dart';
// import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
// import 'package:my_app/auth/view/LifestyleQuestioner/Constants/next_button.dart';
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
//     // Get the screen width and height for responsive UI.
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
//               return Center(
//                 child: Text("No data"),
//               );
//             }
//             final question =
//                 d.data[controller.categoryI].questions[controller.questionI];

//             return Stack(
//               children: [
//                 BackgroundImage(),
//                 // Main content.
//                 SafeArea(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: screenWidth * 0.05,
//                         vertical: screenHeight * 0.05),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Movement icon.
//                         Icon(Icons.sports_gymnastics_sharp,
//                             color: Colors.white.withOpacity(0.7), size: screenWidth * 0.15),
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
//                         // Descriptive text.
//                         Text(
//                           question.questionName ?? "",
//                           style: GoogleFonts.manrope(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.06,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),

//                         //QUESTION DESCRTION
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
//                         SizedBox(height: screenHeight * 0.2),

//                         Text(
//                           question.options[_sliderValue.toInt() - 1]
//                                   .optionName ??
//                               "",
//                           style: GoogleFonts.manrope(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w200),
//                         ),
//                         Slider(
//                           value: _sliderValue,
//                           min: 1,
//                           max: question.options.length.toDouble(),
//                           divisions: question.options.length.toInt() - 1,

//                           activeColor: Color(0xff7FFA88),
//                           inactiveColor: Colors.white30,

//                           thumbColor: Colors.white,
//                           onChanged: (value) {
//                             setState(() {
//                               _sliderValue = value;
//                             });
//                           },
//                         ),
//                         SizedBox(height: screenHeight * 0.05),
//                         Spacer(),

//                         NextButton(
//                           onTap: () {
//                             log('IS last question ${controller.isLastQuestion()}');
//                             if (controller.isLastQuestion()) {
//                               Get.offAll(const HomeScreen());
//                             } else {
//                               controller.showNextQuestion();
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Close button at the top right.
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

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';

import 'package:my_app/home/view/home_screen.dart';

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
              return Center(
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
                BackgroundImage(),
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
                        // Text(
                        //   question.options[_sliderValue.toInt() - 1]
                        //           .optionName ??
                        //       "",
                        //   style: GoogleFonts.manrope(
                        //       fontSize: 18,
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.w200),
                        // ),
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

                        // Slider(
                        //   value: _sliderValue,
                        //   min: 1,
                        //   max: question.options.length.toDouble(),
                        //   divisions: question.options.length.toInt() - 1,
                        //   activeColor: Color(0xff7FFA88),
                        //   inactiveColor: Colors.white30,
                        //   thumbColor: Colors.white,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       _sliderValue = value;
                        //     });
                        //   },
                        // ),
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
                        Spacer(),
                        // Row for Previous and Next buttons.
                        Padding(
                          padding: EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Previous button
                              if (!controller.isFirstQuestion())
                                Container(
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
                                    child: Text(
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
                                    Get.offAll( HomeScreen());
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
                    icon: Icon(Icons.close, color: Colors.white),
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
