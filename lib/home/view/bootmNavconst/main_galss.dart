
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:my_app/home/view/bootmNavconst/glass_image_box.dart';
import 'package:my_app/home/view/bootmNavconst/glasssbutoon.dart';

class Maingalssconatiner extends StatelessWidget {
  const Maingalssconatiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      border: 0.1,
      width: double.infinity,
      height: 1650,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Glassbutoon(
                  text: 'Badminton',
                ),
                Glassbutoon(
                  text: 'Swimming',
                ),
                Glassbutoon(
                  text: 'Table Tennis',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 15, bottom: 20, left: 10, right: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(
                    0.2), // semi-transparent background
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search,
                      color: Colors.white), // Search icon
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search for center near you',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GlassImageBox(
            image:
                "https://m.media-amazon.com/images/I/61trK3LjmWL.jpg",
          ),
          GlassImageBox(
            image:
                "https://assets.berlin2023.org/dims4/default/2cf396d/2147483647/strip/true/crop/2000x1125+0+152/resize/1067x600!/quality/90/?url=http%3A%2F%2Fberlin-2023-brightspot.s3.us-east-1.amazonaws.com%2F23%2Fb7%2Fa273084d46c28b4f99f948b5fbd4%2F465-3.jpg",
          ),
          GlassImageBox(
            image:
                "https://c4.wallpaperflare.com/wallpaper/314/62/482/field-abstraction-lights-the-ball-wallpaper-preview.jpg",
          ),
          GlassImageBox(
            image:
                "https://content.jdmagicbox.com/comp/def_content_category/table-tennis-clubs/4jgoqyrpdf-table-tennis-courts-1-aoyou-table-tennis-clubs-1-3bgut.jpg",
          ),
          ClipRRect(
            borderRadius:
                BorderRadius.circular(6), // Rounded corners
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10, sigmaY: 10), // Glass blur effect
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 77, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                      0.2), // Semi-transparent glass color
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Colors.white.withOpacity(
                          0.1)), // Border for glass effect
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Space between icon and text
                    Text(
                      "VIEW ALL CENTERS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios,
                        size: 20,
                        color:
                            Colors.white), // Icon in the center
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}