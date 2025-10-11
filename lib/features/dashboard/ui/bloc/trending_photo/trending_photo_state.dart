part of 'trending_photo_cubit.dart';

sealed class TrendingPhotoState extends Equatable {
  const TrendingPhotoState();
}

final class TrendingPhotoInitial extends TrendingPhotoState {
  @override
  List<Object> get props => [];
}

final class TrendingPhotoLoading extends TrendingPhotoState {
  @override
  List<Object> get props => [];
}

final class FetchingMoreTrendingPhoto extends TrendingPhotoState {
  @override
  List<Object> get props => [];
}

final class TrendingPhotoLoaded extends TrendingPhotoState {
  final List<PhotoEntity> photos;
  final bool hasReachedMax;
  final bool? isFetchingMore;

  const TrendingPhotoLoaded({required this.photos, required this.hasReachedMax, this.isFetchingMore});

  TrendingPhotoLoaded copyWith({
    List<PhotoEntity>? photos,
    bool? hasReachedMax,
    bool? isFetchingMore,
  }) {
    return TrendingPhotoLoaded(
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }

  @override
  List<Object> get props => [photos, hasReachedMax, isFetchingMore ?? false];
}

final class TrendingPhotoError extends TrendingPhotoState {
  final String message;

  const TrendingPhotoError({required this.message});

  @override
  List<Object> get props => [message];
}

