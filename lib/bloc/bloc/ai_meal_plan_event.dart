import 'package:equatable/equatable.dart';
import 'package:my_app/models/ai_meal_plan_models.dart';

abstract class AiMealPlanEvent extends Equatable {
  const AiMealPlanEvent();
  
  @override
  List<Object?> get props => [];
}

class GenerateAiMealPlan extends AiMealPlanEvent {
  final AiMealPlanRequest request;
  
  const GenerateAiMealPlan(this.request);
  
  @override
  List<Object?> get props => [request];
}

class ResetAiMealPlan extends AiMealPlanEvent {
  const ResetAiMealPlan();
}
