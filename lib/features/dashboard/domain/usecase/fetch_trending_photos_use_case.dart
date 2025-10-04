import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/domain/repository/photo_repository.dart';

class FetchPhotosUseCase {
  final PhotoRepository _repository;

  FetchPhotosUseCase({required PhotoRepository repository})
      : _repository = repository;

  Future<List<PhotoEntity>> call({required String? query, required int? page, required int? perPage}) async {
    return await _repository.fetchPhotos(query: query ?? '', page: page ?? 1, perPage: perPage ?? 20);
  }
}