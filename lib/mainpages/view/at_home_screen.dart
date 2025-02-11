import 'package:flutter/material.dart';
import 'package:my_app/mainpages/view/fitness_screen.dart';

class AtHomeScreen extends StatelessWidget {
  const AtHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                SizedBox(
                  height: 25,
                ),
                Newyearcards(
                  startColor: Color(0xffAE7FFA),
                  endColor: Color(0xff5E0D61),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Now Live",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text("See All",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_forward, size: 21, color: Colors.white)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                VideoCards(
                  imageUrl: 'assets/Athome/Rectangle 31.png',
                  title: 'Navmi . Intermediate . 30 min',
                  subheading: 'Cardio Heat', // Dynamic subheading
                ),
                SizedBox(
                  height: 16,
                ),
                VideoCards(
                  imageUrl: 'assets/Athome/Rectangle 31 (1).png',
                  title: 'Alisa . Beginner . 45 min',
                  subheading: 'Dance Fitness', // Dynamic subheading
                ),
                 SizedBox(
                  height: 16,
                ),
                VideoCards(
                  imageUrl: 'assets/Athome/Rectangle 31 (2).png',
                  title: 'Shwetha . Intermediate . 1 hr ',
                  subheading: 'Hatha yoga', // Dynamic subheading
                ),
              ],
            ),
          )),
    );
  }
}

class VideoCards extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String subheading;
  const VideoCards({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.subheading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover, // Ensures the image covers the entire container
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.end, // Aligns the text to the bottom
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w200,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subheading,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 48,
                  width: 48,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
