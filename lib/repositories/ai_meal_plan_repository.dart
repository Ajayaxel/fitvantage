import 'package:my_app/models/ai_meal_plan_models.dart';
import '../services/api_service.dart';

class AiMealPlanRepository {
  static const String _baseUrl = 'https://fitvantage-backend-io.up.railway.app/api/meal-plan';
  
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
        throw Exception('Unable to connect to the AI server. Please make sure the server is running.');
      } else if (e.toString().contains('SocketException')) {
        throw Exception('Server is not responding. Please check if the AI server is running.');
      } else if (e.toString().contains('type \'String\' is not a subtype of type \'int\'')) {
        throw Exception('Data format error: Please try again with different preferences.');
      } else {
        throw Exception('Failed to generate meal plan: ${e.toString().replaceAll('Exception: ', '')}');
      }
    }
  }
}
