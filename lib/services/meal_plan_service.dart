import '../models/meal_plan.dart';
import 'api_service.dart';

class MealPlanService {
  static Future<List<MealPlan>> getAllMealPlans() async {
    try {
      final response = await ApiService.get('get-all-meal-plans');
      return mealPlanFromJson(response.toString());
    } catch (e) {
      rethrow;
    }
  }
}