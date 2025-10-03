import 'package:my_app/models/ai_meal_plan_models.dart';
import '../services/api_service.dart';

class AiMealPlanRepository {
  static const String _baseUrl = 'http://localhost:5001/api/meal-plan';
  
  Future<AiMealPlanResponse> generateMealPlan(AiMealPlanRequest request) async {
    try {
      final response = await ApiService.post(
        '$_baseUrl/generate',
        data: request.toJson(),
        timeout: const Duration(seconds: 60), // Increased timeout for AI generation
      );
      
      return AiMealPlanResponse.fromJson(response);
    } catch (e) {
      // Better error handling with more specific messages
      if (e.toString().contains('timeout')) {
        throw Exception('AI meal plan generation is taking longer than expected. Please try again.');
      } else if (e.toString().contains('connection') || e.toString().contains('localhost')) {
        throw Exception('Unable to connect to the AI server. Please make sure the server is running on localhost:5001');
      } else if (e.toString().contains('SocketException')) {
        throw Exception('Server is not responding. Please check if the AI server is running.');
      } else {
        throw Exception('Failed to generate meal plan: $e');
      }
    }
  }
}
