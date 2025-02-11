import 'package:flutter/material.dart';
import 'gym_detail_page.dart';

class FitnessPage extends StatelessWidget {
  const FitnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Container(color: Colors.green,height: 40,width: double.infinity,),
      // backgroundColor: const Color(0xff010A04),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.arrow_back_ios,
                      color: Colors.white), // Icon on the left
                  Spacer(), // Spacer to push text to the center
                  Text(
                    "Fitness",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: "Lufga",
                    ),
                  ),
                  Spacer(), // Spacer to ensure the text stays centered
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Newyearcards(startColor: Color(0xff7FFA88), endColor: Color(0xff244B27)),
              //liner conatner end//
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Center near you",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const GymLocationCards(),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Top rated centers",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TopRatedcentercards(),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Group Classes ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset("assets/Fitness/Group 118 (1).png"),
              const SizedBox(
                height: 16,
              ),
              Image.asset("assets/Fitness/Group 119.png"),
              const SizedBox(
                height: 16,
              ),
              Image.asset("assets/Fitness/Group 120.png"),
              const SizedBox(
                height: 16,
              ),
              Image.asset("assets/Fitness/Group 121.png"),
                const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// resuble cards 
class Newyearcards extends StatelessWidget {
  final Color startColor; // Start color for the gradient
  final Color endColor;   // End color for the gradient

  const Newyearcards({
    super.key,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            startColor, // Use parameterized color
            endColor,   // Use parameterized color
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background "2025" text
            Positioned(
              left: 10,
              bottom: -30,
              child: Text(
                '2025',
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.1),
                  fontFamily: "Lufga",
                ),
              ),
            ),

            // Woman with dumbbell image
            Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: 165,
                width: 151,
                child: Image.asset(
                  'assets/Fitness/unsplash_JtOxBIXI4Lw (1).png', // Replace with your image URL
                ),
              ),
            ),

            // Text content
            const Positioned(
              right: 20,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Year\nSale',
                    style: TextStyle(
                      fontSize: 36,
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Lorem ipsum dolor sit\namet consectetur.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      color: Colors.white70,
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



class TopRatedcenter extends StatelessWidget {
  final String imageid; // Declare imageid as a final property

  const TopRatedcenter({
    super.key,
    required this.imageid, // Mark imageid as required in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208,
      width: 265,
      child: Image.asset(
        imageid,
        // Ensure the image fits the container
      ),
    );
  }
}

class TopRatedcentercards extends StatelessWidget {
  TopRatedcentercards({super.key});
  final List<Map<String, String>> locations = [
    {
      'image': 'assets/Fitness/Group 123.png', // Replace with your image URLs
      // 'title': 'Be Fit, HSR Layout',
      // 'location': 'sector 6',
    },
    {
      'image': 'assets/Fitness/Group 125.png',
    },
    {
      'image': 'assets/Fitness/Group 124.png',
      // 'title': 'Be Fit, Indiranagar',
      // 'location': 'sector 8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208, // Adjust card height as needed

      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return TopRatedcenter(
            imageid: locations[index]['image']!,
          );
        },
      ),
    );
  }
}

//cards //

class GymLocationCards extends StatelessWidget {
  const GymLocationCards({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> locations = [
      {
        'image':
            'assets/Fitness/Rectangle 11.png', // Replace with your image URLs
        'title': 'Be Fit, HSR Layout',
        'location': 'sector 6',
      },
      {
        'image': 'assets/Fitness/Rectangle 11 (1).png',
        'title': 'Be Fit, Koramangala',
        'location': 'sector 7',
      },
      {
        'image': 'assets/Fitness/Rectangle 11.png',
        'title': 'Be Fit, Indiranagar',
        'location': 'sector 8',
      },
    ];

    return SizedBox(
      height: 160, // Adjust card height as needed

      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return GymLocationCard(
            imageUrl: locations[index]['image']!,
            title: locations[index]['title']!,
            location: locations[index]['location']!,
          );
        },
      ),
    );
  }
}

class GymLocationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;

  const GymLocationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 160, // Fixed width for each card
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),

          // Dark Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
                stops: const [0.4, 1.0],
              ),
            ),
          ),

          // Text Content
          Positioned(
            left: 10,
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Make card tappable
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GymDetailPage(
                      gymName: title,
                      price: 250,
                      distance: '2.3 KM',
                      location: 'HSR Layout',
                      timing: '05:30 AM - 10:00 PM',
                      rating: 4.2,
                      reviews: 151,
                      imageUrl: imageUrl,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
