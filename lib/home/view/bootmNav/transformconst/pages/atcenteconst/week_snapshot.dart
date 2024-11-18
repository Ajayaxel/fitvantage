import 'package:flutter/material.dart';

class WeekSnapshotScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyPlan = [
    {
      "day": "1",
      "type": "AT-CENTER WORKOUT",
      "description": "Strength Circuit ",
      "icon": Icons.fitness_center,
      "color": Colors.green,
    },
    {
      "day": "2",
      "type": "HOME WORKOUT",
      "description": "Dance Workout/Sports + Step Challenge",
      "icon": Icons.directions_run,
      "color": Colors.blue,
    },
    {
      "day": "3",
      "type": "AT-CENTER WORKOUT",
      "description": "Team Ladder Workout + Core Crushers",
      "icon": Icons.sports_kabaddi,
      "color": Colors.green,
    },
    {
      "day": "4",
      "type": "HOME WORKOUT",
      "description": "Hatha Yoga + Step Challenge",
      "icon": Icons.self_improvement,
      "color": Colors.blue,
    },
    {
      "day": "5",
      "type": "AT-CENTER WORKOUT",
      "description": "Cardio Circuit + Full Body Conditioning",
      "icon": Icons.directions_bike,
      "color": Colors.green,
    },
    {
      "day": "6",
      "type": "AT-CENTER WORKOUT",
      "description": "Crossfit Style Workout + Benchmark Test",
      "icon": Icons.visibility,
      "color": Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: weeklyPlan.map((item) {
          return Card(
            color: Colors.white.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 80, // Fixed height for each card
              child: ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: item['color'],
                  child: Text(
                    item["day"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  item["type"],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  item["description"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.grey.shade700,
                  child: Icon(item["icon"], color: Colors.white),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}




