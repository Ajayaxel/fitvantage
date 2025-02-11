import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_app/mainpages/view/consts/cutsom_carousel.dart';
import 'package:my_app/mainpages/view/main_screen.dart';

import 'package:my_app/onbord/view/onbord.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: Platform.isAndroid
          ? const FirebaseOptions(
              apiKey: "AIzaSyBoekCJcDjs6hY9gt4dNytJM4iR0dsrZg4",
              appId: "1:67092376481:android:ca1857f608bd7c792cb9e0",
              projectId: "fitvantage-1f04b",
              messagingSenderId: "67092376481")
          : const FirebaseOptions(
              apiKey: 'AIzaSyCXlqsKxe3WKJWEp24-78kWhEE59KS4vBQ',
              appId: '1:67092376481:ios:3d882f61a228fc422cb9e0',
              messagingSenderId: '67092376481',
              projectId: 'fitvantage-1f04b',
              iosBundleId: 'com.fitvantage.app',
              storageBucket: 'fitvantage-1f04b.firebasestorage.app',
            ));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff010A04),
        fontFamily: "Lufga",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnboardingScreen(),
    );
  }
}
