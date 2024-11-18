import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';

class TimerScrren extends StatefulWidget {
  const TimerScrren({
    super.key,
  });

  @override
  State<TimerScrren> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TimerScrren> {
  final int _duration = 31;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: CircularCountDownTimer(
              // Countdown duration in Seconds.
              duration: _duration,

              // Countdown initial elapsed Duration in Seconds.
              initialDuration: 0,

              // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
              controller: _controller,

              // Width of the Countdown Widget.
              width: MediaQuery.of(context).size.width / 2,

              // Height of the Countdown Widget.
              height: MediaQuery.of(context).size.height / 2,

              // Ring Color for Countdown Widget.
              ringColor: Colors.grey[300]!,

              // Ring Gradient for Countdown Widget.
              ringGradient: null,

              // Filling Color for Countdown Widget.
              fillColor: Colors.greenAccent,

              // Filling Gradient for Countdown Widget.
              fillGradient: null,

              // Background Color for Countdown Widget.
              backgroundColor: Colors.black,

              // Background Gradient for Countdown Widget.
              backgroundGradient: null,

              // Border Thickness of the Countdown Ring.
              strokeWidth: 20.0,

              // Begin and end contours with a flat edge and no extension.
              strokeCap: StrokeCap.round,

              // Text Style for Countdown Text.
              textStyle: const TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),

              // Format for the Countdown Text.
              textFormat: CountdownTextFormat.S,

              // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
              isReverse: true,

              // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
              isReverseAnimation: true,

              // Handles visibility of the Countdown Text.
              isTimerTextShown: true,

              // Handles the timer start.
              autoStart: true,

              // This Callback will execute when the Countdown Starts.
              onStart: () {
                // Here, do whatever you want
                debugPrint('Countdown Started');
              },

              // This Callback will execute when the Countdown Ends.
              onComplete: () {
                // Here, do whatever you want
                debugPrint('Countdown Ended');
              },

              onChange: (String timeStamp) {
                // Here, do whatever you want
                debugPrint('Countdown Changed $timeStamp');
              },
            ),
          ),
           const Positioned(
            left: 15,
            top: 19,
                 
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
          Positioned(
              top: 450,
              left: 175,
              child: Text(
                "Rest",
                style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              )),
          const Positioned(
            top: 570,
            left: 160,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white60,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text("Log last set", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            top:730,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Container(
                height: 90,
                width: 350,
                decoration: const BoxDecoration(
                    color:Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Row(
                  children: [
 Container(
  margin: const EdgeInsets.all(10),
  width: 80,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    image: const DecorationImage(
      image: NetworkImage("https://cbx-prod.b-cdn.net/COLOURBOX8559718.jpg?width=800&height=800&quality=70"), // Replace with your image URL
      fit: BoxFit.cover,
    ),
  ),
),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next Up",
                          style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Text("Dumbbell Bent-over\nRow",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14)),
                      ],
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    const Icon(Icons.play_arrow, color: Colors.white, size: 36),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // body: Center(
      //   child: CircularCountDownTimer(
      //     // Countdown duration in Seconds.
      //     duration: _duration,

      //     // Countdown initial elapsed Duration in Seconds.
      //     initialDuration: 0,

      //     // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
      //     controller: _controller,

      //     // Width of the Countdown Widget.
      //     width: MediaQuery.of(context).size.width / 2,

      //     // Height of the Countdown Widget.
      //     height: MediaQuery.of(context).size.height / 2,

      //     // Ring Color for Countdown Widget.
      //     ringColor: Colors.grey[300]!,

      //     // Ring Gradient for Countdown Widget.
      //     ringGradient: null,

      //     // Filling Color for Countdown Widget.
      //     fillColor: Colors.greenAccent,

      //     // Filling Gradient for Countdown Widget.
      //     fillGradient: null,

      //     // Background Color for Countdown Widget.
      //     backgroundColor: Colors.purple[500],

      //     // Background Gradient for Countdown Widget.
      //     backgroundGradient: null,

      //     // Border Thickness of the Countdown Ring.
      //     strokeWidth: 20.0,

      //     // Begin and end contours with a flat edge and no extension.
      //     strokeCap: StrokeCap.round,

      //     // Text Style for Countdown Text.
      //     textStyle: const TextStyle(
      //       fontSize: 33.0,
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),

      //     // Format for the Countdown Text.
      //     textFormat: CountdownTextFormat.S,

      //     // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
      //     isReverse: false,

      //     // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
      //     isReverseAnimation: false,

      //     // Handles visibility of the Countdown Text.
      //     isTimerTextShown: true,

      //     // Handles the timer start.
      //     autoStart: true,

      //     // This Callback will execute when the Countdown Starts.
      //     onStart: () {
      //       // Here, do whatever you want
      //       debugPrint('Countdown Started');
      //     },

      //     // This Callback will execute when the Countdown Ends.
      //     onComplete: () {
      //       // Here, do whatever you want
      //       debugPrint('Countdown Ended');
      //     },

      //     onChange: (String timeStamp) {
      //       // Here, do whatever you want
      //       debugPrint('Countdown Changed $timeStamp');
      //     },
      //   ),
      // ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const SizedBox(
      //       width: 30,
      //     ),

      //            _button(
      //       title: "Start",
      //       onPressed: () => _controller.pause(),
      //     ),

      //   ],
      // ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.purple),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
