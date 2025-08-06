import 'package:flutter/material.dart';
import 'dart:async';

import 'package:my_app/presentation/myworkout/last_pul_screen.dart';

class LatPullDownScreen extends StatefulWidget {
  const LatPullDownScreen({super.key});

  @override
  State<LatPullDownScreen> createState() => _LatPullDownScreenState();
}

class _LatPullDownScreenState extends State<LatPullDownScreen>
    with SingleTickerProviderStateMixin {
  int secondsLeft = 30;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0) {
        setState(() {
          secondsLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  void _replaceExerciseSheet(BuildContext context) {
  final List<Map<String, String>> exercises = [
    {
      'image': 'https://steelsupplements.com/cdn/shop/articles/shutterstock_316192880_1600x.jpg?v=1596620197',
      'label': 'Bent-over Row',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtDpTTuuNgH_AqyaSMWLMSw0K43yVEkYVM1i7zMaplKFQOG3UVc3u0v4MTMtvg4sy2JRo&usqp=CAU',
      'label': 'PULL UPS',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjP-aRbrH_c97Jk_dsAifQ1csSwu9Xrw0_pE951MaE9hY2tJmOhvTh_VROv8jFly9Znx4&usqp=CAU',
      'label': 'Barbell Bent-over Row',
    },
    {
      'image': 'https://motionarray.imgix.net/green-screen-woman-doing-workout-for-ful-1880947-high_0014.jpg?w=660&q=60&fit=max&auto=format',
      'label': 'Bent-over Row',
    },
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF121212),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (_, controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Text(
                  "Swap With",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: exercises.length,
                    itemBuilder: (_, index) {
                      final item = exercises[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item['image']!,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "HARDER",
                                  style: TextStyle(
                                    color: Color(0xff7FFA88),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['label']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}


static void _showLogExerciseSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF121212),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return StatefulBuilder(
              builder: (context, setState) {
                List<Map<String, String>> sets = List.generate(4, (index) => {'reps': '10', 'weight': ''});
                bool isKg = true;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Log key exercises",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "To help track your progress better",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/Fitness/lastworkout.png',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Lat Pull Down',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () => setState(() => isKg = true),
                                  child: Text('KG', style: TextStyle(color: isKg ? Colors.white : Colors.grey)),
                                ),
                                TextButton(
                                  onPressed: () => setState(() => isKg = false),
                                  child: Text('LBS', style: TextStyle(color: isKg ? Colors.grey : Colors.white)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          controller: controller,
                          itemCount: sets.length,
                          itemBuilder: (_, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 30,),
                                Text("Set ${index + 1}", style: const TextStyle(color: Colors.white)),
                                const SizedBox(width:60 ),
                                const SizedBox(
                                  width: 60,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: "10",
                                      hintStyle: TextStyle(color: Colors.white),
                                      suffixText: "reps",
                                      suffixStyle: TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text('x', style: TextStyle(color: Colors.white)),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: "",
                                      hintStyle: const TextStyle(color: Colors.white),
                                      suffixText: isKg ? 'kgs' : 'lbs',
                                      suffixStyle: const TextStyle(color: Colors.white),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.white),
                                  onPressed: () => {}, // implement delete logic
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12,),
                      const Row(
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          SizedBox(width: 8),
                          Text("ADD SET", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.pop(context),
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text("Cancel", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xff7FFA88),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text("Save", style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    double progress = (30 - secondsLeft) / 30;

    return Scaffold(
      backgroundColor: const Color(0xFFB2BBB5),
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            // Background with dim effect when timer is running
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/Fitness/bglastpullof.png',
                    height: MediaQuery.of(context).size.height * 0.62,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
      
            // Overlay contents
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                const Text(
                  "SET 1 OF 3",
                  style: TextStyle(
                    color: Color(0xFF7FFA88),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Lat Pull Down",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 60),
      
                // Animated green skeletons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/Fitness/leftskeloton.png', // Use animated .gif or Lottie
                      height: 220,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/Fitness/right.png',
                      height: 220,
                    ),
                  ],
                ),
      
                const SizedBox(height: 20),
                // Reps & KG
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "10",
                      style: TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "×",
                      style: TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "15",
                      style: TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  "REPS          KG",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 50),
      
                // Log / Replace / Tutorial Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () => _showLogExerciseSheet(context),
                        child: actionButton(Icons.edit, "Log")),
                    GestureDetector(
                        onTap: () => _replaceExerciseSheet(context),
                        child: actionButton(Icons.swap_horiz, "Replace")),
                    actionButton(Icons.play_circle, "Tutorial"),
                  ],
                ),
                const Spacer(),
      
                // Timer Section
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExerciseInstructionScreen(),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff5E615F),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "$secondsLeft\nsecs",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Next Up",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "Rest",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Icon(Icons.play_arrow,
                            color: Colors.white, size: 30),
                      ],
                    ),
                  ),
                ),
      
                // Progress Bar
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white24,
                    color: Colors.white,
                    minHeight: 4,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget actionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          radius: 30,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
