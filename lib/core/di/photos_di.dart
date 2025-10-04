

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pixabay_web/features/dashboard/data/data_source/photo_remote_data_source.dart';
import 'package:pixabay_web/features/dashboard/data/repository/photo_repository.dart';
import 'package:pixabay_web/features/dashboard/domain/repository/photo_repository.dart';
import 'package:pixabay_web/features/dashboard/domain/usecase/fetch_trending_photos_use_case.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/trending_photo_cubit.dart';
import 'package:pixabay_web/features/gallery/domain/usecase/gallery_photo_use_case.dart';
import 'package:pixabay_web/features/gallery/ui/bloc/gallery_bloc.dart';

void invokePhotosDI({required GetIt locator}) {
  // data source
  locator.registerLazySingleton<PhotoRemoteDataSource>(
          () => PhotoRemoteDataSourceImpl(dio: locator<Dio>()));

  // repository
  locator.registerLazySingleton<PhotoRepository>(
          () => PhotoRepositoryImpl(remoteDataSource: locator<PhotoRemoteDataSource>()));

  // use case
  locator.registerLazySingleton(() => FetchPhotosUseCase(repository: locator<PhotoRepository>()));
  locator.registerLazySingleton(() => GalleryPhotoUseCase(repository: locator<PhotoRepository>()));

  // bloc & cubit
  locator.registerFactory(
          () => TrendingPhotoBloc(useCase: locator<FetchPhotosUseCase>()));
  locator.registerFactory(
          () => GalleryBloc(useCase: locator<FetchPhotosUseCase>()));

}
