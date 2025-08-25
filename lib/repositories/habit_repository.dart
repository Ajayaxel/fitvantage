import 'package:dio/dio.dart';
import '../models/habit_card_model.dart';

class HabitRepository {
  final Dio _dio = Dio();
  final String baseUrl = "https://fitvantage.io/api/v1/get-all-active-habit-cards";

  Future<List<HabitCardModel>> fetchHabits() async {
    final response = await _dio.get(baseUrl);
    final data = response.data;

    List habitsData = [];
    if (data is List) habitsData = data;
    else if (data is Map && data['data'] is List) habitsData = data['data'];
    else if (data is Map && data['habits'] is List) habitsData = data['habits'];
    else throw Exception("Unexpected API format");

    return habitsData.map((e) => HabitCardModel.fromJson(Map<String, dynamic>.from(e))).toList();
  }
}
