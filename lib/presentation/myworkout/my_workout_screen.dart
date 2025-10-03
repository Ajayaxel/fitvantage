import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/workout/bloc/workout_bloc.dart';
import 'package:my_app/bloc/workout/bloc/workout_event.dart';
import 'package:my_app/bloc/workout/bloc/workout_state.dart';
import 'package:my_app/models/workout_model.dart';
import 'package:my_app/presentation/myworkout/last_pull_down_screen.dart';
import 'package:my_app/repositories/workout_repository.dart';

class MyWorkoutScreen extends StatefulWidget {
  const MyWorkoutScreen({super.key});

  @override
  State<MyWorkoutScreen> createState() => _MyWorkoutScreenState();
}

class _MyWorkoutScreenState extends State<MyWorkoutScreen> {
  bool isWarmUpExpanded = false;
  bool isWorkoutExpanded = true; // Default expanded
  bool isStretchingExpanded = false;
  bool isCardioExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkoutBloc(WorkoutRepository())..add(const FetchWorkouts()),
      child: Scaffold(
        backgroundColor: const Color(0xff010A04),
        appBar: AppBar(
          backgroundColor: const Color(0xff010A04),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Workout Plan",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text("Lose Weight • Beginner • 4 Days",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  // Add settings functionality here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Settings coming soon!'),
                      backgroundColor: Color(0xff7FFA88),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        body: BlocBuilder<WorkoutBloc, WorkoutState>(
          builder: (context, state) {
            if (state is WorkoutLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff7FFA88)),
                ),
              );
            }
            
            if (state is WorkoutError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
               const Text(
                      'Error loading workouts',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<WorkoutBloc>().add(const FetchWorkouts());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7FFA88),
                      ),
                      child: const Text(
                        'Retry',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            }
            
            if (state is WorkoutLoaded) {
              return RefreshIndicator(
                color: const Color(0xff7FFA88),
                onRefresh: () async {
                  context.read<WorkoutBloc>().add(const RefreshWorkouts());
                },
                child: ListView(
                  children: [
                    const SizedBox(height: 8),
                    
                    // Warm Up Section
                    if (state.warmUpExercises.isNotEmpty) ...[
                      SubSection(
                        title: "Warm Up",
                        duration: "${_calculateTotalDuration(state.warmUpExercises)} MINS",
                        isExpanded: isWarmUpExpanded,
                        exerciseCount: state.warmUpExercises.length,
                        onTap: () {
                          setState(() {
                            isWarmUpExpanded = !isWarmUpExpanded;
                          });
                        },
                      ),
                      if (isWarmUpExpanded) ...[
                        const SizedBox(height: 8),
                        ...state.warmUpExercises.map((exercise) => WorkoutTile(exercise: exercise)),
                      ],
                      const Divider(color: Colors.grey),
                    ],
                    
                    // Workout Section
                    if (state.workoutExercises.isNotEmpty) ...[
                      SubSection(
                        title: "Workout",
                        duration: "${_calculateTotalDuration(state.workoutExercises)} MINS",
                        isExpanded: isWorkoutExpanded,
                        exerciseCount: state.workoutExercises.length,
                        onTap: () {
                          setState(() {
                            isWorkoutExpanded = !isWorkoutExpanded;
                          });
                        },
                      ),
                      if (isWorkoutExpanded) ...[
                        const SizedBox(height: 8),
                        ...state.workoutExercises.map((exercise) => WorkoutTile(exercise: exercise)),
                      ],
                      const Divider(color: Colors.grey),
                    ],
                    
                    // Stretching Section
                    if (state.stretchingExercises.isNotEmpty) ...[
                      SubSection(
                        title: "Stretching",
                        duration: "${_calculateTotalDuration(state.stretchingExercises)} MINS",
                        isExpanded: isStretchingExpanded,
                        exerciseCount: state.stretchingExercises.length,
                        onTap: () {
                          setState(() {
                            isStretchingExpanded = !isStretchingExpanded;
                          });
                        },
                      ),
                      if (isStretchingExpanded) ...[
                        const SizedBox(height: 8),
                        ...state.stretchingExercises.map((exercise) => WorkoutTile(exercise: exercise)),
                      ],
                      const Divider(color: Colors.grey),
                    ],
                    
                    // Cardio Section
                    if (state.cardioExercises.isNotEmpty) ...[
                      SubSection(
                        title: "Cardio",
                        duration: "${_calculateTotalDuration(state.cardioExercises)} MINS",
                        isExpanded: isCardioExpanded,
                        exerciseCount: state.cardioExercises.length,
                        onTap: () {
                          setState(() {
                            isCardioExpanded = !isCardioExpanded;
                          });
                        },
                      ),
                      if (isCardioExpanded) ...[
                        const SizedBox(height: 8),
                        ...state.cardioExercises.map((exercise) => WorkoutTile(exercise: exercise)),
                      ],
                    ],
                    
                    const SizedBox(height: 80), // Bottom padding
                  ],
                ),
              );
            }
            
