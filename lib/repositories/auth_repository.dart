import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthRepository {
  final String baseUrl = 'https://fitvantage.io/api/v1/auth';

  Future<UserModel> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      },
      body: {
        'login': email,
        'password': password,
      },
    );

    print('Login Response status: ${response.statusCode}');
    print('Login Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['code'] == 200) {
        final user = UserModel.fromJson(data['data']);
        
        // Save user data to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', user.token);
        await prefs.setString('user_name', user.name);
        await prefs.setString('user_email', user.email);
        await prefs.setString('user_phone', user.phone);
        await prefs.setString('user_id', user.id);
        await prefs.setBool('is_logged_in', true);
        
        return user;
      } else {
        throw Exception(data['message'] ?? 'Login failed');
      }
    } else {
      final data = json.decode(response.body);
      throw Exception(data['message'] ?? 'HTTP Error: ${response.statusCode}');
    }
  }

  Future<String> register(String name, String email, String phone, String password, String confirmPassword) async {
    final url = Uri.parse('$baseUrl/register');
    
    print('Registering with: $name, $email, $phone');
    print('Registration URL: $url');
    
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
      },
      body: {
        'first_name': name,
        'email': email,
        'mobile_number': phone,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );

    print('Registration Response status: ${response.statusCode}');
    print('Registration Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['code'] == 200) {
        return data['message'] ?? 'Registration successful';
      } else {
        throw Exception(data['message'] ?? 'Registration failed');
      }
    } else {
      try {
        final data = json.decode(response.body);
        throw Exception(data['message'] ?? 'HTTP Error: ${response.statusCode}');
      } catch (e) {
        throw Exception('HTTP Error: ${response.statusCode} - ${response.body}');
      }
    }
  }

  // Get current user data from SharedPreferences
  Future<UserModel?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    
    if (!isLoggedIn) return null;
    
    final token = prefs.getString('token');
    final name = prefs.getString('user_name');
    final email = prefs.getString('user_email');
    final phone = prefs.getString('user_phone');
    final id = prefs.getString('user_id');
    
    if (token == null || name == null) return null;
    
    return UserModel(
      id: id ?? '',
      name: name,
      email: email ?? '',
      phone: phone ?? '',
      token: token,
    );
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in') ?? false;
  }

  // Logout user
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored data
  }
}
