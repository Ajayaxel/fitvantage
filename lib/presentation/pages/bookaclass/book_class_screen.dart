import 'package:flutter/material.dart';

class BookClassScreen extends StatelessWidget {
  const BookClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dates = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    final dateNumbers = ['05', '06', '07', '08', '09', '10', '11'];
    const selectedDateIndex = 5;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFF1161816),
                      child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    ),
                  ),
                  const Column(
                    children: [
                      Text("Book a Class",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_pin,
                              color: Color(0xFF7FFA88), size: 16),
                          SizedBox(width: 4),
                          Text("Daman Street",
                              style: TextStyle(
                                  color: Color(0xFF7FFA88),
                                  fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Color(0xFF1161816),
                    child: Icon(Icons.notifications, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Date Selector
              Container(
                height: 112,
                decoration: BoxDecoration(
                  color: const Color(0xFF1161816),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedDateIndex;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dates[index],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.grey[700]
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Text(dateNumbers[index],
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey[600],
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Filter Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFilterButton('Class'),
                  _buildFilterButton('Time', icon: Icons.access_time),
                  _buildFilterButton('Distance'),
                ],
              ),
              const SizedBox(height: 16),
              // Class Cards
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _buildClassCard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String title, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1161816),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: Colors.white, size: 16),
          if (icon != null) const SizedBox(width: 6),
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
        ],
      ),
    );
  }

  Widget _buildClassCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/Fitness/bookclass.png', // Add your own image in assets
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 14),
                  SizedBox(width: 4),
                  Text("4.8",
                      style: TextStyle(color: Colors.white, fontSize: 12))
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 12,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Riverside Yoga",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_pin,
                        color: Color(0xFF00FF57), size: 14),
                    SizedBox(width: 4),
                    Text("21 Km away",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xff7FFA88),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: [
                  const Text("Booking",
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text("120",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
