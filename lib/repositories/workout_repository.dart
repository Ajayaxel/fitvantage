import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/models/workout_model.dart';


class WorkoutRepository {
  static const String baseUrl = 'https://fitvantage.io/api/v1';
  
  Future<List<Exercise>> getExercises() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/exercises'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Exercise.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load exercises: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching exercises: $e');
    }
  }

  Future<List<Exercise>> getExercisesByType(String workoutTypeId) async {
    try {
      final exercises = await getExercises();
      return exercises.where((exercise) => exercise.workoutTypeId == workoutTypeId).toList();
    } catch (e) {
      throw Exception('Error fetching exercises by type: $e');
    }
  }

  Future<List<Exercise>> getExercisesByBodyPart(String bodyPartId) async {
    try {
      final exercises = await getExercises();
      return exercises.where((exercise) => exercise.bodyPartId == bodyPartId).toList();
    } catch (e) {
      throw Exception('Error fetching exercises by body part: $e');
    }
  }

  Future<Exercise?> getExerciseById(int id) async {
    try {
      final exercises = await getExercises();
      return exercises.firstWhere((exercise) => exercise.id == id);
    } catch (e) {
      throw Exception('Error fetching exercise by id: $e');
    }
  }
}
