import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/bloc/ai_meal_plan_bloc.dart';
import 'package:my_app/bloc/auth/auth_bloc.dart';
import 'package:my_app/bloc/habitcards/bloc/habit_bloc.dart';
import 'package:my_app/bloc/habitcards/bloc/habit_event.dart';
import 'package:my_app/bloc/lifestyle/lifestyle_bloc.dart';
import 'package:my_app/bloc/meal/bloc/meal_plan_bloc.dart';
import 'package:my_app/bloc/workout/bloc/workout_bloc.dart';
import 'package:my_app/bloc/workout/bloc/workout_event.dart';
import 'package:my_app/presentation/pages/mainpages/view/main_screen.dart';
import 'package:my_app/presentation/pages/spalshscreen/splash_screen.dart';
import 'package:my_app/repositories/ai_meal_plan_repository.dart';
import 'package:my_app/repositories/auth_repository.dart';
import 'package:my_app/repositories/habit_repository.dart';
import 'package:my_app/repositories/lifestyle_repository.dart';
import 'package:my_app/repositories/workout_repository.dart';
import 'package:my_app/services/meal_plan_service.dart';
import 'package:my_app/services/notification/fcm_config.dart';
import 'package:my_app/services/notification/notification_service.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // print('🔋 Background message: ${message.messageId}');
  LocalNotificationService.showNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
   NotificationHandler.initFCM();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final lifestyleRepo = LifestyleRepository();
  final authRepository = AuthRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HabitBloc(HabitRepository())..add(LoadHabits()),
        ),
        BlocProvider(
          create: (_) => LifestyleBloc(lifestyleRepo),
        ),
        BlocProvider(
      create: (context) => AuthBloc(
        authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (_) => MealPlanBloc(MealPlanService()),
        ),
        BlocProvider(
          create: (_) =>   WorkoutBloc(WorkoutRepository())..add(const FetchWorkouts()),
        ),
        BlocProvider(
          create: (_) => AiMealPlanBloc(AiMealPlanRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff010A04),
          fontFamily: "Lufga",
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
