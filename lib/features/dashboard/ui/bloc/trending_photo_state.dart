part of 'trending_photo_cubit.dart';

sealed class TrendingPhotoState extends Equatable {
  const TrendingPhotoState();
}

final class TrendingPhotoInitial extends TrendingPhotoState {
  @override
  List<Object> get props => [];
}
