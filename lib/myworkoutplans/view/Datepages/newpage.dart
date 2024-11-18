import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final DateTime selectedDate;
  const NewPage({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Date'),
      ),
      body: Center(
        child: Text(
          'You selected: ${selectedDate.toLocal()}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
   // Dynamically updated bottom content
                // Center(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Workout Details for ${DateFormat.yMMMd().format(_selectedDate)}',
                //         style: GoogleFonts.manrope(
                //           color: Colors.white,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 22,
                //         ),
                //       ),
                //       SizedBox(height: 20),
                //       // Example workout data for the selected date
                //       Text(
                //         '• Lower Body: Squats, Lunges\n• Duration: 45 mins\n• Calories Burned: 300 kcal',
                //         style: GoogleFonts.manrope(
                //           color: Colors.white54,
                //           fontWeight: FontWeight.w400,
                //           fontSize: 18,
                //         ),
                //         textAlign: TextAlign.center,
                //       ),
                //     ],
                //   ),
                // ),
