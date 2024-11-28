import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/videocall/call_page.dart';

class VideocallScreen extends StatelessWidget {
  final TextEditingController meetingIdController = TextEditingController();

  VideocallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true, // Ensures UI resizes with the keyboard
      body: Stack(
        children: [
          BackgroundImage(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: screenHeight, // Ensures full use of screen height
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,color: Colors.white,))),
                    SizedBox(height: screenHeight *0.2,),
                  Image.network(
                    "https://cdni.iconscout.com/illustration/premium/thumb/fitness-application-illustration-download-in-svg-png-gif-file-formats--workout-with-trainer-woman-doing-exercie-pack-gym-illustrations-4581403.png",
                    width: screenWidth * 0.8, // Adjust width based on screen size
                    height: screenHeight * 0.3, // Adjust height based on screen size
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  const Text(
                    "Enter Meeting ID",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextField(
                    controller: meetingIdController,
                    decoration: const InputDecoration(
                      labelText: "Meeting ID",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.videocam, color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CallPage(callID: meetingIdController.text),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      "Join Call",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextButton(
                    onPressed: () {
                      // Handle help or support logic
                    },
                    child: const Text(
                      "Need help?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


