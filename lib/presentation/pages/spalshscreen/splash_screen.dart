import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/LogingPages/loging_screen.dart';
import 'package:my_app/presentation/pages/mainpages/view/main_screen.dart';
import 'package:my_app/presentation/pages/onbord/onbord.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  Future<void> navigateUser() async {
    await Future.delayed(const Duration(seconds: 2)); // Delay for splash effect
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    Widget nextScreen;

    if (!hasSeenOnboarding) {
      nextScreen = const OnboardingScreen();
    } else if (token != null && token.isNotEmpty) {
      nextScreen = const MainScreen();
    } else {
      nextScreen = LoginScreen();
    }

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (_) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                  "assets/Onbordingnew/Group 97.png",
                 height: 110,
                 width: 146,
                  fit: BoxFit.cover,
                ),
            ),
            const SizedBox(height: 20),
             Center(child: Image.asset("assets/Onbordingnew/Group 98.png", fit: BoxFit.cover, ))
          ],
        ),
      )
    );
  }
}

