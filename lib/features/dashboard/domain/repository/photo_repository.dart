import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';

abstract class PhotoRepository {
  Future<List<PhotoEntity>> fetchPhotos(
      {required String query, required int page, required int perPage});
}
