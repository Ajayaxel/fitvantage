
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/mainpages/view/consts/categorie_boxes.dart';
import 'package:my_app/mainpages/view/consts/cutsom_carousel.dart';
import 'package:my_app/mainpages/view/consts/program_cards.dart';

import 'package:my_app/mainpages/notifications/notification_screen.dart';
import 'package:my_app/mainpages/view/consts/sports_cards.dart';
import 'package:my_app/mainpages/view/consts/workout_poster.dart';
import 'package:my_app/mainpages/view/fitness_screen.dart';
import 'package:my_app/profilepages/view/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> carouselItems = [
    {
      'startColor': const Color(0xff4A90E2),
      'endColor': const Color(0xff50E3C2),
      'imagePath': 'assets/Fitness/unsplash_JtOxBIXI4Lw (1).png',
      'bgtext': '2025',
      'title': 'New Year\nSale',
      'subtitle': 'Lorem ipsum dolor sit\namet consectetur.',
    },
    {
      'startColor': const Color(0xffFA7F7F),
      'endColor': const Color(0xffFFD400),
      'imagePath': 'assets/Fitness/unsplash_JtOxBIXI4Lw (1).png',
      'bgtext': '2025',
      'title': 'New Year\nSale',
      'subtitle': 'Lorem ipsum dolor sit\namet consectetur.',
    },
    {
      'startColor': const Color(0xff4A90E2),
      'endColor': const Color(0xff50E3C2),
      'imagePath': 'assets/Fitness/unsplash_JtOxBIXI4Lw (1).png',
      'bgtext': '2025',
      'title': 'New Year\nSale',
      'subtitle': 'Lorem ipsum dolor sit\namet consectetur.',
    },
    {
      'startColor': const Color(0xff4A90E2),
      'endColor': const Color(0xff50E3C2),
      'imagePath': 'assets/Fitness/unsplash_JtOxBIXI4Lw (1).png',
      'bgtext': '2025',
      'title': 'New Year\nSale',
      'subtitle': 'Lorem ipsum dolor sit\namet consectetur.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color(0xff7FFA88),
                      radius: 18,
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 34,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, Mishal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "19 dec 2024",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    ),
                    child:
                        const Icon(Icons.notification_add, color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 17),

            // **Carousel Section**
            customCards(),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                carouselItems.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            // **Carousel end**

            HorizontalCategoryCards(),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text("Our Programs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            //programs cards sections
            ProgramCards(
              image: 'assets/Homeimages/proposter1.png',
              title: 'Massive Upper body',
              subtitle: '7 Week . 5x/week',
            ),
            ProgramCards(
              image: 'assets/Homeimages/Rectangle 4 (1).png',
              title: 'Massive Upper body',
              subtitle: '7 Week . 5x/week',
            ),
            ProgramCards(
              image: 'assets/Homeimages/Rectangle 5 (1).png',
              title: 'Massive Upper body',
              subtitle: '7 Week . 5x/week',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text("Center near you",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          
            const Padding(
              padding: EdgeInsets.only(left: 16 , top: 15),
              child: GymLocationCards(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16 , top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Explore Format workouts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            WorkoutPoster(),
                        const Padding(
              padding: EdgeInsets.only(left: 16, right: 16 , top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Explore Sports Format ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            SportsCards(),
            const SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }

  CarouselSlider customCards() {
    return CarouselSlider(
      items: carouselItems.map((item) {
        return Caruslecards(
          startColor: item['startColor'],
          endColor: item['endColor'],
          imagePath: item['imagePath'],
          bgtext: item['bgtext'],
          title: item['title'],
          subtitle: item['subtitle'],
        );
      }).toList(),
      options: CarouselOptions(
        height: 161,
        autoPlay: true,
        enlargeCenterPage: false, // Full-width mode
        viewportFraction: 1.0, // Takes full width
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
