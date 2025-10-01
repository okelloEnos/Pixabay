import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/domain/usecase/fetch_trending_photos_use_case.dart';

part 'trending_photo_state.dart';

class TrendingPhotoCubit extends Cubit<List<PhotoEntity>> {
  final int perPage = 20;
  int currentPage = 1;
  bool isLoading = false;
  String currentQuery = '';
  final FetchTrendingPhotosUseCase _useCase;

  TrendingPhotoCubit({required FetchTrendingPhotosUseCase useCase}) : _useCase = useCase, super([]){
    fetchPhotos();
  }

  Future<void> fetchPhotos({String? query, bool isRefresh = false}) async {
    if (isLoading) return;
    isLoading = true;

    if (isRefresh) {
      currentPage = 1;
      currentQuery = query ?? '';
      emit([]);
    } else {
      if (query != null && query != currentQuery) {
        currentPage = 1;
        currentQuery = query;
        emit([]);
      }
    }

    try {
      final photos = await _useCase(
        query: currentQuery,
        page: currentPage,
        perPage: perPage,
      );
      if (photos.isNotEmpty) {
        currentPage++;
        emit([...state, ...photos]);
      }
    } catch (e) {
      // Handle error appropriately, e.g., log it or emit an error state
    } finally {
      isLoading = false;
    }
  }
}
