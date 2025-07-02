// lib/bloc/meal_plan_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/mealplan/bloc/mealplan_event.dart';
import 'package:my_app/blocs/mealplan/bloc/mealplan_state.dart';
import 'package:my_app/repositories/meal_plan_repository.dart';



class MealPlanBloc extends Bloc<MealPlanEvent, MealPlanState> {
  final MealPlanRepository repo;

  MealPlanBloc(this.repo) : super(MealPlanInitial()) {
    on<FetchMealPlans>(_onFetch);
  }

  Future<void> _onFetch(
      FetchMealPlans event, Emitter<MealPlanState> emit) async {
    emit(MealPlanLoading());
    try {
      final plans = await repo.fetchMealPlans();
      emit(MealPlanLoaded(plans));
    } catch (e) {
      emit(MealPlanError(e.toString()));
    }
  }
}



