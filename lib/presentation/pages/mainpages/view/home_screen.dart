import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/bookapponitemnts/book_appoinment.dart';
import 'package:my_app/presentation/pages/chat/chat_screen.dart';
import 'package:my_app/presentation/widgets/homewidegt/caroulse.dart';

import 'package:my_app/presentation/widgets/homewidegt/fitnesscard.dart';
import 'package:my_app/presentation/widgets/homewidegt/programcards.dart';
import 'package:my_app/presentation/widgets/homewidegt/service_category.dart';
import 'package:my_app/presentation/widgets/homewidegt/testi_monial_cards.dart';
import 'package:my_app/presentation/widgets/homewidegt/user_stories_screeen.dart';

class HomeScreen extends StatelessWidget {
  // final UserModel? user;
  final List<String> images = [
    "assets/Homeimages/Group 166 (1).png",
    "assets/Homeimages/Group 167 (3).png",
  ];
  HomeScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.8, // 70% of screen height
              child: const CaroselHome(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Service Category",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const ServiceCategoryWidget(),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Our Programs",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const ProgramsSection(),
                  const SizedBox(
                    height: 16,
                  ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen()));
                    },
                    child: Image.asset(
                      "assets/Homeimages/call.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 138,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Explore Format workouts",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/Homeimages/Group 162.png",
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                      Image.asset(
                        "assets/Homeimages/Group 163.png",
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                      Image.asset(
                        "assets/Homeimages/Group 164.png",
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Explore Sports Format ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                            height: 100,
                            width: 191,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "User Stories",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SuccessCarousel(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      "Reviews",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
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
              height: 20,
            ),

            // const ChoosePlanPage()
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF173F24), // dark green
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.flash_on, color: Colors.white),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1/3",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "This Week Activity",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BookAppoinment(),
                        ),
                      );
                    },
                    child: const Text(
                      "BOOK",
                      style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
