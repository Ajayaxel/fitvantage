// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:my_app/presentation/pages/videocall/call_page.dart';

// class VideocallScreen extends StatelessWidget {
//   final TextEditingController meetingIdController = TextEditingController();

//   VideocallScreen({super.key});

//   Future<void> _joinCall(BuildContext context) async {
//     final meetingId = meetingIdController.text.trim();
//     if (meetingId.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter a Meeting ID")),
//       );
//       return;
//     }

//     // Request permissions before joining the call
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.camera,
//       Permission.microphone,
//     ].request();

//     print("Meeting ID: $meetingId");
//     print("Camera permission: ${statuses[Permission.camera]}");
//     print("Mic permission: ${statuses[Permission.microphone]}");

//     if (statuses[Permission.camera]!.isGranted &&
//         statuses[Permission.microphone]!.isGranted) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CallPage(callID: meetingId),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Camera and microphone permissions are required."),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: SizedBox(
//           height: screenHeight,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Align(
//                 alignment: Alignment.bottomLeft,
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: const Icon(Icons.arrow_back, color: Colors.white),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.2),
//               Image.network(
//                 "https://cdni.iconscout.com/illustration/premium/thumb/fitness-application-illustration-download-in-svg-png-gif-file-formats--workout-with-trainer-woman-doing-exercie-pack-gym-illustrations-4581403.png",
//                 width: screenWidth * 0.8,
//                 height: screenHeight * 0.3,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(height: screenHeight * 0.05),
//               const Text(
//                 "Enter Meeting ID",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               TextField(
//                 controller: meetingIdController,
//                 decoration: const InputDecoration(
//                   labelText: "Meeting ID",
//                   labelStyle: TextStyle(color: Colors.white),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white, width: 2.0),
//                   ),
//                   prefixIcon: Icon(Icons.videocam, color: Colors.white),
//                 ),
//                 style: const TextStyle(color: Colors.white),
//                 keyboardType: TextInputType.text,
//               ),
//               SizedBox(height: screenHeight * 0.03),
//               ElevatedButton(
//                 onPressed: () => _joinCall(context),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(
//                     vertical: screenHeight * 0.02,
//                   ),
//                   backgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 child: const Text(
//                   "Join Call",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.redAccent,
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "Need help?",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





