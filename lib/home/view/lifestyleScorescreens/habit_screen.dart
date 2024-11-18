import 'package:flutter/material.dart';
import 'package:my_app/home/view/bootmNav/bottm_nav.dart';
import 'package:my_app/home/view/bootmNav/transform_screen.dart';
import 'package:my_app/home/view/bootmNav/transformconst/pages/page_controler.dart';
import 'package:my_app/home/view/lifestyleScorescreens/habit_tab_screen.dart';
import 'package:my_app/home/view/lifestyleScorescreens/lifestyle_tabs_screen.dart';
import 'package:my_app/home/view/lifestyleScorescreens/outcome_screen.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            // Custom back button using the 'leading' property
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),  // Change this to any icon you like
              onPressed: () {
                      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottmNav()),
              );
                  // Navigates back to the previous screen
              },
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 36, 132, 158), // Start color
                    Colors.teal, // End color
                  ],
                ),
              ),
            ),
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.yellow,
              tabs: [
                Tab(text: 'HABITS'),
                Tab(text: 'OUTCOMES'),
                Tab(text: 'LIFESTYLE SCORE'),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                Colors.teal,
                Color(0xff2F4A5F), // End color
              ],
            ),
          ),
          child: TabBarView(
            children: [
              HabitsTab(),
              OutcomeScreen(),
              LifestyleScoreTab(),
            ],
          ),
        ),
      ),
    );
  }
}

