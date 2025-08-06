// import 'package:flutter/material.dart';
// import 'package:my_app/presentation/myworkout/last_pull_down_screen.dart';

// class MyWorkoutScreen extends StatelessWidget {
//   const MyWorkoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final exercises = List.generate(9, (_) => const WorkoutTile());

//     return Scaffold(

//       appBar: AppBar(
//         backgroundColor: const Color(0xff161816),
//         elevation: 0,
//         leading: const BackButton(color: Colors.white),
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("My Workout Plan",
//                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//             SizedBox(height: 2),
//             Text("Lose Weight • Beginner • 4 Days",
//                 style: TextStyle(color: Colors.grey, fontSize: 12)),
//           ],
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: Icon(Icons.settings, color: Colors.white),
//           )
//         ],
//       ),
//       body: Stack(
//         children: [
//           ListView(
//             children: [
//               const DateSelector(),
//               const SizedBox(height: 16),
//               const SectionHeader(title: "Back & Biceps", duration: "47 MINS"),
//               const SizedBox(height: 8),
//               const SubSection(title: "Warm Up", duration: "13 MINS", isExpanded: false),
//               const Divider(color: Colors.grey),
//               const SubSection(title: "Workout", duration: "34 MINS", isExpanded: true),
//               const SizedBox(height: 12),
//               ...exercises,
//             ],
//           ),
//           // Bottom Button

//         ],
//       ),
//     );
//   }
// }

// class DateSelector extends StatelessWidget {
//   const DateSelector({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
//     final dates = ['05', '06', '07', '08', '08', '08', '08'];

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: const BoxDecoration(
//         color: Color(0xff161816),
        
//       ),
//       height: 70,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: days.length,
//         separatorBuilder: (_, __) => const SizedBox(width: 12),
//         itemBuilder: (context, index) {
//           final isSelected = index == 2;
//           return Column(
//             children: [
//               CircleAvatar(
//                 radius: 20,
//                 backgroundColor: isSelected ? const Color(0xFF5DF78D) : Colors.transparent,
//                 child: Text(
//                   days[index],
//                   style: TextStyle(
//                     color: isSelected ? Colors.black : Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 dates[index],
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class SectionHeader extends StatelessWidget {
//   final String title;
//   final String duration;

//   const SectionHeader({
//     super.key,
//     required this.title,
//     required this.duration,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           Text(title,
//               style: const TextStyle(
//                   color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//           const Spacer(),
//           Text(duration, style: const TextStyle(color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }

// class SubSection extends StatelessWidget {
//   final String title;
//   final String duration;
//   final bool isExpanded;

//   const SubSection({
//     super.key,
//     required this.title,
//     required this.duration,
//     this.isExpanded = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//       children: [
//         Text(title,
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
//         const Spacer(),
//         Text(duration, style: const TextStyle(color: Colors.white)),
//         const SizedBox(width: 10),
//         Icon(
//           isExpanded ? Icons.keyboard_arrow_up : Icons.add,
//           color: Colors.white,
//         )
//       ],
//     ),
//     );
    

//   }
// }



// class WorkoutTile extends StatelessWidget {
//   const WorkoutTile({super.key});

//   void _replaceExerciseSheet(BuildContext context) {
//   final List<Map<String, String>> exercises = [
//     {
//       'image': 'https://steelsupplements.com/cdn/shop/articles/shutterstock_316192880_1600x.jpg?v=1596620197',
//       'label': 'Bent-over Row',
//     },
//     {
//       'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtDpTTuuNgH_AqyaSMWLMSw0K43yVEkYVM1i7zMaplKFQOG3UVc3u0v4MTMtvg4sy2JRo&usqp=CAU',
//       'label': 'PULL UPS',
//     },
//     {
//       'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjP-aRbrH_c97Jk_dsAifQ1csSwu9Xrw0_pE951MaE9hY2tJmOhvTh_VROv8jFly9Znx4&usqp=CAU',
//       'label': 'Barbell Bent-over Row',
//     },
//     {
//       'image': 'https://motionarray.imgix.net/green-screen-woman-doing-workout-for-ful-1880947-high_0014.jpg?w=660&q=60&fit=max&auto=format',
//       'label': 'Bent-over Row',
//     },
//   ];

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: const Color(0xFF121212),
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (context) {
//       return DraggableScrollableSheet(
//         expand: false,
//         builder: (_, controller) {
//           return Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 40,
//                     height: 4,
//                     margin: const EdgeInsets.only(bottom: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[700],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const Text(
//                   "Swap With",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Expanded(
//                   child: ListView.builder(
//                     controller: controller,
//                     itemCount: exercises.length,
//                     itemBuilder: (_, index) {
//                       final item = exercises[index];
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 20),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.network(
//                                 item['image']!,
//                                 width: 70,
//                                 height: 70,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   "HARDER",
//                                   style: TextStyle(
//                                     color: Color(0xff7FFA88),
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   item['label']!,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }


//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: const Color(0xFF121212),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: 40,
//                 height: 4,
//                 margin: const EdgeInsets.only(bottom: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[700],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Lat Pull Down',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
        
//               _buildOption(
//                 icon: Icons.edit,
//                 label: 'Log Exercise',
//                 onTap: () {
//                   Navigator.pop(context);
//                   _showLogExerciseSheet(context); // <- Call next sheet
//                 },
//               ),
//               const Divider(color: Colors.black),
//               _buildOption(
//                 icon: Icons.sync_alt,
//                 label: 'Replace Exercise',
//                 onTap: () {
//                   Navigator.pop(context);
//                   _replaceExerciseSheet(context);
//                 },
//               ),
//               const Divider(color: Colors.black),
//               _buildOption(
//                 icon: Icons.delete_outline,
//                 label: 'Delete Exercise',
//                 onTap: () => Navigator.pop(context),
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   static Widget _buildOption({
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.white),
//       title: Text(label, style: const TextStyle(color: Colors.white)),
//       onTap: onTap,
//       contentPadding: EdgeInsets.zero,
//       dense: true,
//     );
//   }

//   static void _showLogExerciseSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: const Color(0xFF121212),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return DraggableScrollableSheet(
//           expand: false,
//           builder: (_, controller) {
//             return StatefulBuilder(
//               builder: (context, setState) {
//                 List<Map<String, String>> sets = List.generate(4, (index) => {'reps': '10', 'weight': ''});
//                 bool isKg = true;

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 40,
//                         height: 4,
//                         margin: const EdgeInsets.only(bottom: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[700],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Log key exercises",
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                         ),
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "To help track your progress better",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset(
//                               'assets/Fitness/lastworkout.png',
//                               height: 50,
//                               width: 50,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           const Text(
//                             'Lat Pull Down',
//                             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                           const Spacer(),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[800],
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Row(
//                               children: [
//                                 TextButton(
//                                   onPressed: () => setState(() => isKg = true),
//                                   child: Text('KG', style: TextStyle(color: isKg ? Colors.white : Colors.grey)),
//                                 ),
//                                 TextButton(
//                                   onPressed: () => setState(() => isKg = false),
//                                   child: Text('LBS', style: TextStyle(color: isKg ? Colors.grey : Colors.white)),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Expanded(
//                         child: ListView.builder(
//                           controller: controller,
//                           itemCount: sets.length,
//                           itemBuilder: (_, index) {
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const SizedBox(height: 30,),
//                                 Text("Set ${index + 1}", style: const TextStyle(color: Colors.white)),
//                                 const SizedBox(width:60 ),
//                                 const SizedBox(
//                                   width: 60,
//                                   child: TextField(
//                                     keyboardType: TextInputType.number,
//                                     style: TextStyle(color: Colors.white),
//                                     decoration: InputDecoration(
//                                       hintText: "10",
//                                       hintStyle: TextStyle(color: Colors.white),
//                                       suffixText: "reps",
//                                       suffixStyle: TextStyle(color: Colors.white),
//                                       enabledBorder: UnderlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.grey),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 const Text('x', style: TextStyle(color: Colors.white)),
//                                 const SizedBox(width: 10),
//                                 SizedBox(
//                                   width: 50,
//                                   child: TextField(
//                                     keyboardType: TextInputType.number,
//                                     style: const TextStyle(color: Colors.white),
//                                     decoration: InputDecoration(
//                                       hintText: "",
//                                       hintStyle: const TextStyle(color: Colors.white),
//                                       suffixText: isKg ? 'kgs' : 'lbs',
//                                       suffixStyle: const TextStyle(color: Colors.white),
//                                       enabledBorder: const UnderlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.grey),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 IconButton(
//                                   icon: const Icon(Icons.delete_outline, color: Colors.white),
//                                   onPressed: () => {}, // implement delete logic
//                                 )
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 12,),
//                       const Row(
//                         children: [
//                           Icon(Icons.add, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text("ADD SET", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () => {
//                                 Navigator.pop(context),
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(vertical: 14),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[700],
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: const Center(
//                                   child: Text("Cancel", style: TextStyle(color: Colors.white)),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(vertical: 14),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xff7FFA88),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: const Center(
//                                 child: Text("Save", style: TextStyle(color: Colors.black)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: GestureDetector(
//         onTap: () => {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const LatPullDownScreen(),
//             ),
//           ),
//         },
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(
//                 'assets/Fitness/lastworkout.png',
//                 height: 60,
//                 width: 60,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 12),
//             const Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Lat Pull Down",
//                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "10 Reps × 15 Kg • 10 Reps",
//                     style: TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                   Text(
//                     "10 Reps",
//                     style: TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () => _showBottomSheet(context),
//               child: const Icon(Icons.more_vert, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:my_app/presentation/myworkout/last_pull_down_screen.dart';
import 'package:my_app/presentation/myworkout/work_out_setting.dart';

class MyWorkoutScreen extends StatefulWidget {
  const MyWorkoutScreen({super.key});

  @override
  State<MyWorkoutScreen> createState() => _MyWorkoutScreenState();
}

class _MyWorkoutScreenState extends State<MyWorkoutScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final exercises = List.generate(9, (_) => const WorkoutTile());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff161816),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: isLoading
            ? const ShimmerWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(width: 150, height: 16),
                    SizedBox(height: 4),
                    ShimmerBox(width: 200, height: 12),
                  ],
                ),
              )
            : const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Workout Plan",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 2),
                  Text("Lose Weight • Beginner • 4 Days",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: isLoading
                ? const ShimmerWidget(child: ShimmerBox(width: 24, height: 24))
                : GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WorkoutSettingScreen(),
                        ),
                      );
                      // Handle settings tap
                    },
                    child: const Icon(Icons.settings, color: Colors.white)),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              isLoading ? const DateSelectorSkeleton() : const DateSelector(),
              const SizedBox(height: 16),
              isLoading
                  ? const SectionHeaderSkeleton()
                  : const SectionHeader(title: "Back & Biceps", duration: "47 MINS"),
              const SizedBox(height: 8),
              isLoading
                  ? const SubSectionSkeleton()
                  : const SubSection(title: "Warm Up", duration: "13 MINS", isExpanded: false),
              const Divider(color: Colors.grey),
              isLoading
                  ? const SubSectionSkeleton()
                  : const SubSection(title: "Workout", duration: "34 MINS", isExpanded: true),
              const SizedBox(height: 12),
              ...isLoading
                  ? List.generate(9, (_) => const WorkoutTileSkeleton())
                  : exercises,
            ],
          ),
          // Bottom Button
        ],
      ),
    );
  }
}

