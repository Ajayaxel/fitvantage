import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/bloc/ai_meal_plan_event.dart';
import 'package:my_app/bloc/bloc/ai_meal_plan_state.dart';
import 'package:my_app/repositories/ai_meal_plan_repository.dart';


class AiMealPlanBloc extends Bloc<AiMealPlanEvent, AiMealPlanState> {
  final AiMealPlanRepository _repository;
  
  AiMealPlanBloc(this._repository) : super(const AiMealPlanInitial()) {
    on<GenerateAiMealPlan>(_onGenerateAiMealPlan);
    on<ResetAiMealPlan>(_onResetAiMealPlan);
  }
  
  Future<void> _onGenerateAiMealPlan(
    GenerateAiMealPlan event,
    Emitter<AiMealPlanState> emit,
  ) async {
    emit(const AiMealPlanLoading());
    try {
      final response = await _repository.generateMealPlan(event.request);
      if (response.success) {
        emit(AiMealPlanLoaded(mealPlan: response.mealPlan));
      } else {
        emit(const AiMealPlanError('Failed to generate meal plan. Please try again.'));
      }
    } catch (e) {
      // Extract user-friendly error message
      String errorMessage = e.toString();
      if (errorMessage.contains('Exception: ')) {
        errorMessage = errorMessage.replaceFirst('Exception: ', '');
      }
      emit(AiMealPlanError(errorMessage));
    }
  }
  
  void _onResetAiMealPlan(
    ResetAiMealPlan event,
    Emitter<AiMealPlanState> emit,
  ) {
    emit(const AiMealPlanInitial());
  }
}
