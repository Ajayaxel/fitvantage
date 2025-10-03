import 'package:equatable/equatable.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class FetchWorkouts extends WorkoutEvent {
  const FetchWorkouts();
}

class FetchWorkoutsByType extends WorkoutEvent {
  final String workoutTypeId;
  
  const FetchWorkoutsByType(this.workoutTypeId);
  
  @override
  List<Object> get props => [workoutTypeId];
}

class FetchWorkoutsByBodyPart extends WorkoutEvent {
  final String bodyPartId;
  
  const FetchWorkoutsByBodyPart(this.bodyPartId);
  
  @override
  List<Object> get props => [bodyPartId];
}

class FetchWorkoutById extends WorkoutEvent {
  final int exerciseId;
  
  const FetchWorkoutById(this.exerciseId);
  
  @override
  List<Object> get props => [exerciseId];
}

class RefreshWorkouts extends WorkoutEvent {
  const RefreshWorkouts();
}

