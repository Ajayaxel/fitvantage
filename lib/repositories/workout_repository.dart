import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/models/workout_model.dart';


class WorkoutRepository {
  static const String baseUrl = 'https://fitvantage.io/api/v1';
  static const Duration timeoutDuration = Duration(seconds: 30);
  
  Future<List<Exercise>> getExercises() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/exercises'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          return [];
        }
        
        final dynamic jsonData = json.decode(response.body);
        
        if (jsonData is! List) {
          throw Exception('Invalid API response format: Expected array but got ${jsonData.runtimeType}');
        }
        
        final List<Exercise> exercises = [];
        for (var item in jsonData) {
          try {
            if (item is Map<String, dynamic>) {
              exercises.add(Exercise.fromJson(item));
            }
          } catch (e) {
            print('Error parsing exercise: $e');
            // Continue with other exercises instead of failing completely
          }
        }
        
        return exercises;
      } else if (response.statusCode == 404) {
        throw Exception('API endpoint not found. Please check the API URL.');
      } else if (response.statusCode == 500) {
        throw Exception('Server error. Please try again later.');
      } else {
        throw Exception('Failed to load exercises: HTTP ${response.statusCode} - ${response.reasonPhrase}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: ${e.message}. Please check your internet connection.');
    } on FormatException catch (e) {
      throw Exception('Invalid JSON response from server: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error fetching exercises: $e');
    }
  }

  Future<List<Exercise>> getExercisesByType(String workoutTypeId) async {
    try {
      final exercises = await getExercises();
      if (exercises.isEmpty) {
        return [];
      }
      return exercises.where((exercise) => exercise.workoutTypeId == workoutTypeId).toList();
    } catch (e) {
      throw Exception('Error fetching exercises by type: $e');
    }
  }

  Future<List<Exercise>> getExercisesByBodyPart(String bodyPartId) async {
    try {
      final exercises = await getExercises();
      if (exercises.isEmpty) {
        return [];
      }
      return exercises.where((exercise) => exercise.bodyPartId == bodyPartId).toList();
    } catch (e) {
      throw Exception('Error fetching exercises by body part: $e');
    }
  }

  Future<Exercise?> getExerciseById(int id) async {
    try {
      final exercises = await getExercises();
      if (exercises.isEmpty) {
        return null;
      }
      try {
        return exercises.firstWhere((exercise) => exercise.id == id);
      } catch (e) {
        return null; // Exercise not found
      }
    } catch (e) {
      throw Exception('Error fetching exercise by id: $e');
    }
  }
}
