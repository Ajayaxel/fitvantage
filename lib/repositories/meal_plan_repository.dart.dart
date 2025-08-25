// lib/repositories/meal_repository.dart

import 'package:my_app/models/meals_model.dart';
import '../services/api_service.dart';

class MealRepository {
  // Fetch meal plans - adjust endpoint according to your API
  Future<List<MealPlan>> getMealPlans() async {
    try {
      final response = await ApiService.get('meal-plans'); // Adjust endpoint as needed
      
      if (response is List) {
        return response.map((json) => MealPlan.fromJson(json)).toList();
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      throw Exception('Failed to fetch meal plans: $e');
    }
  }

  // Fetch meal plans for a specific date
  Future<List<MealPlan>> getMealPlansForDate(String date) async {
    try {
      final response = await ApiService.get('meal-plans?date=$date');
      
      if (response is List) {
        return response.map((json) => MealPlan.fromJson(json)).toList();
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      throw Exception('Failed to fetch meal plans for date: $e');
    }
  }

  // Fetch meal plans for date range
  Future<List<MealPlan>> getMealPlansForWeek(String startDate, String endDate) async {
    try {
      final response = await ApiService.get('meal-plans?start_date=$startDate&end_date=$endDate');
      
      if (response is List) {
        return response.map((json) => MealPlan.fromJson(json)).toList();
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      throw Exception('Failed to fetch meal plans for week: $e');
    }
  }
}