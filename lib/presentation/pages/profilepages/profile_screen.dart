// import 'package:flutter/material.dart';

// import 'package:my_app/presentation/pages/profilepages/profile_setting.dart';

// class ProfileScreen extends StatelessWidget {
//   final String userName;
//   const ProfileScreen({super.key, required this.userName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff010A04),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff010A04),
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title:  Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
//               Text(
//                 userName,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => ProfileSetting(userName: userName),
//                     ),
//                   );
//                 },
//                 child: const Icon(
//                   Icons.menu,
//                   color: Colors.white,
//                   size: 24,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Workout Progress
//             _buildProgressCard('Workout Progress', '12 exercise left', 0.65),

//             const SizedBox(height: 20),

//             // Today's Activity
//             const Text('Today\'s Activity',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold)),

//             const SizedBox(height: 16),

//             Row(
//               children: [
//                 _buildCalorieCard(),
//                 const SizedBox(width: 16),
//                 Expanded(child: _buildActivityDetails()),
//               ],
//             ),

//             const SizedBox(height: 20),

//             // Overall Status
//             const Text('Overall Status',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold)),

//             const SizedBox(height: 16),

//             _buildStatusCard('Calorie loss', 0.65, "assets/profile/weight lifting.png"),
//             _buildStatusCard('Weight loss', 0.65, "assets/profile/Fire.png"),
//             _buildStatusCard('Calorie loss', 0.65, "assets/profile/stretching.png"),
//             _buildStatusCard('Calorie loss', 0.65, "assets/profile/weight lifting.png"),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProgressCard(String title, String subtitle, double progress) {
//     return Container(
//       height: 69,
//       decoration: BoxDecoration(
//         color: const Color(0xff171917),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold)),
//                 Text(subtitle,
//                     style:
//                         const TextStyle(color: Colors.white54, fontSize: 14)),
//               ],
//             ),
//             _buildCircularProgress(progress),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCalorieCard() {
//     return Container(
//       height: 165,
//       width: 102,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xFF7FFA88),
//             Color(0xFF347A39),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//               height: 68,
//               width: 82,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(8)),
//                 color: Colors.black,
//               ),
//               child: Center(
//                 child: SizedBox(
//                   height: 32,
//                   width: 32,
//                   child: Image.asset(
//                     'assets/Fitness/Jungle.png',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             '1,350',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const Text(
//             'Calories',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildActivityDetails() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildActivityRow('Push-ups', '15 x3'),
//           _buildActivityRow('Push-ups', '15 x3'),
//           _buildActivityRow('Push-ups', '15 x3'),
//         ],
//       ),
//     );
//   }

//   Widget _buildActivityRow(String activity, String reps) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(activity,
//               style: const TextStyle(color: Colors.white, fontSize: 14)),
//           Text(reps,
//               style: const TextStyle(color: Colors.white70, fontSize: 14)),
//         ],
//       ),
//     );
//   }

// //overall status //
//   Widget _buildStatusCard(String title, double progress ,String imagePath) {
//     return Container(
//       margin: const EdgeInsets.only(
//         bottom: 16,
//       ),
//       height: 71,
//       decoration: BoxDecoration(
//         color: const Color(0xff161816),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                   width: 48,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Center(
//                     child: SizedBox(
//                         height: 24,
//                         width: 24,
//                         child: Image.asset(
//                           imagePath,
//                           fit: BoxFit.cover,
//                         )),
//                   )),
//               const SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '${(progress * 100).toStringAsFixed(2)}%',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           _buildCircularProgress(progress),
//         ],
//       ),
//     );
//   }
//   //circle progress //

//   Widget _buildCircularProgress(double progress) {
//     return SizedBox(
//       width: 46,
//       height: 46,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           CircularProgressIndicator(
//             value: progress,
//             backgroundColor: Colors.black,
//             valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7FFA88)),
//             strokeWidth: 4,
//           ),
//           const Text(
//             '65%',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 10,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/profilepages/profile_setting.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  const ProfileScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010A04),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProfileSetting(userName: userName),
                      ));
                    },
                    child: const Icon(Icons.menu, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Good morning",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Workout Progress Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff171917),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage(
                          'assets/Homeimages/profile.png'), // Replace with actual image
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Workout Progress',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '12 exercise left',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    _buildCircularProgress(0.65),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Today's Activity Section
              const Text(
                "Today's Activity",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildActivityCard("Push-ups", "15 x3", true),
                  const SizedBox(width: 8),
                  _buildActivityCard("Pull-ups", "15 x3", false),
                  const SizedBox(width: 8),
                  _buildActivityCard("Bench presses", "15 x3", false),
                ],
              ),

              const SizedBox(height: 24),

              // Overall Status Section
              const Text(
                "Overall Status",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 16),
              _buildStatusCard("Calorie loss", "12.181%", 0.65,
                  "assets/Athome/Rectangle 22527.png"),
              _buildStatusCard("Weight loss", "12.181%", 0.65,
                  "assets/Athome/Rectangle 22527.png"),
              _buildStatusCard("Calorie loss", "12.181%", 0.65,
                  "assets/Athome/Rectangle 22527.png"),
              _buildStatusCard("Calorie loss", "12.181%", 0.65,
                  "assets/Athome/Rectangle 22527.png"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard(String title, String reps, bool isActive) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF7FFA88) : const Color(0xff1B1C1B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              Icons.fitness_center,
              color: isActive ? Colors.black : Colors.white,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              reps,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(
      String title, String value, double progress, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff161816),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('${(progress * 100).toInt()}%',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: Colors.black,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFF7FFA88)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgress(double progress) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            backgroundColor: Colors.black,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7FFA88)),
            strokeWidth: 4,
          ),
          Text(
            '${(progress * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
