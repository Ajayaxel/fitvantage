// lib/repository/meal_plan_repository.dart
import 'package:my_app/models/meal_plan.dart';
import '../services/api_service.dart';

class MealPlanRepository {
  Future<List<MealPlan>> fetchMealPlans() async {
    final response = await ApiService.get('get-all-meal-plans');
    return List<MealPlan>.from(response.map((x) => MealPlan.fromJson(x)));
  }
}
