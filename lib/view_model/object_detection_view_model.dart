/* final getOrderListProvider =
    FutureProvider.autoDispose<List<GetOrderlistModel>>((ref) async {
  final apiService = ApiService();
  final _companyIdAsyncValue = await CompanyIdStorageLandingService().getCompanyIdData();
  Response response;
  try {
    response = await apiService.get(url: ApiUrls.order(_companyIdAsyncValue));
  } catch (e) {
    if (e is DioException) {
      if (e.response?.statusCode != 200) {
        ref.read(navigatorKeyProvider).currentState!.pushNamed("/login");
      }
    }
    rethrow;
  }
  List<GetOrderlistModel> _orderList = [];
  if (response.data['order'] != null) {
    _orderList = (response.data['order'] as List)
        .map((e) => GetOrderlistModel.fromMap(e))
        .toList();
  }
  return _orderList;
}); */

/* import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_video/utils/map.dart';

import '../model/object_detectio_model.dart';

final videoProvider = StateProvider<List<VideoModel>>(
  (ref) {
    List dummyData = DummyData.dummyData;
    List<VideoModel> videoModel = [];
    if (dummyData != null) {
      videoModel =
          (dummyData as List).map((e) => VideoModel.fromMap(e)).toList();
    }
    return videoModel;
  },
);
 */




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