import 'dart:async'; // Add this import for Timer
import 'package:flutter/material.dart';
import 'package:my_app/presentation/widgets/const_button.dart';

class GymDetailPage extends StatefulWidget {
  final String gymName;
  final double price;
  final String distance;
  final String location;
  final String timing;
  final double rating;
  final int reviews;
  final List<String> carouselImages;

  const GymDetailPage({
    super.key,
    required this.gymName,
    required this.price,
    required this.distance,
    required this.location,
    required this.timing,
    required this.rating,
    required this.reviews,
    required this.carouselImages,
  });

  @override
  State<GymDetailPage> createState() => _GymDetailPageState();
}

class _GymDetailPageState extends State<GymDetailPage> {
  late final PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Auto-scroll every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.carouselImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-width image carousel with PageController
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.carouselImages.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.carouselImages[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
              onPageChanged: (index) {
                _currentPage = index;
              },
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
            minChildSize: 0.4,
            maxChildSize: 0.7,
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
                              widget.gymName,
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
                                  '\$${widget.price}',
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
                                    '${widget.distance} - ${widget.location}',
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
                                    'Gym Timing : ${widget.timing}',
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
                                    '${widget.rating} Rating - ${widget.reviews} Reviews',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height:50),
                        Constbutton(
                          onTap: () {
                            // Start workout logic
                          },
                          text: 'Start Workout',
                        ),
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


