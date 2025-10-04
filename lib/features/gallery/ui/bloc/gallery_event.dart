part of 'gallery_bloc.dart';

sealed class GalleryEvent extends Equatable {
  const GalleryEvent();
}

class FetchAllPhotosEvent extends GalleryEvent {
  final String? query;

  const FetchAllPhotosEvent({this.query});

  @override
  List<Object?> get props => [query];
}

class RefreshPhotosEvent extends GalleryEvent {
  final String? query;

  const RefreshPhotosEvent({this.query});

  @override
  List<Object?> get props => [query];
}

final class SearchPhotosEvent extends GalleryEvent {
  final String? query;

  const SearchPhotosEvent({
    this.query,
  });

  @override
  List<Object?> get props => [query];
}
