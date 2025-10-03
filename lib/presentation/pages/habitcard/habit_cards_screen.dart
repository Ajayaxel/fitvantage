


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
