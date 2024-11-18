import 'package:flutter/material.dart';
import 'package:my_app/home/view/bootmNav/transformconst/google_riview_cards.dart';
import 'package:my_app/home/view/bootmNav/transformconst/pages/atcenteconst/caroule_page.dart';
import 'package:my_app/home/view/bootmNav/transformconst/pages/atcenteconst/time_lineitms.dart';
import 'package:my_app/home/view/bootmNav/transformconst/pages/atcenteconst/week_snapshot.dart';

class AtCenterpage extends StatelessWidget {
  const AtCenterpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Why join the bootcamp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.group, color: Colors.white, size: 30),
                      SizedBox(height: 8),
                      Text(
                        "Fun small group\nworkouts",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restaurant_menu,
                          color: Colors.white, size: 30),
                      SizedBox(height: 8),
                      Text(
                        "Easy-to-follow\nmeal plan",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, color: Colors.white, size: 30),
                      SizedBox(height: 8),
                      Text(
                        "Engaging WhatsApp\ncommunity",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Divider with Text
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.white)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "How it works",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Expanded(child: Divider(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 16),
            // Timeline Section
            Column(
              children: [
                TimelineItem(
                  icon: Icons.fitness_center,
                  title:
                      "Small group workouts with personalised trainer attention",
                  image:
                      "https://www.foodinfotech.com/wp-content/uploads/2023/10/Nutritional-Analysis-of-Food.jpg", // Add an asset image path
                ),
                TimelineItem(
                  icon: Icons.local_dining,
                  title:
                      "1:1 Nutrition coaching & personalised homely meal plans",
                  image:
                      "https://www.foodinfotech.com/wp-content/uploads/2023/10/Nutritional-Analysis-of-Food.jpg", // Add an asset image path
                ),
                TimelineItem(
                  icon: Icons.local_dining,
                  title:
                      "1:1 Nutrition coaching & personalised homely meal plans",
                  image:
                      "https://www.foodinfotech.com/wp-content/uploads/2023/10/Nutritional-Analysis-of-Food.jpg", // Add an asset image path
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Footer Section
            const Text(
              "Expect to lose up to 5 kgs in 6 weeks",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 16),
            CarouselScreen(),
            WeekSnapshotScreen(),
            ReviewScreen(),
          ],
        ),
      ),
    );
  }
}

