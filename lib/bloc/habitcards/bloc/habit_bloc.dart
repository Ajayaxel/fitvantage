import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/repositories/habit_repository.dart';
import 'habit_event.dart';
import 'habit_state.dart';


class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final HabitRepository repository;

  HabitBloc(this.repository) : super(HabitInitial()) {
    on<LoadHabits>(_onLoadHabits);
  }

  Future<void> _onLoadHabits(LoadHabits event, Emitter<HabitState> emit) async {
    emit(HabitLoading());
    try {
      final habits = await repository.fetchHabits();
      if (habits.isEmpty) {
        emit(HabitError("No habits found"));
      } else {
        emit(HabitLoaded(habits));
      }
    } catch (e) {
      emit(HabitError("Failed to load habits: $e"));
    }
  }
}

