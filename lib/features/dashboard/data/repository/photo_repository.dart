import 'package:pixabay_web/features/dashboard/data/data_source/photo_remote_data_source.dart';
import 'package:pixabay_web/features/dashboard/data/model/photo_model.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource _remoteDataSource;

  PhotoRepositoryImpl({required PhotoRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<List<PhotoEntity>> fetchPhotos({required String? query, required int? page, required int? perPage}) async {
    List<PhotoEntity> photos = [];
    var results = await _remoteDataSource.fetchPhotos(query: query, page: page, perPage: perPage);
    photos = results.map((e) => PhotoModel.fromJson(e)).toList();
    return photos;
  }
}