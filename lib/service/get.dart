import 'package:dio/dio.dart';
import 'package:flutter_video/utils/map.dart';

class ApiService {
  final Dio _dio = Dio(); 

  Future<List<dynamic>> fetchData(String endpoint) async {
    try {
      final response =  DummyData.dummyData;

      if (response != null) {
        return response;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Network error: $error');
    }
  }
}