            return const Center(
              child: Text(
                'No workouts available',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }

  int _calculateTotalDuration(List<Exercise> exercises) {
    int totalMinutes = 0;
    for (var exercise in exercises) {
      if (exercise.timeInMinutes != null && exercise.timeInMinutes!.isNotEmpty) {
        totalMinutes += int.tryParse(exercise.timeInMinutes!) ?? 0;
      } else {
        // Estimate time based on sets and reps (assuming 1 minute per set)
        totalMinutes += int.tryParse(exercise.sets) ?? 0;
      }
    }
    return totalMinutes;
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String duration;

  const SectionHeader({
    super.key,
    required this.title,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(duration, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class SubSection extends StatelessWidget {
  final String title;
  final String duration;
  final bool isExpanded;
  final int exerciseCount;
  final VoidCallback onTap;

  const SubSection({
    super.key,
    required this.title,
    required this.duration,
    this.isExpanded = false,
    this.exerciseCount = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$exerciseCount',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              const Spacer(),
              Text(duration, style: const TextStyle(color: Colors.white)),
              const SizedBox(width: 10),
              AnimatedRotation(
                turns: isExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutTile extends StatelessWidget {
  final Exercise exercise;
  
  const WorkoutTile({super.key, required this.exercise});

  void _replaceExerciseSheet(BuildContext context) {
    // Using static exercise list from your original code for replace functionality
    final List<Map<String, String>> exercises = [
      {
        'image':
            'https://steelsupplements.com/cdn/shop/articles/shutterstock_316192880_1600x.jpg?v=1596620197',
        'label': 'Bent-over Row',
      },
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtDpTTuuNgH_AqyaSMWLMSw0K43yVEkYVM1i7zMaplKFQOG3UVc3u0v4MTMtvg4sy2JRo&usqp=CAU',
        'label': 'PULL UPS',
      },
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjP-aRbrH_c97Jk_dsAifQ1csSwu9Xrw0_pE951MaE9hY2tJmOhvTh_VROv8jFly9Znx4&usqp=CAU',
        'label': 'Barbell Bent-over Row',
      },
      {
        'image':
            'https://motionarray.imgix.net/green-screen-woman-doing-workout-for-ful-1880947-high_0014.jpg?w=660&q=60&fit=max&auto=format',
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Replaced with ${item['label']}'),
                                backgroundColor: const Color(0xff7FFA88),
                              ),
                            );
                          },
                          child: Padding(
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
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 70,
                                        height: 70,
                                        color: Colors.grey[700],
                                        child: const Icon(
                                          Icons.fitness_center,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
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

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF121212),
          title: const Text(
            'Delete Exercise',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Are you sure you want to delete this exercise from your workout?',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Exercise deleted successfully!'),
                    backgroundColor: Color(0xff7FFA88),
                  ),
                );
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF121212),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  exercise.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildOption(
                icon: Icons.edit,
                label: 'Log Exercise',
                onTap: () {
                  Navigator.pop(context);
                  _showLogExerciseSheet(context, exercise);
                },
              ),
              const Divider(color: Colors.grey),
              _buildOption(
                icon: Icons.sync_alt,
                label: 'Replace Exercise',
                onTap: () {
                  Navigator.pop(context);
                  _replaceExerciseSheet(context);
                },
              ),
              const Divider(color: Colors.grey),
              _buildOption(
                icon: Icons.delete_outline,
                label: 'Delete Exercise',
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmation(context);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }

  static void _showLogExerciseSheet(BuildContext context, Exercise exercise) {
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
                List<Map<String, String>> sets = List.generate(
                  int.tryParse(exercise.sets) ?? 3, 
                  (index) => {
                    'reps': exercise.reps ?? '10', 
                    'weight': ''
                  }
                );
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
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                            child: exercise.images != null && exercise.images!.isNotEmpty
                                ? Image.network(
                                    exercise.images!,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.grey[700],
                                        child: const Icon(
                                          Icons.fitness_center,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.grey[700],
                                    child: const Icon(
                                      Icons.fitness_center,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            exercise.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
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
                                  child: Text('KG',
                                      style: TextStyle(
                                          color: isKg
                                              ? Colors.white
                                              : Colors.grey)),
                                ),
                                TextButton(
                                  onPressed: () => setState(() => isKg = false),
                                  child: Text('LBS',
                                      style: TextStyle(
                                          color: isKg
                                              ? Colors.grey
                                              : Colors.white)),
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
                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Set ${index + 1}",
                                      style: const TextStyle(color: Colors.white)),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 60,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintText: sets[index]['reps'],
                                        hintStyle: const TextStyle(color: Colors.white),
                                        suffixText: "reps",
                                        suffixStyle: const TextStyle(color: Colors.white),
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        sets[index]['reps'] = value;
                                      },
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
                                      onChanged: (value) {
                                        sets[index]['weight'] = value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        if (sets.length > 1) {
                                          sets.removeAt(index);
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sets.add({'reps': exercise.reps ?? '10', 'weight': ''});
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              SizedBox(width: 8),
                              Text("ADD SET",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text("Cancel",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Validate the form before saving
                                bool hasValidData = sets.any((set) => 
                                  set['reps']!.isNotEmpty && 
                                  set['weight']!.isNotEmpty
                                );
                                
                                if (hasValidData) {
                                  // Here you can save the exercise log data
                                  // You might want to add this to your BLoC or repository
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Exercise logged successfully!'),
                                      backgroundColor: Color(0xff7FFA88),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please fill in at least one set with reps and weight'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: const Color(0xff7FFA88),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text("Save",
                                      style: TextStyle(color: Colors.black)),
                                ),
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

  String _formatExerciseDetails() {
    String details = "";
    
    if (exercise.reps != null && exercise.reps!.isNotEmpty) {
      details += "${exercise.reps} Reps";
    }
    
    if (exercise.sets.isNotEmpty) {
      if (details.isNotEmpty) details += " × ";
      details += "${exercise.sets} Sets";
    }
    
    if (exercise.timeInMinutes != null && exercise.timeInMinutes!.isNotEmpty) {
      if (details.isNotEmpty) details += " • ";
      details += "${exercise.timeInMinutes} Min";
    }
    
    return details.isNotEmpty ? details : "Tap for details";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LatPullDownScreen(),
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: exercise.images != null && exercise.images!.isNotEmpty
                  ? Image.network(
                      exercise.images!,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 60,
                          width: 60,
                          color: Colors.grey[700],
                          child: const Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                            size: 30,
                          ),
                        );
                      },
                    )
                  : Container(
                      height: 60,
                      width: 60,
                      color: Colors.grey[700],
                      child: const Icon(
                        Icons.fitness_center,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _formatExerciseDetails(),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    exercise.getBodyPart.name,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _showBottomSheet(context),
              child: const Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


