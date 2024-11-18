
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatelessWidget {
  // List of images with URLs and corresponding text
  final List<Map<String, String>> images = [
    {
      "image": "https://www.shutterstock.com/image-photo/active-couple-doing-elbowknee-warm-600nw-2454586895.jpg",
      "text": "First Image Description"
    },
    {
      "image": "https://www.shutterstock.com/image-photo/active-couple-doing-elbowknee-warm-600nw-2454586895.jpg",
      "text": "Second Image Description"
    },
    {
      "image": "https://www.shutterstock.com/image-photo/active-couple-doing-elbowknee-warm-600nw-2454586895.jpg",
      "text": "Third Image Description"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set a fixed height for the carousel
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: images.map((item) => buildCarouselItem(item)).toList(),
      ),
    );
  }

  Widget buildCarouselItem(Map<String, String> item) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            item["image"]!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(Icons.error, color: Colors.red, size: 50),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              item["text"]!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}


