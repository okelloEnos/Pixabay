import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/gallery/domain/usecase/gallery_photo_use_case.dart';

part 'gallery_event.dart';

part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final int perPage = 20;
  int currentPage = 1;
  bool isLoading = false;
  String currentQuery = '';

  final GalleryPhotoUseCase _useCase;

  GalleryBloc({required GalleryPhotoUseCase useCase})
      : _useCase = useCase,
        super(GalleryInitial()) {
    Future.microtask(() => add(const FetchAllPhotosEvent()));
    on<FetchAllPhotosEvent>(_onFetchingPhotos);
    // 2) then fire initial event (microtask avoids re-entrancy issues)
    // Future.microtask(() => add(const FetchAllPhotosEvent()));
    // add(const FetchAllPhotosEvent());
  }

  void _onFetchingPhotos(
      FetchAllPhotosEvent event, Emitter<GalleryState> emit) async {
    emit(GalleryLoading());
    try {
      var photos = await _useCase(
        query: event.query ?? '',
        page: currentPage,
        perPage: perPage,
      );
      if (photos.isNotEmpty) {
        currentPage++;
        emit(GalleryLoaded(photos: photos, hasReachedMax: false));
      } else {
        emit(GalleryLoaded(photos: photos, hasReachedMax: true));
      }
    } catch (e) {
      emit(GalleryError(message: e.toString()));
    }
  }
}
