import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/profilepages/profile_setting.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010A04),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const ProfileSetting(),
                      ));
                    },
                    child: const Icon(Icons.menu, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Good morning",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Text(
                "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Workout Progress Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff171917),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage(
                          'assets/Homeimages/profile.png'), // Replace with actual image
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Workout Progress',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '12 exercise left',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    _buildCircularProgress(0.65),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Today's Activity Section
              const Text(
                "Today's Activity",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildActivityCard("Push-ups", "15 x3", true),
                  const SizedBox(width: 8),
                  _buildActivityCard("Pull-ups", "15 x3", false),
                  const SizedBox(width: 8),
                  _buildActivityCard("Bench presses", "15 x3", false),
                ],
              ),

              const SizedBox(height: 24),

              // Overall Status Section
              const Text(
                "Overall Status",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 16),
              _buildStatusCard("Calorie loss", "12.181%", 0.65,
                  "assets/Athome/Rectangle 22527.png"),
              _buildStatusCard("Weight loss", "12.181%", 0.65,
                  "assets/Athome/Rectangle 22527.png"),
              _buildStatusCard("Calorie loss", "12.181%", 0.65,
                  "assets/Athome/Rectangle 22527.png"),
              _buildStatusCard("Calorie loss", "12.181%", 0.65,
                  "assets/Athome/Rectangle 22527.png"),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildActivityCard(String title, String reps, bool isActive) {
  return Expanded(
    child: AspectRatio( // keeps same width : height ratio
      aspectRatio: 1 / 1.2, // tweak this to get desired shape
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF7FFA88) : const Color(0xff1B1C1B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center,
              color: isActive ? Colors.black : Colors.white,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              reps,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildStatusCard(
      String title, String value, double progress, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff161816),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('${(progress * 100).toInt()}%',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: Colors.black,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFF7FFA88)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgress(double progress) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            backgroundColor: Colors.black,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7FFA88)),
            strokeWidth: 4,
          ),
          Text(
            '${(progress * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}