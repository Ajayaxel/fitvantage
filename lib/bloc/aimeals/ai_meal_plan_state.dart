import 'package:equatable/equatable.dart';
import 'package:my_app/models/ai_meal_plan_models.dart';

abstract class AiMealPlanState extends Equatable {
  const AiMealPlanState();
  
  @override
  List<Object?> get props => [];
}

class AiMealPlanInitial extends AiMealPlanState {
  const AiMealPlanInitial();
}

class AiMealPlanLoading extends AiMealPlanState {
  const AiMealPlanLoading();
}

class AiMealPlanLoaded extends AiMealPlanState {
  final AiMealPlan mealPlan;
  
  const AiMealPlanLoaded({required this.mealPlan});
  
  @override
  List<Object?> get props => [mealPlan];
}

class AiMealPlanError extends AiMealPlanState {
  final String message;
  
  const AiMealPlanError(this.message);
  
  @override
  List<Object?> get props => [message];
}
