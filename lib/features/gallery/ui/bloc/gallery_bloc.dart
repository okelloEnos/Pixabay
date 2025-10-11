import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/domain/usecase/fetch_trending_photos_use_case.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

part 'gallery_event.dart';

part 'gallery_state.dart';

EventTransformer<E> debounce<E>(Duration d) {
  return (events, mapper) => events.debounceTime(d).switchMap(mapper);
}

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();

  int perPage = 20;
  int pageNo = 1;
  List<PhotoEntity> allPhotos = [];

  final FetchPhotosUseCase _useCase;

  String latestQuery = "";

  GalleryBloc({required FetchPhotosUseCase useCase})
      : _useCase = useCase,
        super(GalleryInitial()) {
    on<FetchAllPhotosEvent>(_onFetchAllPhotos);
    on<RefreshPhotosEvent>(
      _onRefreshAllPhotos,
      transformer: debounce(const Duration(seconds: 1)),
    );

    Future.microtask(() => add(const FetchAllPhotosEvent()));

    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        if (state is GalleryLoaded) {
          Fluttertoast.showToast(msg: "Loading more photos : $latestQuery");
          add(FetchAllPhotosEvent(query: latestQuery));
        }
      }

      // if (scrollController.offset <=
      //         scrollController.position.minScrollExtent &&
      //     !scrollController.position.outOfRange) {
      //   Fluttertoast.showToast(msg: "Reached top: $latestQuery");
      //   add(RefreshPhotosEvent(query: latestQuery));
      // }
    });
  }

  Future<void> _onFetchAllPhotos(
      FetchAllPhotosEvent event, Emitter<GalleryState> emit) async {
    bool hasReachedMax = false;
    bool isSearch = (event.query ?? "").isNotEmpty;
    if (state is GalleryInitial || state is GalleryError) {
      emit(GalleryLoading());
    }

    try {
      latestQuery = event.query ?? "";
      List<PhotoEntity> photos = await _useCase.call(
          query: event.query ?? "", page: pageNo, perPage: perPage);
      allPhotos = [...allPhotos, ...photos];

      if (photos.length < perPage) {
        hasReachedMax = true;
        refreshController.loadNoData();
      } else {
        pageNo = pageNo + 1;

        if (state is GalleryLoaded) {
          refreshController.loadComplete();
        }
      }

      emit(GalleryLoaded(
          photos: allPhotos,
          hasReachedMax: hasReachedMax,
          isSearching: isSearch));
    } on DioException catch (e) {
      refreshController.loadFailed();
      emit(GalleryError(message: e.toString()));
    } catch (e) {
      refreshController.loadFailed();
      emit(GalleryError(message: e.toString()));
    }
  }

  void _onRefreshAllPhotos(
      RefreshPhotosEvent event, Emitter<GalleryState> emit) {
    pageNo = 1;
    allPhotos = [];
    emit(GalleryInitial());
    latestQuery = event.query ?? "";
    add(FetchAllPhotosEvent(query: event.query));
    refreshController.refreshCompleted();
  }
}
