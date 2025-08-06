import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_bloc.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_event.dart';
import 'package:my_app/presentation/myworkout/my_workout_screen.dart';
import 'package:my_app/presentation/pages/bookaclass/book_class_screen.dart';
import 'package:my_app/presentation/pages/habitcard/habit_cards_screen.dart';
import 'package:my_app/presentation/pages/lifestylequestionnaire/questionnaire_screen.dart';
import 'package:my_app/presentation/pages/mealplan/ai_meals_screen.dart';
import 'package:my_app/presentation/pages/pedometer/step_screen.dart';
import 'package:my_app/presentation/pages/quiklinks/help_support.dart';
import 'package:my_app/presentation/pages/quiklinks/terms_and_condition.dart';
import 'package:my_app/presentation/pages/subscription/subscripton_screen.dart';
import 'package:my_app/presentation/pages/workout/work_out_screen.dart';
import 'package:my_app/presentation/widgets/const_button.dart';
import 'package:my_app/presentation/widgets/homewidegt/fitnesscard.dart';
import 'package:my_app/presentation/widgets/homewidegt/testi_monial_cards.dart';
import 'package:my_app/repositories/lifestyle_repository.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({super.key});

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  bool isAtHome = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Background Image and Quote Only for AT CENTER
            if (!isAtHome)
              Stack(
                children: [
                  Image.asset(
                    'assets/Athome/atcenterBg.png',
                    width: double.infinity,
                    height: 570,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Fitness",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

                        _buildTabBar(), // Keep tabs same in both views

                        const SizedBox(height: 150),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.center,
                            'A little progress each\nday adds up to big\nresults.',
                            style: TextStyle(
                              fontSize: 27,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff262525),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text(
                              'EXPLORE GYMS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            else
              // Keep tabs visible even in AT HOME
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Fitness",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildTabBar(),
                  ],
                ),
              ),

            // Main content changes based on selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: isAtHome
                  ? const AtHomeContent()
                  : AtCenterContent(screenWidth: screenWidth),
            ),
          ],
        ),
      ),
    );
  }

  // Separated out for consistency
  Widget _buildTabBar() {
    return Row(
      children: [
        _tabButton("AT CENTER", !isAtHome, () {
          setState(() {
            isAtHome = false;
          });
        }),
        const SizedBox(width: 10),
        _tabButton("AT HOME", isAtHome, () {
          setState(() {
            isAtHome = true;
          });
        }),
      ],
    );
  }

  // Tab Button Widget
  Widget _tabButton(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? Colors.white : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.white54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class AtCenterContent extends StatelessWidget {
  final double screenWidth;
  const AtCenterContent({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "Center near you  Dubai",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 24,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 24,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const FitnessCard(),
        const SizedBox(height: 12),
        const Text(
          "Your Smart Workout Plan",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white24),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // Text & Button
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today’s\nworkout plan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyWorkoutScreen()),
                        );
                      },
                      icon: const Icon(Icons.arrow_outward,
                          color: Colors.black, size: 18),
                      label: const Text(
                        "View Now",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5DF78D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/Fitness/iPhone 15.png',
                height: 150,
                width: screenWidth * 0.4,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookClassScreen()));
            },
            child: Image.asset("assets/Tranfrom/fitenssclass.png")),
        const SizedBox(
          height: 12,
        ),
        const Center(
          child: Text(
            "Testimonials",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: TestimonialContainer(),
              );
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 160,
          decoration: BoxDecoration(
            color: const Color(0xff1A1A1A),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "quick links",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HelpSupport()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Help & Support",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12)
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TermsAndConditionScreen()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Terms and Conditions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AtHomeContent extends StatelessWidget {
  const AtHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Today’s Workouts",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StepTrackerHomePage()));
            },
            child: Image.asset('assets/Tranfrom/steptraker.png')),
        const SizedBox(height: 20),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AiMealsScreen()));
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
                      builder: (context) => const SubscriptionScreen()));
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

        const SizedBox(
          height: 20,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WorkoutScreen()));
            },
            child: Image.asset(
              "assets/Tranfrom/workouts.png",
              height: 168,
            )),
        const SizedBox(height: 25),
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
        const SizedBox(height: 25),
      ],
    );
  }
}
