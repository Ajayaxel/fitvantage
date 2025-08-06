import 'package:flutter/material.dart';

class BookingSucess extends StatelessWidget {
  const BookingSucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  automaticallyImplyLeading: false, // Removes the default back button
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.close, color: Colors.white, size: 28)),
    ),
  ],
),

      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child:
                    Icon(Icons.check_circle, color: Colors.green, size: 100)),
            SizedBox(
              height: 10,
            ),
            Text(
              "Evolve Yoga",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sun 14 Jul, 4:30-5:20 PM",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 20),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Vantage, V P Colony 7th Phase",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.alarm, color: Colors.greenAccent, size: 20),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Reach early. No entry post 5 mins of class start",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
