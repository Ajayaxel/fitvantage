// import 'package:flutter/material.dart';

// class HabitCardsScreen extends StatelessWidget {
//   const HabitCardsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return  Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _circleIcon(Icons.arrow_back_ios_new, onTap: () {
//                     Navigator.pop(context);
//                   }),
//                   _circleIcon(Icons.share_outlined, onTap: () {}),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               Text(
//                 "Create a new habit",
//                 style: theme.textTheme.headlineSmall?.copyWith(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _HabitTypeCard(icon: Icons.repeat, label: "Regular"),
//                   _HabitTypeCard(icon: Icons.arrow_downward, label: "Negative"),
//                   _HabitTypeCard(icon: Icons.assignment, label: "One Task"),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFF7FFA88), Color(0xFF4CE072)],
//                     ),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       '+ Create your own',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               _HabitTrendCard(),
//               const SizedBox(height: 16),
//               _HabitTrendCard(),
//             ],
//           ),
//         );
    
//   }

//   Widget _circleIcon(IconData icon, {VoidCallback? onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: CircleAvatar(
//         backgroundColor: const Color(0xFF1A1A1A),
//         child: Icon(icon, color: Colors.white, size: 20),
//       ),
//     );
//   }
// }

// class _HabitTypeCard extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const _HabitTypeCard({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1F1F1F),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           CircleAvatar(
//             backgroundColor: const Color(0xFF3D3D3D),
//             child: Icon(icon, color: Colors.white),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             label,
//             style: const TextStyle(color: Colors.white),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _HabitTrendCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFF161816),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             backgroundColor: Color(0xFF3D3D3D),
//             child: Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
//           ),
//           const SizedBox(width: 12),
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Habits in trend",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 4),
//                 Text("Lorem ipsum dummy text",
//                     style: TextStyle(color: Colors.white54)),
//               ],
//             ),
//           ),
//           Container(
//             width: 36,
//             height: 36,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white),
//             ),
//             child:
//                 const Icon(Icons.arrow_outward, color: Colors.white, size: 18),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/bloc/habitcards/bloc/habit_bloc.dart';
import 'package:my_app/bloc/habitcards/bloc/habit_event.dart';
import 'package:my_app/bloc/habitcards/bloc/habit_state.dart';
import 'package:my_app/models/habit_card_model.dart';
import 'package:my_app/repositories/habit_repository.dart';

class HabitCardsScreen extends StatelessWidget {
  const HabitCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HabitBloc(HabitRepository())..add(LoadHabits()),
      child: Scaffold(
  
        appBar: AppBar(
          backgroundColor: const Color(0xff010A04),
          title: const Text(
            "Habit Cards",
            style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
   // Dark green
        ),
        body: BlocBuilder<HabitBloc, HabitState>(
          builder: (context, state) {
            if (state is HabitLoading) {
              return const Center(child: CircularProgressIndicator(color: Color(0xff7FFA88)));
            } else if (state is HabitLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.habits.length,
                itemBuilder: (context, index) {
                  final habit = state.habits[index];
                  return HabitCard(habit: habit);
                },
              );
            } else if (state is HabitError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class HabitCard extends StatelessWidget {
  final HabitCardModel habit;
  const HabitCard({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final isExpired = DateTime.now().isAfter(habit.endDate);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        // ignore: prefer_const_constructors
        gradient: LinearGradient(
          colors: const [
            Color(0xff66BB6A), // Light green
            Color(0xff2E7D32), // Dark green
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          habit.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            habit.description,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${DateFormat.MMMd().format(habit.startDate)} - ${DateFormat.MMMd().format(habit.endDate)}",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isExpired ? Colors.redAccent : Colors.greenAccent.shade700,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                isExpired ? "Expired" : "Active",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
