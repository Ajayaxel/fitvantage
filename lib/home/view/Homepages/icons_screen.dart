import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_app/videocall/videocall.dart';

class IconsScreen extends StatefulWidget {
  @override
  _IconsScreenState createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Data for categories
  final Map<String, List<Map<String, dynamic>>> _categories = {
    'Fitness': [
      {'icon': Icons.videocam, 'label': 'At Home', 'page': VideocallScreen()},
      {
        'icon': Icons.group,
        'label': 'At Center',
      },
      {
        'icon': Icons.person,
        'label': 'My Profile',
      },
      {
        'icon': Icons.apple,
        'label': 'Weight Loss',
      },
    ],
    'Sports': [
      {'icon': Icons.sports, 'label': 'Badminton'},
      {
        'icon': Icons.pool,
        'label': 'Swimming',
      },
      {
        'icon': Icons.sports_tennis,
        'label': 'Table Tennis',
      },
      {
        'icon': Icons.work_history,
        'label': 'testing',
      },
    ],
    'Fitness Store': [
      {'icon': Icons.checkroom, 'label': 'Apparel'},
      {'icon': Icons.directions_run, 'label': 'Footwear'},
      {'icon': Icons.watch, 'label': 'Accessories'},
      {'icon': Icons.smartphone, 'label': 'Smartwatch'},
      {'icon': Icons.fitness_center, 'label': 'Treadmill'},
      {'icon': Icons.directions_bike, 'label': 'Exercise Bike'},
      {'icon': Icons.spa, 'label': 'Massagers'},
      {'icon': Icons.fitness_center, 'label': 'Dumbbell'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Filter items based on search query
    final filteredCategories = _categories.map((category, items) {
      final filteredItems = items
          .where((item) =>
              item['label'].toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
      return MapEntry(category, filteredItems);
    });

    return Scaffold(
      backgroundColor: Color(0xff7FFA88),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Backgrounds/Explore Screen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blurred Layer
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // Foreground Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.white),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              setState(() {
                                _searchQuery = value;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Find workouts, centers and more',
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Display Categories and Items
                  ...filteredCategories.entries.map((entry) {
                    final title = entry.key;
                    final items = entry.value;

                    // Only show sections with items matching the search query
                    if (items.isEmpty) return SizedBox();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCategorySection(title, items),
                        const SizedBox(height: 25),
                      ],
                    );
                  }).toList(),
                  
                   GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                     child: Padding(
                       padding: const EdgeInsets.all(40),
                       child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          radius: 30,
                          child: Icon(Icons.close, color: Colors.white, size: 28),
                        ),
                     ),
                   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategorySection(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 5,
          runSpacing: 20,
          children: items.map((item) {
            return GestureDetector(
              onTap: () {
                // Navigate to the page associated with the icon
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']),
                );
              },
              child: Container(
                width: 80,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      radius: 30,
                      child: Icon(item['icon'], color: Colors.white, size: 28),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['label'],
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Sample pages for navigation

