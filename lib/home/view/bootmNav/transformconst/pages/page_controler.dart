import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth/view/LifestyleQuestioner/Constants/backround_image.dart';
import 'package:my_app/home/view/bootmNav/transform_screen.dart';
import 'package:my_app/home/view/bootmNav/transformconst/pages/at_center.dart';
import 'package:my_app/home/view/bootmNav/transformconst/pages/at_home.dart';
import 'package:my_app/home/view/lifestyleScorescreens/habit_screen.dart';

class TransfromController extends StatelessWidget {
  const TransfromController({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              // Background image
              BackgroundImage(),
          
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    floating: true,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(),

                    // TabBar with 3 tabs
                    bottom: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(text: 'AT-HOME'),
                        Tab(text: 'TRANSFORM'),
                        Tab(text: 'AT-CENTRE'),
                      ],
                    ),
                  ),

                  // TabBarView containing pages for each tab
                  SliverFillRemaining(
                    child: TabBarView(
                      children: [
                        AtHomePage(),
                        TransformScreen(),
                        AtCenterpage(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
