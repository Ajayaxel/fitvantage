// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class SkeletonWithRealData extends StatefulWidget {
//   @override
//   _SkeletonWithRealDataState createState() => _SkeletonWithRealDataState();
// }

// class _SkeletonWithRealDataState extends State<SkeletonWithRealData> {
//   bool _isLoading = true; // Flag to toggle loading state
//   List<String> _data = [];

//   @override
//   void initState() {
//     super.initState();
//     // Simulate a delay for data loading
//     Future.delayed(Duration(seconds: 3), () {
//       setState(() {
//         _isLoading = false;
//         _data = List.generate(10, (index) => 'Item $index');
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Skeleton Loading Example'),
//         ),
//         body: _isLoading ? _buildSkeletonLoader() : _buildDataList(),
//       ),
//     );
//   }

//   Widget _buildSkeletonLoader() {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//           child: Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: 20,
//                         color: Colors.white,
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.6,
//                         height: 16,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildDataList() {
//     return ListView.builder(
//       itemCount: _data.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: Icon(Icons.check_circle, color: Colors.green),
//           title: Text(_data[index]),
//         );
//       },
//     );
//   }
// }


//  AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Container(
//             width: double.infinity, // Ensures full width
//             height: double.infinity, // Ensures full height
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 colors: [Colors.teal.withOpacity(0.9), Colors.black],
//                 center: _alignmentAnimation.value,
//                 radius: 0.9,
//                 focalRadius: 6,
//               ),
//             ),
//             child: SizedBox(
//               height: double.infinity, // Ensures `Column` uses full height
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const ProfileConainerHome(),
//                     const CarouleScreen(),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: screenWidth * 0.05,
//                         vertical: screenHeight * 0.02,
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconWithText(
//                             icon: Icons.scale,
//                             label: "weight\nloss",
//                           ),
//                           IconWithText(
//                             icon: Icons.fitness_center,
//                             label: "workout\nat home",
//                           ),
//                           IconWithText(
//                             icon: Icons.self_improvement,
//                             label: "meditate\nat home",
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: screenWidth * 0.05,
//                         vertical: screenHeight * 0.02,
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconWithText(
//                             icon: Icons.sports_bar,
//                             label: "buy sports\nwear",
//                           ),
//                           IconWithText(
//                             icon: Icons.play_lesson_sharp,
//                             label: "play\nsports",
//                           ),
//                           IconWithText(
//                             icon: Icons.bookmark,
//                             label: "book a\ncult class",
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     ElevatedButton(
//                       onPressed: () {
//                        Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>  IconsScreen()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.black,
//                         backgroundColor: Colors.white.withOpacity(0.4),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.1,
//                           vertical: screenHeight * 0.01,
//                         ),
//                       ),
//                       child: const Text(
//                         "SEE MORE",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     GlassContainer(
//                       borderRadius: BorderRadius.circular(12),
//                       border: 0,
//                       blur: 10,
//                       height: screenHeight * 0.12,
//                       width: screenWidth * 0.9,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.05,
//                         ),
//                         child: Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "FITSTART",
//                                   style: GoogleFonts.manrope(
//                                     color:
//                                         const Color.fromARGB(240, 236, 83, 44),
//                                     fontSize: screenWidth * 0.06,
//                                     fontWeight: FontWeight.w900,
//                                   ),
//                                 ),
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(3),
//                                   child: SizedBox(
//                                     height: 15,
//                                     child: ColoredBox(
//                                       color: Colors.white,
//                                       child: Text(
//                                         "INDIA'S BIGGEST FITNESS SALE",
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.manrope(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 10,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(width: 15),
//                             const VerticalDivider(
//                               color: Color.fromARGB(255, 241, 57, 1),
//                               thickness: 2,
//                               width: 20,
//                               indent: 10,
//                               endIndent: 10,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "LOWEST PRICES ON\nCULTPASS",
//                                   textAlign: TextAlign.start,
//                                   style: GoogleFonts.montserrat(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: screenWidth * 0.02,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   "EXPLORE NOW >",
//                                   textAlign: TextAlign.start,
//                                   style: GoogleFonts.montserrat(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 10,
//                                     color: Colors.white.withOpacity(0.5),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.03),
//                     // DISCOVER MORE //
//                     Text(
//                       "Discover more",
//                       textAlign: TextAlign.start,
//                       style: GoogleFonts.montserrat(
//                         fontWeight: FontWeight.w700,
//                         fontSize: screenWidth * 0.06,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.03),
//                     GlassContainer(
//                       borderRadius: BorderRadius.circular(15),
//                       border: 0.3,
//                       blur: 10,
//                       height: screenHeight * 0.18,
//                       width: screenWidth * 0.9,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                                 child: Container(
//                                   height: screenHeight * 0.15,
//                                   width: screenWidth * 0.35,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     color: Colors.white,
//                                     image: const DecorationImage(
//                                       image: NetworkImage(
//                                         'https://img.freepik.com/premium-vector/two-men-running-across-blue-white-background-vector-illustration-2d_1173418-1004.jpg',
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Personal\nTraining",
//                                     textAlign: TextAlign.start,
//                                     style: GoogleFonts.montserrat(
//                                       fontWeight: FontWeight.w800,
//                                       fontSize: screenWidth * 0.045,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 25),
//                                   CircleAvatar(
//                                     backgroundColor:
//                                         Colors.white.withOpacity(0.6),
//                                     radius: 15,
//                                     child: const Icon(
//                                         Icons.chevron_right_outlined),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 "Get a dedicated trainer for\nguaranteed results",
//                                 textAlign: TextAlign.start,
//                                 overflow: TextOverflow.fade,
//                                 style: GoogleFonts.montserrat(
//                                   fontWeight: FontWeight.w300,
//                                   fontSize: screenWidth * 0.035,
//                                   color: Colors.white54,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.05),
//                     // Row Box 4 //
//                     const RowBox(),
//                     const SizedBox(height: 15),
//                     const RowBox(),
//                     SizedBox(height: screenHeight * 0.03),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(left: screenWidth * 0.05, bottom: 15),
//                       child: Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Text(
//                           "Shop by collections",
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.montserrat(
//                             fontWeight: FontWeight.w700,
//                             fontSize: screenWidth * 0.05,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Horizontally scrollable row with CircleAvatar widgets
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.05, vertical: 20),
//                       child: SizedBox(
//                         height: 100,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 8,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: Column(
//                                 children: [
//                                   const CircleAvatar(
//                                     radius: 36,
//                                     backgroundColor: Color(0xff7FFA88),
//                                     child: CircleAvatar(
//                                       radius: 34,
//                                       backgroundImage: NetworkImage(
//                                         'https://img.freepik.com/premium-photo/woman-using-smartwatch-gym-workout-fitness-tracking-training_1212974-2065.jpg',
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     'sports items ${index + 1}',
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     // Fit Edit section carousel
//                     Text(
//                       "FIT.PLAN",
//                       textAlign: TextAlign.start,
//                       style: GoogleFonts.montserrat(
//                         fontWeight: FontWeight.w900,
//                         fontSize: screenWidth * 0.09,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       "Your complete source of inspiration to\nstay on top of your game.",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.montserrat(
//                         fontWeight: FontWeight.w500,
//                         fontSize: screenWidth * 0.035,
//                         color: Colors.white60,
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     const CenterCarousleScrren(),
//                     SizedBox(height: screenHeight * 0.03),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),

