// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_app/auth/view/Loging/loging_screen.dart';
// import 'package:my_app/auth/view/Loging/sign_screen.dart';
// import 'package:my_app/onbord/onbordcontent_model.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Onboard extends StatefulWidget {
//   const Onboard({super.key});

//   @override
//   State<Onboard> createState() => _OnboardState();
// }

// class _OnboardState extends State<Onboard> {
//   int currentIndex = 0;
//   late PageController _controller;

//   @override
//   void initState() {
//     _controller = PageController(initialPage: 0);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(color: Colors.red),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: PageView.builder(
//             controller: _controller,
//             itemCount: content.length,
//             onPageChanged: (int index) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//             itemBuilder: (_, i) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 30,),
//                   Center(

//                     child: Text(
//                       "Start your \nFitness Journey ",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.manrope(
//                           fontSize: 33, fontWeight: FontWeight.w800),
//                     ),
//                   ),
//                   const SizedBox(height: 22,),
//                   Text("Start your fitness journey\nwith our app's guidance and support.", textAlign: TextAlign.center,
//                       style: GoogleFonts.manrope(
//                           fontSize: 16, fontWeight: FontWeight.w500),)
//                 ],
//               );
//             }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/onbord/onbordcontent_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  String buttontext = "Skip";
  String buttonNext = "Next";

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Positioned(
            top: -5,
            right: -5,
            left: -5,
            bottom: -10,
            child: Image.asset(
              "assets/Onbording/Aurora background.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 119,
            left: 0,
            right: 0,
            top: 0,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                if (index == 2) {
                  buttontext = "";
                  buttonNext = "";
                } else {
                  buttontext = "Skip";
                  buttonNext = "Next";
                }
                setState(() {});
              },
              children: [
                OnbordContent(),
                OnbordContent(),
                OnbordContent(
                  showGetStarted: true,
                )
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                // alignment: Alignment(0, 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(2);
                      },
                      child: Text(
                        buttontext,
                        style: GoogleFonts.leagueSpartan(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff171917)),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          // radius: 5,
                          activeDotColor: Color(0xff6CCE73),
                          dotColor: Color(0xff6CCE73)),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.animateToPage(
                            (pageController.page ?? 0).toInt() + 1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.decelerate);
                      },
                      child: Text(
                        buttonNext,
                        style: GoogleFonts.leagueSpartan(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff171917)),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
