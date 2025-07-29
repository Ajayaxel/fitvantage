import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/mainpages/notifications/notification_screen.dart';
import 'package:my_app/presentation/pages/profilepages/profile_screen.dart';
import 'package:my_app/presentation/pages/vantagepass/vantage_pass.dart';
import 'package:my_app/presentation/widgets/shodow.dart';

class CaroselHome extends StatefulWidget {
  const CaroselHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
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

    // Scale factor based on screen width (design reference width is 390px)
    double scale = screenWidth / 390;

    return  Stack(
      
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
              padding: EdgeInsets.symmetric(horizontal: 16 * scale ,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  const ProfileScreen(
                                userName: "Ajay",
                              ),
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
                            size: 24 * scale,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 235 * scale),
    
                  // Stack to position shadow behind text
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Shadow positioned behind the text
                      Positioned(
                        child: ShadowClone(
                          width: double.infinity,
                          height: 200 * scale,
                          shadowColor: const Color(0xff010A04),
                        ),
                      ),
                      // Text content on top of shadow
                      Column(
                        children: [
                          Text(
                            "New Year",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 46 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            indent: 70 * scale,
                            endIndent: 70 * scale,
                            color: const Color(0xff7FFA88),
                            thickness: 2,
                          ),
                          Text(
                            "Sale",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 46 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            indent: 70 * scale,
                            endIndent: 70 * scale,
                            color: const Color(0xff7FFA88),
                            thickness: 2,
                          ),
                          SizedBox(height: 17 * scale),
                          Text(
                            "Lorem ipsum dolor sit amet consectetur.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 17 * scale),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff262525),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 30 * scale,
                                vertical: 15 * scale,
                              ),
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
                                fontSize: 15 * scale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
    
                  const SizedBox(height: 25),
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
    return Column(
      children: [
        Container(
          height: screenHeight * 0.6,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}