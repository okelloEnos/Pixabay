import 'package:get_it/get_it.dart';
import 'package:pixabay_web/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:pixabay_web/features/profile/data/repository/profile_repository.dart';
import 'package:pixabay_web/features/profile/domain/repository/profile_repository.dart';
import 'package:pixabay_web/features/profile/domain/usecase/submit_user_info_use_case.dart';
import 'package:pixabay_web/features/profile/ui/bloc/profile_bloc.dart';

void invokeProfileDI({required GetIt locator}) {
  // data source
  locator.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(dio: locator()));

  // repository
  locator.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remoteDataSource: locator()));

  // use case
  locator.registerLazySingleton(
      () => SubmitUserInfoUseCase(repository: locator()));

  // bloc
  locator.registerFactory(() => ProfileBloc(useCase: locator()));
}
