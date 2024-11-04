import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", // Replace with your video URL
    )..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.setVolume(0); // Mute the video sound
          _controller.play(); // Autoplay the video after initialization
        }
      }).catchError((error) {
        print("Error initializing video: $error");
      });

    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        _controller.seekTo(Duration.zero);
        _controller.play();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goFullScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideo(controller: _controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
            Navigator.of(context).pop(); 
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _controller.value.isInitialized
                  ? GestureDetector(
                      onTap: _goFullScreen, // Go to full screen on tap
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenVideo extends StatelessWidget {
  final VideoPlayerController controller;

  FullScreenVideo({required this.controller});

  @override
  Widget build(BuildContext context) {
    // Set system overlays to hidden for immersive full-screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return WillPopScope(
      onWillPop: () async {
        // Pause the video when exiting full-screen
        controller.pause();
        // Restore system overlays when exiting full-screen
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        return true; // Allow pop
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
            // Positioned(
            //   top: 40,
            //   left: 20,
            //   child: IconButton(
            //     icon: Icon(Icons.arrow_back, color: Colors.white),
            //     onPressed: () {
            //       // Pause the video when back button is pressed
            //       controller.pause();
            //       // Restore system overlays
            //       SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
            //       Navigator.of(context).pop(); // Go back to the previous screen
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


