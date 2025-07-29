// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_app/blocs/lifestyle/lifestyle_bloc.dart';
// import 'package:my_app/blocs/lifestyle/lifestyle_event.dart';
// import 'package:my_app/presentation/pages/bookaclass/book_class_screen.dart';
// import 'package:my_app/presentation/pages/habitcard/habit_cards_screen.dart';
// import 'package:my_app/presentation/pages/mealplan/ai_meals_screen.dart';
// import 'package:my_app/presentation/pages/mealplan/meal_plan_screen.dart';
// import 'package:my_app/presentation/pages/steps_tracking_cards.dart';
// import 'package:my_app/presentation/pages/subscription/subscripton_screen.dart';
// import 'package:my_app/presentation/widgets/const_button.dart';
// import 'package:my_app/presentation/pages/lifestylequestionnaire/questionnaire_screen.dart';
// import 'package:my_app/repositories/lifestyle_repository.dart';

// class TransformScreen extends StatelessWidget {
//   const TransformScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 const StepTrackerCard(),
//                 const SizedBox(height: 30),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const MealPlanScreen(),
//                             ),
//                           );
//                         },
//                         child: Stack(
//                           children: [
//                             Image.asset(
//                               'assets/Fitness/meals.png',
//                               fit: BoxFit.cover,
//                               height: 184,
//                             ),
//                             Positioned(
//                               bottom: 6,
//                               left: 22,
//                               right: 22,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (_) => const AiMealsScreen(),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 8, vertical: 1),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xff7FFA88),
//                                     borderRadius: BorderRadius.circular(16),
//                                   ),
//                                   child: const Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         "View Now",
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       CircleAvatar(
//                                         radius: 12,
//                                         backgroundColor: Colors.black,
//                                         child: Icon(Icons.arrow_outward,
//                                             color: Colors.white, size: 16),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )),
//                     GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const HabitCardsScreen(),
//                             ),
//                           );
//                         },
//                         child: Image.asset(
//                           'assets/Fitness/habitcards.png',
//                           fit: BoxFit.cover,
//                           height: 184,
//                         )),
//                   ],
//                 ),
//                 const SizedBox(height: 20),

//                 GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (_) => const BookClassScreen()));
//                     },
//                     child: Image.asset(
//                       "assets/Fitness/Group 48095513 (1).png",
//                       fit: BoxFit.cover,
//                       height: 205,
//                     )),
//                 const SizedBox(height: 10),

//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => const SubscriptionScreen()));
//                   },
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Image.asset(
//                       "assets/Fitness/subscription.png",
//                       fit: BoxFit.cover,
//                       height: 185,
//                       width: 170,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Start Assessment Button
//                 Constbutton(
//                   text: "Start Assessment",
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => BlocProvider(
//                           create: (_) => LifestyleBloc(LifestyleRepository())
//                             ..add(FetchLifestyleQuestions()),
//                           child: const LifestyleQuestionPage(),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_bloc.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_event.dart';
import 'package:my_app/presentation/pages/bookaclass/book_class_screen.dart';
import 'package:my_app/presentation/pages/habitcard/habit_cards_screen.dart';
import 'package:my_app/presentation/pages/lifestylequestionnaire/questionnaire_screen.dart';
import 'package:my_app/presentation/pages/mealplan/meal_plan_screen.dart';
import 'package:my_app/presentation/pages/pedometer/step_screen.dart';
import 'package:my_app/presentation/pages/subscription/subscripton_screen.dart';
import 'package:my_app/presentation/pages/workout/work_out_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';
import 'package:my_app/repositories/lifestyle_repository.dart';

class TransformScreen extends StatelessWidget {
  const TransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const StepTrackerHomePage()));
                    },
                    child: Image.asset('assets/Tranfrom/steptraker.png')),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MealPlanScreen()));
                    },
                    child: Image.asset("assets/Tranfrom/meals.png")),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HabitCardsScreen()));
                    },
                    child: Image.asset("assets/Tranfrom/habit.png")),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookClassScreen()));
                    },
                    child: Image.asset("assets/Tranfrom/fitenssclass.png")),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SubscriptionScreen()));
                    },
                    child: Image.asset("assets/Tranfrom/subscrtpiton.png")),
                const SizedBox(height: 20),
                //populr work outs
                const Text(
                  "Popular Workouts",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutScreen()));
                }, child: Image.asset("assets/Tranfrom/workouts.png",height: 168,)),
                const SizedBox(height: 10,),
                Constbutton(
                  text: "Start Assessment",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => LifestyleBloc(LifestyleRepository())
                            ..add(FetchLifestyleQuestions()),
                          child: const LifestyleQuestionPage(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
