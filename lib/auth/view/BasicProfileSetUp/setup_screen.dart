// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_app/auth/view/BasicProfileSetUp/age_setup_screen.dart';
// import 'package:my_app/auth/view/BasicProfileSetUp/gender_screen.dart';
// import 'package:my_app/auth/view/BasicProfileSetUp/height_setuo_screen.dart';
// import 'package:my_app/auth/view/BasicProfileSetUp/start_setup_screen.dart';
// import 'package:my_app/auth/view/BasicProfileSetUp/weight_setup_screen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class SetupScreen extends StatefulWidget {
//   const SetupScreen({super.key});

//   @override
//   State<SetupScreen> createState() => _SetupScreenState();
// }

// class _SetupScreenState extends State<SetupScreen> {
//   String buttontext = "Skip";

//   String buttonNext = "Next";

//   PageController pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             controller: pageController,
//             onPageChanged: (index) {
//               if (index == 9) {
//                 buttontext = "";
//                 buttonNext = "";
//               } else {
//                 buttontext = "Skip";
//                 buttonNext = "Next";
//               }
//               setState(() {});
//             },
//             children: [
             
//               GenderScreen(),
//               AgeSetupScreen(),
//               WeightSetupScreen(),
//               HeightSetuoScreen(),
//             ],
//           ),
//           // SizedBox(height: 177,),
//           // Positioned(
//           //   top: 732,
//           //   left: 16,
//           //   right: 16,
//           //   bottom: 58,
//           //   child: Container(
//           //       margin: EdgeInsets.only(left: 15, right: 15),
//           //       // alignment: Alignment(0, 0.9),
//           //       child: Row(
//           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //         children: [
//           //           Text(
//           //             buttontext,
//           //             style: GoogleFonts.leagueSpartan(
//           //                 fontSize: 18,
//           //                 fontWeight: FontWeight.w500,
//           //                 color: Color(0xff171917)),
//           //           ),
//           //           SmoothPageIndicator(
//           //             controller: pageController,
//           //             count: 9,
//           //             effect:ExpandingDotsEffect(
//           //                 dotWidth: 8,
//           //                 dotHeight: 8,
//           //                 // radius: 5,
//           //                 activeDotColor: Color(0xff6CCE73
//           //   ),
//           //                 dotColor: Color(0xff6CCE73)),
//           //           ),
//           //           GestureDetector(
//           //             onTap: () {
//           //               pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
//           //             },
//           //             child: Text(
//           //               buttonNext,
//           //               style: GoogleFonts.leagueSpartan(
//           //                   fontSize: 18,
//           //                   fontWeight: FontWeight.w500,
//           //                   color: Color(0xff171917
//           //   )),
//           //             ),
//           //           ),
//           //         ],
//           //       )),
//           // ),
//         ],
//       ),
//     );
//   }
// }
