import 'package:flutter/material.dart';
import 'package:my_app/constsatnce/const_button.dart';

class GymDetailPage extends StatelessWidget {
  final String gymName;
  final double price;
  final String distance;
  final String location;
  final String timing;
  final double rating;
  final int reviews;
  final String imageUrl;

  const GymDetailPage({
    Key? key,
    required this.gymName,
    required this.price,
    required this.distance,
    required this.location,
    required this.timing,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Back Button
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Content
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              gymName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$$price',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  '/per month',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const Text(
                                  'onwards',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(
                                    '$distance - $location',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward, color: Colors.white),
                                ],
                              ),
                              const Divider(color: Colors.grey, height: 30),
                              Row(
                                children: [
                                  const Icon(Icons.access_time, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Gym Timing : $timing',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.grey, height: 30),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(
                                    '$rating Rating - $reviews Reviews',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                       Constbutton(onTap: () {
                        //  Navigator.push(
                        //    context,
                        //    MaterialPageRoute(
                        //      builder: (context) => null(),
                        //    ),
                        //  );
                       }, text: 'Start Workout',),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
