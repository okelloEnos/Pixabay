part of 'gallery_bloc.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();
}

final class GalleryInitial extends GalleryState {
  @override
  List<Object> get props => [];
}

final class GalleryLoading extends GalleryState {
  @override
  List<Object> get props => [];
}

final class GalleryLoaded extends GalleryState {
  final List<PhotoEntity> photos;
  final bool? hasReachedMax;
  final bool? isSearching;

  const GalleryLoaded({
    required this.photos,
    this.hasReachedMax,
    this.isSearching,
  });

  GalleryLoaded copyWith({
    List<PhotoEntity>? photos,
    bool? hasReachedMax,
    bool? isSearching,
  }) {
    return GalleryLoaded(
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object?> get props => [photos, hasReachedMax, isSearching];
}

final class GalleryError extends GalleryState {
  final String message;

  const GalleryError({required this.message});

  @override
  List<Object> get props => [message];
}