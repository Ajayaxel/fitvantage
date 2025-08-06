import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/bookapponitemnts/yoga.dart';

class BookAppoinment extends StatefulWidget {
  const BookAppoinment({super.key});

  @override
  State<BookAppoinment> createState() => _BookAppoinmentState();
}

class _BookAppoinmentState extends State<BookAppoinment> {
  int selectedDay = 2; // Tuesday selected (0-based index)
  final List<String> days = ['S', 'M', 'T', 'W'];
  final List<String> dates = ['05', '06', '07', '08'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Date Selector
            _buildDateSelector(),
            const Divider(color: Color(0xff363636),),
            
            // Filter Tags
            _buildFilterTags(),
            
            // Workout List
            Expanded(
              child: _buildWorkoutList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
               GestureDetector(
                 onTap: () => Navigator.pop(context),
                 child: const Icon(
                               Icons.arrow_back_ios,
                               color: Colors.white,
                               size: 20,
                             ),
               ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xff161816),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Bur Dubai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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

  Widget _buildDateSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ...List.generate(4, (index) {
            final isSelected = index == selectedDay;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDay = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: index < 3 ? 8 : 0),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xff161816) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        days[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dates[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.wb_sunny_outlined, color: Colors.white70, size: 20),
                const SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.nightlight_round,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTags() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          _buildFilterTag('Dance', true),
          const SizedBox(width: 12),
          _buildFilterTag('Strength', false),
          const SizedBox(width: 12),
          _buildFilterTag('Burn', false),
        ],
      ),
    );
  }

  Widget _buildFilterTag(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
       border: Border.all(color: const Color(0xff161816)),
       borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.add,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildWorkoutCard(
          time: '4:30 PM',
          location: 'Vantage, V P Colony 7th Phase',
          type: 'EVOLVE YOGA',
          type2: 'EVOLVE YOGA',
          venue: 'Vantage Bur Dubai',
        ),
        const SizedBox(height: 16),
        _buildWorkoutCard(
          type2: 'Heavy Workout',
          time: '5:30 PM',
          location: 'Vantage, Hilal Colony 7th Phase',
          type: 'Heavy Workout',
          venue: 'Vantage Bur Dubai',
        ),
        const SizedBox(height: 16),
        _buildWorkoutCard(
          type2: 'workout',
          time: '',
          location: '',
          type: 'DANCE FITNESS',
          venue: 'Vantage Bur Dubai',
        ),
        const SizedBox(height: 16),
        _buildWorkoutCard(
          type2: 'workout2',
          time: '',
          location: '',
          type: 'DANCE FITNESS',
          venue: 'Vantage Bur Dubai',
        ),
      ],
    );
  }

  Widget _buildWorkoutCard({
    required String time,
    required String location,
    required String type,
      required String venue,
      required String type2,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff161816)),
        
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (time.isNotEmpty) ...[
            Row(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
          Center(
            child: GestureDetector(
              onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const YogaDetailPage()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3C),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              venue,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF3A3A3C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                type2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}