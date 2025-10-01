part of 'gallery_bloc.dart';

sealed class GalleryEvent extends Equatable {
  const GalleryEvent();
}

final class FetchAllPhotosEvent extends GalleryEvent {
  final String? query;
  final int? page;
  final int? perPage;

  const FetchAllPhotosEvent({
    this.query,
    this.page,
    this.perPage,
  });

  @override
  List<Object?> get props => [query, page, perPage];
}

final class RefreshPhotosEvent extends GalleryEvent {
  final String? query;
  final int? page;
  final int? perPage;

  const RefreshPhotosEvent({
    this.query,
    this.page,
    this.perPage,
  });

  @override
  List<Object?> get props => [query, page, perPage];
}

final class LoadMorePhotosEvent extends GalleryEvent {
  final String? query;
  final int? page;
  final int? perPage;

  const LoadMorePhotosEvent({
    this.query,
    this.page,
    this.perPage,
  });

  @override
  List<Object?> get props => [query, page, perPage];
}

final class SearchPhotosEvent extends GalleryEvent {
  final String? query;
  final int? page;
  final int? perPage;

  const SearchPhotosEvent({
    this.query,
    this.page,
    this.perPage,
  });

  @override
  List<Object?> get props => [query, page, perPage];
}
