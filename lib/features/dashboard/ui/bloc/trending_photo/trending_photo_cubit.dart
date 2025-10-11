import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/domain/usecase/fetch_trending_photos_use_case.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/trending_photo/trending_photo_event.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'trending_photo_state.dart';

class TrendingPhotoBloc extends Bloc<TrendingPhotoEvent, TrendingPhotoState> {
  final FetchPhotosUseCase _useCase;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();
  int perPage = 20;
  int pageNo = 1;
  List<PhotoEntity> allPhotos = [];

  TrendingPhotoBloc({required FetchPhotosUseCase useCase})
      : _useCase = useCase,
        super(TrendingPhotoInitial()) {
    on<FetchTrendingPhotos>(_onFetchTrendingPhotos);
    on<RefreshTrendingPhotos>(_onRefreshTrendingPhotos);

    add(FetchTrendingPhotos());

    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        if (state is TrendingPhotoLoaded) {
          Fluttertoast.showToast(msg: "Loading more photos");
          add(FetchTrendingPhotos());
        }
      }

      // if (scrollController.offset <=
      //         scrollController.position.minScrollExtent &&
      //     !scrollController.position.outOfRange) {
      //   Fluttertoast.showToast(msg: "Reached top");
      //   add(RefreshTrendingPhotos());
      // }
    });
  }

  Future<void> _onFetchTrendingPhotos(
      FetchTrendingPhotos event, Emitter<TrendingPhotoState> emit) async {
    bool hasReachedMax = false;
    if (state is TrendingPhotoInitial || state is TrendingPhotoError) {
      emit(TrendingPhotoLoading());
    }

    try {
      List<PhotoEntity> photos =
          await _useCase.call(query: 'popular', page: pageNo, perPage: perPage);
      allPhotos = [...allPhotos, ...photos];

      if (photos.length < perPage) {
        hasReachedMax = true;
        refreshController.loadNoData();
      } else {
        pageNo = pageNo + 1;

        if (state is TrendingPhotoLoaded) {
          refreshController.loadComplete();
        }
      }

      emit(
          TrendingPhotoLoaded(photos: allPhotos, hasReachedMax: hasReachedMax));
    } on DioException catch (e) {
      refreshController.loadFailed();
      emit(TrendingPhotoError(message: e.toString()));
    } catch (e) {
      refreshController.loadFailed();
      emit(TrendingPhotoError(message: e.toString()));
    }
  }

  void _onRefreshTrendingPhotos(
      RefreshTrendingPhotos event, Emitter<TrendingPhotoState> emit) {
    pageNo = 1;
    allPhotos = [];
    emit(TrendingPhotoInitial());
    add(FetchTrendingPhotos());
    refreshController.refreshCompleted();
  }
}
