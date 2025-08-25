import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/mainpages/notifications/notification_screen.dart';
import 'package:my_app/presentation/pages/profilepages/profile_screen.dart';
import 'package:my_app/presentation/pages/vantagepass/vantage_pass.dart';


class CaroselHome extends StatefulWidget {
  const CaroselHome({super.key});

  @override
  _CaroselHomeState createState() => _CaroselHomeState();
}

class _CaroselHomeState extends State<CaroselHome> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<String> images = [
    "assets/Homeimages/Rectangle 33.png",
    "assets/Homeimages/Rectangle 33.png",
    "assets/Homeimages/Rectangle 33.png",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Base scale from width (390px design reference)
    double scale = screenWidth / 390;

    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: images.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return buildPage(images[index], screenHeight);
          },
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * scale),
            child: Column(
              children: [
                // Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: Image.asset(
                        "assets/Homeimages/profile.png",
                        fit: BoxFit.cover,
                        height: 36 * scale,
                        width: 36 * scale,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 18 * scale,
                        backgroundColor: const Color(0xff272727),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 22 * scale,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                    height: screenHeight *
                        0.22), // ✅ dynamic instead of 235 * scale

                // Shadow + Text
                Column(
                  children: [
                    Column(
                      children: [
                        FittedBox(
                          child: Text(
                            "New Year",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 46 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          indent: screenWidth * 0.18,
                          endIndent: screenWidth * 0.18,
                          color: const Color(0xff7FFA88),
                          thickness: 2,
                        ),
                        FittedBox(
                          child: Text(
                            "Sale",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 46 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          indent: screenWidth * 0.18,
                          endIndent: screenWidth * 0.18,
                          color: const Color(0xff7FFA88),
                          thickness: 2,
                        ),
                        SizedBox(height: 25 * scale),
                        Text(
                          "Lorem ipsum dolor sit amet consectetur.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15 * scale,
                          ),
                        ),
                        SizedBox(height: 32 * scale),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff262525),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 28 * scale,
                              vertical: 12 * scale,
                            ),
                            minimumSize: const Size(140, 40), // ✅ prevents too small
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5 * scale),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VantagePass(),
                              ),
                            );
                          },
                          child: Text(
                            "EXPLORE NOW",
                            style: TextStyle(
                              fontSize: 14 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.03),

                // Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4 * scale),
                      width: _currentPage == index ? 12 * scale : 8 * scale,
                      height: _currentPage == index ? 12 * scale : 8 * scale,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white54,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPage(String image, double screenHeight) {
    return Container(
      height: screenHeight * 0.6,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
