//lib/blocs/meal_plan/meal_plan_state.dart
import 'package:equatable/equatable.dart';
import 'package:my_app/models/meals_model.dart';


abstract class MealPlanState extends Equatable {
  const MealPlanState();
  
  @override
  List<Object?> get props => [];
}

class MealPlanInitial extends MealPlanState {}

class MealPlanLoading extends MealPlanState {}

class MealPlanLoaded extends MealPlanState {
  final List<MealPlan> mealPlans;
  final int selectedDayIndex;
  final int selectedMealType;
  
  const MealPlanLoaded({
    required this.mealPlans,
    this.selectedDayIndex = 0,
    this.selectedMealType = 0,
  });
  
  @override
  List<Object?> get props => [mealPlans, selectedDayIndex, selectedMealType];
  
  MealPlanLoaded copyWith({
    List<MealPlan>? mealPlans,
    int? selectedDayIndex,
    int? selectedMealType,
  }) {
    return MealPlanLoaded(
      mealPlans: mealPlans ?? this.mealPlans,
      selectedDayIndex: selectedDayIndex ?? this.selectedDayIndex,
      selectedMealType: selectedMealType ?? this.selectedMealType,
    );
  }
}

class MealPlanError extends MealPlanState {
  final String message;
  
  const MealPlanError(this.message);
  
  @override
  List<Object?> get props => [message];
}


