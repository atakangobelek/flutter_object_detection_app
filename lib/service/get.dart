import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(); // Dio nesnesini oluşturuyoruz

  Future<dynamic> fetchData(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Network error: $error');
    }
  }
}
