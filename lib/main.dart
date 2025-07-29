import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/auth/auth_bloc.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_bloc.dart';
import 'package:my_app/blocs/mealplan/bloc/mealplan_bloc.dart';
import 'package:my_app/blocs/mealplan/bloc/mealplan_event.dart';
import 'package:my_app/presentation/pages/mainpages/view/main_screen.dart';
import 'package:my_app/presentation/pages/spalshscreen/splash_screen.dart';
import 'package:my_app/repositories/auth_repository.dart';

import 'package:my_app/repositories/lifestyle_repository.dart';
import 'package:my_app/repositories/meal_plan_repository.dart';

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
     MyApp(),
  );
}


class MyApp extends StatelessWidget {
   final lifestyleRepo = LifestyleRepository();
  final mealPlanRepo = MealPlanRepository();
    final authRepository = AuthRepository();

  MyApp({super.key});

  @override
Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LifestyleBloc(lifestyleRepo),
        ),
        BlocProvider(
          create: (_) => MealPlanBloc(mealPlanRepo)..add(FetchMealPlans()),
        ),
        BlocProvider(
         create: (_) => AuthBloc(authRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff010A04),
          fontFamily: "Lufga",
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

