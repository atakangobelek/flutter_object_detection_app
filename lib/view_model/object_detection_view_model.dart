import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/object_detectio_model.dart';
import '../service/get.dart';

final objectProvider =
    FutureProvider.autoDispose<List<VideoModel>>((ref) async {
  final apiService = ApiService();

  List<dynamic> response;

  try {
    response = await apiService.fetchData('');               //Dummy Data come from ApiService
  } catch (e) {
    if (e is DioException) {
    }
    rethrow;
  }

  List<VideoModel> _objectList = [];
  if (response != null) {
    _objectList = (response as List)
        .map((e) => VideoModel.fromMap(e))
        .toList();
  }
  return _objectList;
});