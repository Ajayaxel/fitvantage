import 'package:flutter/material.dart';

import 'package:my_app/myworkoutplans/view/Datepages/firstpageview_sceen.dart';
import 'package:my_app/myworkoutplans/view/Datepages/second.dart';
import 'package:my_app/myworkoutplans/view/Datepages/workoutlist.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _OnboardState();
}

class _OnboardState extends State<MainContent> {
  // String buttontext = "Skip";
  // String buttonNext = "Next";

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
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: PageView(
              controller: pageController,
              // onPageChanged: (index) {
              //   if (index == 2) {
              //     buttontext = "";
              //     buttonNext = "";
              //   } else {
              //     buttontext = "Skip";
              //     buttonNext = "Next";
              //   }
              //   setState(() {});
              // },
              children: [Workoutlist(), TimerScrren(),Second()],
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
                    // SmoothPageIndicator(
                    //   controller: pageController,
                    //   count: 3,
                    //   effect: ExpandingDotsEffect(
                    //       dotWidth: 8,
                    //       dotHeight: 8,
                    //       // radius: 5,
                    //       activeDotColor: Color(0xff6CCE73),
                    //       dotColor: Color(0xff6CCE73)),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     pageController.animateToPage(
                    //         (pageController.page ?? 0).toInt() + 1,
                    //         duration: Duration(milliseconds: 200),
                    //         curve: Curves.decelerate);
                    //   },
                    //   child: Text(
                    //     buttonNext,
                    //     style: GoogleFonts.leagueSpartan(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w500,
                    //         color: Color(0xff171917)),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