// Shimmer Widget
class ShimmerWidget extends StatefulWidget {
  final Widget child;
  
  const ShimmerWidget({super.key, required this.child});

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [
                Colors.grey,
                Colors.white24,
                Colors.grey,
              ],
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3,
              ].map((stop) => stop.clamp(0.0, 1.0)).toList(),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

// Shimmer Box
class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: borderRadius ?? BorderRadius.circular(4),
      ),
    );
  }
}

// Date Selector Skeleton
class DateSelectorSkeleton extends StatelessWidget {
  const DateSelectorSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xff161816),
      ),
      height: 70,
      child: ShimmerWidget(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return const Column(
              children: [
                ShimmerBox(width: 40, height: 40, borderRadius: BorderRadius.all(Radius.circular(20))),
                SizedBox(height: 6),
                ShimmerBox(width: 20, height: 12),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Section Header Skeleton
class SectionHeaderSkeleton extends StatelessWidget {
  const SectionHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ShimmerWidget(
        child: Row(
          children: [
            ShimmerBox(width: 150, height: 18),
            Spacer(),
            ShimmerBox(width: 60, height: 14),
          ],
        ),
      ),
    );
  }
}

// Sub Section Skeleton
class SubSectionSkeleton extends StatelessWidget {
  const SubSectionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ShimmerWidget(
        child: Row(
          children: [
            ShimmerBox(width: 80, height: 15),
            Spacer(),
            ShimmerBox(width: 60, height: 12),
            SizedBox(width: 10),
            ShimmerBox(width: 24, height: 24),
          ],
        ),
      ),
    );
  }
}

