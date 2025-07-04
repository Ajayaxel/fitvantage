//lib/services/api_service.dart
import 'package:dio/dio.dart';
import '../utils/api_exception.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://fitvantage.io/api/v1/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  static Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(e.response?.data['message'] ?? 'Server Error');
      } else {
        throw ApiException(e.message ?? 'Unknown Error');
      }
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }
}
