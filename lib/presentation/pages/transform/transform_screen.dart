import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/habitcard/habit_cards_screen.dart';
import 'package:my_app/presentation/pages/mealplan/meal_plan_screen.dart';

class TransformScreen extends StatelessWidget {
  const TransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Row - Weight Loss & Talk To Us
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weight Loss",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "TALK TO US",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Main image with model
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/Tranfrom/tranform.png", // Replace with your image
                    fit: BoxFit.cover,
                    height: 484,
                  ),
                  Positioned(
                    bottom: 5,
                    child: Column(
                      children: [
                        const Text(
                          "Fit Start at",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Vantage",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Lorem ipsum dolor sit amet consectetur.",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff262525),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                          ),
                          child: const Text(
                            "EXPLORE VANTAGE PASS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      endIndent: 8,
                      indent: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "WHAT YOU GET",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      endIndent: 16,
                      indent: 8,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const FitnessRightCard(image: "assets/Tranfrom/overlpaimg1.png", title: "Fitness"),
              const NutritionExpertCard(),
              const FitnessRightCard(image: "assets/Tranfrom/mindset.png", title: "Mindset"),
              const MealsPlanCard(),
              const SizedBox(height: 20,),
              const MemberTransformCarousel(),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

class FitnessRightCard extends StatelessWidget {
  const FitnessRightCard({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.only(top: 16, left: 16,bottom: 16,right: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Left text section
            SizedBox(
              width: screenWidth * double.infinity, // responsive text width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Expert",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.7),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // Right side image overlapping
            Positioned(
              right: 0,
              top: -40, // makes image go outside the top box
              child: Image.asset(
                image,
                height: screenWidth * 0.4, // responsive image size
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NutritionExpertCard extends StatelessWidget {
  const NutritionExpertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 194, // ✅ Fixed height
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image section
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.28, // ✅ Responsive width
              child: Image.asset(
                "assets/Tranfrom/trainer.png",
                height: 180, // ✅ Fits in 194 height
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),

            // Text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center, // ✅ Center vertically
                children: [
                  const Text(
                    "Nutrition",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Expert",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    // ✅ Prevents overflow
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis, // ✅ Cut overflow text
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MealsPlanCard extends StatelessWidget {
  const MealsPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: screenWidth * 0.9,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left image
            Expanded(
              flex: 3,
              child: Image.asset(
                "assets/Tranfrom/mealsposter.png", // replace with your image
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 16),

            // Right text and button
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Meals Plan Everyday",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Lorem Ipsum is simply dummy text",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Divider
                  const Divider(
                    height: 1,
                    color: Color(0xff48586F)
                  ),

                  const SizedBox(height: 12),

                  // Create Now Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MealPlanScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7FFA88),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Create Now",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_outward_rounded,
                            size: 18,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class MemberTransformCarousel extends StatefulWidget {
  const MemberTransformCarousel({super.key});

  @override
  State<MemberTransformCarousel> createState() =>
      _MemberTransformCarouselState();
}

class _MemberTransformCarouselState extends State<MemberTransformCarousel> {
  int _currentIndex = 0;

  final List<Map<String, String>> items = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCJOxssU3TRhutaiO3s3733_IH4YHOdCS6hg&s",
      "title": "Andrea lost 11 kg & gradually improved his foo..."
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsN5yVbE4fdTN_hCCY2W5yW5kHxOeVLRn_KriOpbJ7_a_HjIbEOQMNsvYpJcGVi5rUYso&usqp=CAU",
      "title": "John transformed his life with healthy habits..."
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCJOxssU3TRhutaiO3s3733_IH4YHOdCS6hg&s",
      "title": "Sophie gained strength & confidence..."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          "See the Vantage\nMember’s Transform",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),

        CarouselSlider.builder(
          itemCount: items.length,
          options: CarouselOptions(
            height: 420, // fixed height for all cards
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final item = items[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
             border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image section
                  Expanded(
                    flex: 6,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.network(
                            item["image"]!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          right: 12,
                          bottom: 75,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black54,
                            child: Icon(Icons.play_arrow, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text section
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item["title"]!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "WATCH NOW",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 15),

        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.asMap().entries.map((entry) {
            return Container(
              width: _currentIndex == entry.key ? 20 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentIndex == entry.key
                    ? Colors.white
                    : Colors.white.withOpacity(0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
