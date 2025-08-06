import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:my_app/services/notification/notification_service.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('🔋 Background message: ${message.messageId}');
  LocalNotificationService.showNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await LocalNotificationService.initialize();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await NotificationHandler.initFCM();
  runApp(MyApp());
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
        home: const SplashScreen(),
      ),
    );
  }
}
