// lib/bloc/meal_plan_state.dart
import 'package:flutter/foundation.dart';
import 'package:my_app/models/meal_plan.dart';

@immutable
abstract class MealPlanState {}

class MealPlanInitial extends MealPlanState {}

class MealPlanLoading extends MealPlanState {}

class MealPlanLoaded extends MealPlanState {
  final List<MealPlan> mealPlans;
  MealPlanLoaded(this.mealPlans);
}

class MealPlanError extends MealPlanState {
  final String message;
  MealPlanError(this.message);
}


