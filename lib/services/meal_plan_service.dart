//lib/services/meal_plan_service.dart

import 'package:my_app/models/meals_model.dart';

import 'api_service.dart';

class MealPlanService {
  static const String _endpoint = 'get-all-active-meal-plans';
  
  Future<List<MealPlan>> getAllActiveMealPlans() async {
    try {
      final response = await ApiService.get(_endpoint);
      
      // Handle different response structures
      List<dynamic> mealPlansJson;
      if (response is Map<String, dynamic>) {
        // If response is wrapped in an object
        mealPlansJson = response['data'] ?? response['meal_plans'] ?? [];
      } else if (response is List) {
        // If response is directly a list
        mealPlansJson = response;
      } else {
        throw Exception('Unexpected response format');
      }
      
      return mealPlansJson.map((json) => MealPlan.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load meal plans: $e');
    }
  }
}
