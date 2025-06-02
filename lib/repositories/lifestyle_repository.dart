import '../models/health_assessment_models.dart';
import '../services/api_service.dart';

class LifestyleRepository {
  Future<HealthAssessmentResponse> fetchLifestyleQuestions() async {
    final data = await ApiService.get('getallcategoryquestionoption');
    return HealthAssessmentResponse.fromJson(data);
  }
}
