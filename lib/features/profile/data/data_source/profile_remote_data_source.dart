import 'package:dio/dio.dart';
import 'package:pixabay_web/core/util/Api.dart';
import 'package:pixabay_web/features/profile/data/model/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<int> saveUserInformation({required ProfileModel profile});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _dio;

  ProfileRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<int> saveUserInformation({required ProfileModel profile}) async {
    var url = "${Api.jsonBaseUrl}/posts";
    var data = {
      "fullName": profile.fullName,
      "email": profile.email,
      "favouriteCategory": profile.favouriteCategory,
      "password": profile.password,
    };
    final response = await _dio.post(url, data: data);
    if (response.statusCode == 201) {
      return response.data['id'];
    } else {
      throw 'Failed to save user information';
    }
  }
}
