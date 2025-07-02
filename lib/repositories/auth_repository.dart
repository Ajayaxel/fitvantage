import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthRepository {
  final String baseUrl = 'https://fitvantage.io/api/v1/auth';

  Future<UserModel> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(url, body: {
      'login': email,
      'password': password,
    });

    final data = json.decode(response.body);
    if (data['code'] == 200) {
      final user = UserModel.fromJson(data['data']);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);
      await prefs.setString('name', user.name);
      return user;
    } else {
      throw Exception(data['message']);
    }
  }

  Future<String> register(String name, String email, String phone, String password, String confirmPassword) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(url, body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': confirmPassword,
    });

    final data = json.decode(response.body);
    if (data['code'] == 200) {
      return data['message'];
    } else {
      throw Exception(data['message']);
    }
  }
}
