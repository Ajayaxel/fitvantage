import 'package:equatable/equatable.dart';
import 'package:my_app/models/workout_model.dart';


abstract class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

class WorkoutInitial extends WorkoutState {}

class WorkoutLoading extends WorkoutState {}

class WorkoutLoaded extends WorkoutState {
  final List<Exercise> exercises;
  final List<Exercise> warmUpExercises;
  final List<Exercise> workoutExercises;
  final List<Exercise> stretchingExercises;
  final List<Exercise> cardioExercises;

  const WorkoutLoaded({
    required this.exercises,
    required this.warmUpExercises,
    required this.workoutExercises,
    required this.stretchingExercises,
    required this.cardioExercises,
  });

  @override
  List<Object> get props => [
    exercises,
    warmUpExercises,
    workoutExercises,
    stretchingExercises,
    cardioExercises,
  ];
}

class WorkoutError extends WorkoutState {
  final String message;

  const WorkoutError(this.message);

  @override
  List<Object> get props => [message];
}

class WorkoutByTypeLoaded extends WorkoutState {
  final List<Exercise> exercises;
  final String workoutType;

  const WorkoutByTypeLoaded({
    required this.exercises,
    required this.workoutType,
  });

  @override
  List<Object> get props => [exercises, workoutType];
}

class WorkoutByBodyPartLoaded extends WorkoutState {
  final List<Exercise> exercises;
  final String bodyPart;

  const WorkoutByBodyPartLoaded({
    required this.exercises,
    required this.bodyPart,
  });

  @override
  List<Object> get props => [exercises, bodyPart];
}

class SingleWorkoutLoaded extends WorkoutState {
  final Exercise exercise;

  const SingleWorkoutLoaded(this.exercise);

  @override
  List<Object> get props => [exercise];
}
