import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OutcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              AlertBox(),
              const SizedBox(height: 20),
              WeightInfoSection(),
              const SizedBox(height: 20),
              WeightChart(),
              const SizedBox(height: 20),
              BmiIndicator(),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 40),
              // Set height constraint for FutureYouScreen
              FutureYouScreen(),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.warning, color: Colors.white),
              SizedBox(width: 45),
              Expanded(
                child: Text(
                  "Been a while since you last logged\nyour measurements. Do it now?",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white60),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "UPDATE NOW",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Set your desired radius here
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeightInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weight",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            Icon(Icons.emoji_emotions, color: Colors.greenAccent, size: 30),
            SizedBox(width: 30),
            Text(
              "You have lost 1.60 kg\nin 79 days!",
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("STARTING",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
                Text("90.1 kg",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            Column(
              children: [
                Text("LAST UPDATED",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
                Text("88.5 kg",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class WeightChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.greenAccent, width: 1),
          ),
          minX: 0,
          maxX: 6,
          minY: 85,
          maxY: 92,
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 90),
                const FlSpot(1, 89),
                const FlSpot(2, 88),
                const FlSpot(3, 88),
                const FlSpot(4, 87.5),
                const FlSpot(5, 88.5),
              ],
              isCurved: true,
              // spots: [Colors.greenAccent],
              color: Colors.yellow,
              barWidth: 3,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

class BmiIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Current BMI",
              style: TextStyle(color: Colors.lightGreenAccent),
            ),
            Text(
              "26.43",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.5, // Adjust this to represent the BMI range
            child: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Center(
          child: Text(
            "HEALTHY",
            style: TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
        ),
      ],
    );
  }
}

//future you


class FutureYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Visualize your progress for "Future you"',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white38),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Now",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: screenWidth * 0.035, // Responsive font size
                            ),
                          ),
                          const SizedBox(height: 8),
                          Icon(
                            Icons.person_outline,
                            color: Colors.white38,
                            size: screenWidth * 0.12, // Responsive icon size
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: screenWidth * 0.05, // Responsive icon size
                            ),
                            label: Text(
                              "CAPTURE NOW",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              backgroundColor: Colors.white.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white38),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Later",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: screenWidth * 0.035, // Responsive font size
                            ),
                          ),
                          const SizedBox(height: 8),
                          Icon(
                            Icons.person_outline,
                            color: Colors.white38,
                            size: screenWidth * 0.12, // Responsive icon size
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.face_retouching_natural_rounded,
                              color: Colors.white,
                              size: screenWidth * 0.05, // Responsive icon size
                            ),
                            label: Text(
                              "Future You        ",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              backgroundColor: Colors.white.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