// Workout Tile Skeleton
class WorkoutTileSkeleton extends StatelessWidget {
  const WorkoutTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: const ShimmerWidget(
        child: Row(
          children: [
            ShimmerBox(
              width: 60,
              height: 60,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(width: 120, height: 16),
                  SizedBox(height: 4),
                  ShimmerBox(width: 160, height: 12),
                  SizedBox(height: 2),
                  ShimmerBox(width: 60, height: 12),
                ],
              ),
            ),
            ShimmerBox(width: 24, height: 24),
          ],
        ),
      ),
    );
  }
}

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    final dates = ['05', '06', '07', '08', '08', '08', '08'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xff161816),
        
      ),
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = index == 2;
          return Column(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: isSelected ? const Color(0xFF5DF78D) : Colors.transparent,
                child: Text(
                  days[index],
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                dates[index],
                style: const TextStyle(color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String duration;

  const SectionHeader({
    super.key,
    required this.title,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(duration, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class SubSection extends StatelessWidget {
  final String title;
  final String duration;
  final bool isExpanded;

  const SubSection({
    super.key,
    required this.title,
    required this.duration,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        const Spacer(),
        Text(duration, style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 10),
        Icon(
          isExpanded ? Icons.keyboard_arrow_up : Icons.add,
          color: Colors.white,
        )
      ],
    ),
    );
    

  }
}

class WorkoutTile extends StatelessWidget {
  const WorkoutTile({super.key});

  void _replaceExerciseSheet(BuildContext context) {
  final List<Map<String, String>> exercises = [
    {
      'image': 'https://steelsupplements.com/cdn/shop/articles/shutterstock_316192880_1600x.jpg?v=1596620197',
      'label': 'Bent-over Row',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtDpTTuuNgH_AqyaSMWLMSw0K43yVEkYVM1i7zMaplKFQOG3UVc3u0v4MTMtvg4sy2JRo&usqp=CAU',
      'label': 'PULL UPS',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjP-aRbrH_c97Jk_dsAifQ1csSwu9Xrw0_pE951MaE9hY2tJmOhvTh_VROv8jFly9Znx4&usqp=CAU',
      'label': 'Barbell Bent-over Row',
    },
    {
      'image': 'https://motionarray.imgix.net/green-screen-woman-doing-workout-for-ful-1880947-high_0014.jpg?w=660&q=60&fit=max&auto=format',
      'label': 'Bent-over Row',
    },
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF121212),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (_, controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Text(
                  "Swap With",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: exercises.length,
                    itemBuilder: (_, index) {
                      final item = exercises[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item['image']!,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "HARDER",
                                  style: TextStyle(
                                    color: Color(0xff7FFA88),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['label']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}


  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF121212),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lat Pull Down',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
        
              _buildOption(
                icon: Icons.edit,
                label: 'Log Exercise',
                onTap: () {
                  Navigator.pop(context);
                  _showLogExerciseSheet(context); // <- Call next sheet
                },
              ),
              const Divider(color: Colors.black),
              _buildOption(
                icon: Icons.sync_alt,
                label: 'Replace Exercise',
                onTap: () {
                  Navigator.pop(context);
                  _replaceExerciseSheet(context);
                },
              ),
              const Divider(color: Colors.black),
              _buildOption(
                icon: Icons.delete_outline,
                label: 'Delete Exercise',
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }

  static void _showLogExerciseSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF121212),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return StatefulBuilder(
              builder: (context, setState) {
                List<Map<String, String>> sets = List.generate(4, (index) => {'reps': '10', 'weight': ''});
                bool isKg = true;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Log key exercises",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "To help track your progress better",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/Fitness/lastworkout.png',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Lat Pull Down',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () => setState(() => isKg = true),
                                  child: Text('KG', style: TextStyle(color: isKg ? Colors.white : Colors.grey)),
                                ),
                                TextButton(
                                  onPressed: () => setState(() => isKg = false),
                                  child: Text('LBS', style: TextStyle(color: isKg ? Colors.grey : Colors.white)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          controller: controller,
                          itemCount: sets.length,
                          itemBuilder: (_, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 30,),
                                Text("Set ${index + 1}", style: const TextStyle(color: Colors.white)),
                                const SizedBox(width:60 ),
                                const SizedBox(
                                  width: 60,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: "10",
                                      hintStyle: TextStyle(color: Colors.white),
                                      suffixText: "reps",
                                      suffixStyle: TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text('x', style: TextStyle(color: Colors.white)),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: "",
                                      hintStyle: const TextStyle(color: Colors.white),
                                      suffixText: isKg ? 'kgs' : 'lbs',
                                      suffixStyle: const TextStyle(color: Colors.white),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.white),
                                  onPressed: () => {}, // implement delete logic
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12,),
                      const Row(
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          SizedBox(width: 8),
                          Text("ADD SET", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.pop(context),
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text("Cancel", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xff7FFA88),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text("Save", style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LatPullDownScreen(),
            ),
          ),
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/Fitness/lastworkout.png',
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lat Pull Down",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "10 Reps × 15 Kg • 10 Reps",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "10 Reps",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _showBottomSheet(context),
              child: const Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
