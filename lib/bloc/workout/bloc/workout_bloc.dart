import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/workout/bloc/workout_event.dart';
import 'package:my_app/bloc/workout/bloc/workout_state.dart';
import 'package:my_app/repositories/workout_repository.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;

  WorkoutBloc(this.workoutRepository) : super(WorkoutInitial()) {
    on<FetchWorkouts>(_onFetchWorkouts);
    on<FetchWorkoutsByType>(_onFetchWorkoutsByType);
    on<FetchWorkoutsByBodyPart>(_onFetchWorkoutsByBodyPart);
    on<FetchWorkoutById>(_onFetchWorkoutById);
    on<RefreshWorkouts>(_onRefreshWorkouts);
  }

  void _onFetchWorkouts(FetchWorkouts event, Emitter<WorkoutState> emit) async {
    emit(WorkoutLoading());
    try {
      final exercises = await workoutRepository.getExercises();
      
      // Filter exercises by workout type
      final warmUpExercises = exercises.where((e) => e.workoutTypeId == '1').toList();
      final workoutExercises = exercises.where((e) => e.workoutTypeId == '2').toList();
      final stretchingExercises = exercises.where((e) => e.workoutTypeId == '3').toList();
      final cardioExercises = exercises.where((e) => e.workoutTypeId == '4').toList();
      
      emit(WorkoutLoaded(
        exercises: exercises,
        warmUpExercises: warmUpExercises,
        workoutExercises: workoutExercises,
        stretchingExercises: stretchingExercises,
        cardioExercises: cardioExercises,
      ));
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }

  void _onFetchWorkoutsByType(FetchWorkoutsByType event, Emitter<WorkoutState> emit) async {
    emit(WorkoutLoading());
    try {
      final exercises = await workoutRepository.getExercisesByType(event.workoutTypeId);
      final workoutTypeName = exercises.isNotEmpty ? exercises.first.getWorkoutType.name : '';
      emit(WorkoutByTypeLoaded(exercises: exercises, workoutType: workoutTypeName));
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }

  void _onFetchWorkoutsByBodyPart(FetchWorkoutsByBodyPart event, Emitter<WorkoutState> emit) async {
    emit(WorkoutLoading());
    try {
      final exercises = await workoutRepository.getExercisesByBodyPart(event.bodyPartId);
      final bodyPartName = exercises.isNotEmpty ? exercises.first.getBodyPart.name : '';
      emit(WorkoutByBodyPartLoaded(exercises: exercises, bodyPart: bodyPartName));
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }

  void _onFetchWorkoutById(FetchWorkoutById event, Emitter<WorkoutState> emit) async {
    emit(WorkoutLoading());
    try {
      final exercise = await workoutRepository.getExerciseById(event.exerciseId);
      if (exercise != null) {
        emit(SingleWorkoutLoaded(exercise));
      } else {
        emit(const WorkoutError('Exercise not found'));
      }
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }

  void _onRefreshWorkouts(RefreshWorkouts event, Emitter<WorkoutState> emit) async {
    // Don't show loading for refresh
    try {
      final exercises = await workoutRepository.getExercises();
      
      final warmUpExercises = exercises.where((e) => e.workoutTypeId == '1').toList();
      final workoutExercises = exercises.where((e) => e.workoutTypeId == '2').toList();
      final stretchingExercises = exercises.where((e) => e.workoutTypeId == '3').toList();
      final cardioExercises = exercises.where((e) => e.workoutTypeId == '4').toList();
      
      emit(WorkoutLoaded(
        exercises: exercises,
        warmUpExercises: warmUpExercises,
        workoutExercises: workoutExercises,
        stretchingExercises: stretchingExercises,
        cardioExercises: cardioExercises,
      ));
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }
}
