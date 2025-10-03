//lib/blocs/meal_plan/meal_plan_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/services/meal_plan_service.dart';

import 'meal_plan_event.dart';
import 'meal_plan_state.dart';

class MealPlanBloc extends Bloc<MealPlanEvent, MealPlanState> {
  final MealPlanService _mealPlanService;
  
  MealPlanBloc(this._mealPlanService) : super(MealPlanInitial()) {
    on<LoadMealPlans>(_onLoadMealPlans);
    on<SelectDay>(_onSelectDay);
    on<SelectMealType>(_onSelectMealType);
  }
  
  Future<void> _onLoadMealPlans(
    LoadMealPlans event,
    Emitter<MealPlanState> emit,
  ) async {
    emit(MealPlanLoading());
    try {
      final mealPlans = await _mealPlanService.getAllActiveMealPlans();
      emit(MealPlanLoaded(mealPlans: mealPlans));
    } catch (e) {
      emit(MealPlanError(e.toString()));
    }
  }
  
  void _onSelectDay(SelectDay event, Emitter<MealPlanState> emit) {
    if (state is MealPlanLoaded) {
      final currentState = state as MealPlanLoaded;
      emit(currentState.copyWith(selectedDayIndex: event.dayIndex));
    }
  }
  
  void _onSelectMealType(SelectMealType event, Emitter<MealPlanState> emit) {
    if (state is MealPlanLoaded) {
      final currentState = state as MealPlanLoaded;
      emit(currentState.copyWith(selectedMealType: event.mealTypeIndex));
    }
  }
}


