// repository/auth_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepository {
  static const String baseUrl = 'https://fitvantage.io/api/v1/auth';
  static const String loginEndpoint = '$baseUrl/login';
  static const String registerEndpoint = '$baseUrl/register';
  static const String tokenKey = 'user_token';
  static const String userDataKey = 'user_data';

  // Login API call
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      print('Login Request: ${jsonEncode(request.toJson())}'); // Debug log
      
      final response = await http.post(
        Uri.parse(loginEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      print('Login Response Status: ${response.statusCode}'); // Debug log
      print('Login Response Body: ${response.body}'); // Debug log

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(responseData);
        
        // Store token and user data if login is successful
        if (loginResponse.data != null) {
          await _storeUserData(loginResponse.data!);
          print('User data stored successfully'); // Debug log
        }
        
        return loginResponse;
      } else {
        // Handle API error responses
        return LoginResponse(
          code: responseData['code'] ?? response.statusCode,
          status: responseData['status'] ?? 'error',
          message: responseData['message'] ?? 'Login failed',
          data: null,
        );
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Login Error: $e'); // Debug log
      return LoginResponse(
        code: 500,
        status: 'error',
        message: 'Network error occurred. Please check your connection and try again.',
        data: null,
      );
    }
  }

  // Register API call
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      print('Register Request: ${jsonEncode(request.toJson())}'); // Debug log
      
      final response = await http.post(
        Uri.parse(registerEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      print('Register Response Status: ${response.statusCode}'); // Debug log
      print('Register Response Body: ${response.body}'); // Debug log

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return RegisterResponse.fromJson(responseData);
      } else {
        // Handle API error responses
        return RegisterResponse(
          code: responseData['code'] ?? response.statusCode,
          status: responseData['status'] ?? 'error',
          message: responseData['message'] ?? 'Registration failed',
        );
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Register Error: $e'); // Debug log
      return RegisterResponse(
        code: 500,
        status: 'error',
        message: 'Network error occurred. Please check your connection and try again.',
      );
    }
  }

  // Store user data and token
  Future<void> _storeUserData(UserData userData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(tokenKey, userData.token);
      await prefs.setString(userDataKey, jsonEncode(userData.toJson()));
      print('Token stored: ${userData.token.substring(0, 20)}...'); // Debug log
    } catch (e) {
      print('Error storing user data: $e'); // Debug log
      rethrow;
    }
  }

  // Get stored token
  Future<String?> getStoredToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(tokenKey);
      print('Retrieved token: ${token?.substring(0, 20)}...'); // Debug log
      return token;
    } catch (e) {
      print('Error getting stored token: $e'); // Debug log
      return null;
    }
  }

  // Get stored user data
  Future<UserData?> getStoredUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString(userDataKey);
      
      if (userDataString != null) {
        final Map<String, dynamic> userData = jsonDecode(userDataString);
        final user = UserData.fromJson(userData);
        print('Retrieved user data: ${user.name}'); // Debug log
        return user;
      }
      return null;
    } catch (e) {
      print('Error getting stored user data: $e'); // Debug log
      return null;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    try {
      final token = await getStoredToken();
      final isLoggedIn = token != null && token.isNotEmpty;
      print('Is logged in: $isLoggedIn'); // Debug log
      return isLoggedIn;
    } catch (e) {
      print('Error checking login status: $e'); // Debug log
      return false;
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(tokenKey);
      await prefs.remove(userDataKey);
      print('User logged out successfully'); // Debug log
    } catch (e) {
      print('Error during logout: $e'); // Debug log
      rethrow;
    }
  }
}
