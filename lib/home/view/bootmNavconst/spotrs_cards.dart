import 'package:flutter/material.dart';

class SportCard extends StatelessWidget {
  // final String title;
  // final String subtitle;
  final String imagePath;

  const SportCard({super.key, 
    // required this.title,
    // required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 280,
      
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   title,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 5),
                  // Text(
                  //   subtitle,
                  //   style: TextStyle(
                  //     color: Colors.white70,
                  //     fontSize: 14,
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Define your button action
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white.withOpacity(0.3),
                  //   ),
                  //   child: Text(
                  //     'EXPLORE',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}