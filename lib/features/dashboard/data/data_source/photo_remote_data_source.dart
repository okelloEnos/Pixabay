import 'package:dio/dio.dart';
import 'package:pixabay_web/core/util/Api.dart';

abstract class PhotoRemoteDataSource {
  Future<List<dynamic>> fetchPhotos({required String? query, required int? page, required int? perPage});
}

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  final Dio _dio;

  PhotoRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<dynamic>> fetchPhotos({required String? query, required int? page, required int? perPage}) async {
    var url = "${Api.pixabayBaseUrl}/api/?key=${Api.accessKey}&q=$query&page=$page&per_page=$perPage";
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data['hits'];
    } else {
      throw 'Failed to load photos';
    }
  }
}