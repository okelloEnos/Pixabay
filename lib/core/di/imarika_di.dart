// import 'package:britam/features/imarika_investment/domain/usecases/client_onboarding_use_case.dart';
// import 'package:britam/features/imarika_investment/presentation/bloc/imarika_purchase_bloc.dart';
// import 'package:britam/features/soma_sure/domain/usecases/fetch_benefits_use_case.dart';
// import 'package:britam/features/soma_sure/presentation/bloc/fetch_benefits_bloc.dart';
// import 'package:get_it/get_it.dart';
// import '../../features/features_barrel.dart';
// import '../../features/imarika_investment/data/datasources/imarika_remote_data_source.dart';
// import '../../features/imarika_investment/data/repository/imarika_repository.dart';
// import '../../features/imarika_investment/domain/repository/imarika_repository.dart';
// import '../../features/imarika_investment/domain/usecases/generate_quote_use_case.dart';
// import '../../features/imarika_investment/domain/usecases/max_min_use_case.dart';
// import '../../features/imarika_investment/domain/usecases/supported_frequency_use_case.dart';
// import '../../features/imarika_investment/domain/usecases/supported_years_use_case.dart';
// import '../../features/imarika_investment/presentation/bloc/amounts_bloc.dart';
// import '../../features/imarika_investment/presentation/bloc/imarika_quote_bloc.dart';
// import '../../features/imarika_investment/presentation/bloc/supported_frequency_bloc.dart';
// import '../../features/imarika_investment/presentation/bloc/supported_years_bloc.dart';
//
// void invokeImarikaDI({required GetIt locator}) {
//   // data source
//   locator.registerLazySingleton<ImarikaRemoteDataSource>(
//           () => ImarikaRemoteDataSourceImpl(dio: locator()));
//
//   // repository
//   locator.registerLazySingleton<ImarikaRepository>(
//           () => ImarikaRepositoryImpl(imarikaRemoteDataSource: locator()));
//
//   // use case
//   locator.registerLazySingleton(() => MaxMinUseCase(repository: locator()));
//   locator.registerLazySingleton(() => SupportedFrequencyUseCase(repository: locator()));
//   locator.registerLazySingleton(() => SupportedYearsUseCase(repository: locator()));
//   locator.registerLazySingleton(() => GenerateImarikaQuoteUseCase(repository: locator()));
//   locator.registerLazySingleton(() => ClientOnBoardingUseCase(repository: locator()));
//   locator.registerLazySingleton(() => FetchBenefitsUseCase(repository: locator()));
//
//   // bloc
//   // locator.registerLazySingleton(
//   //     () => ImarikaQuoteBloc(useCase: locator()));
//   // locator.registerLazySingleton(
//   //         () => ImarikaPurchaseBloc(clientOnBoardingUseCase: locator(), quoteUseCase: locator()));
//   // locator.registerLazySingleton(
//   //         () => AmountsBloc(maxMinUseCase: locator()));
//   // locator.registerLazySingleton(
//   //         () => SupportedFrequencyBloc(supportedFrequencyUseCase: locator()));
//   // locator.registerLazySingleton(
//   //         () => SupportedYearsBloc(supportedYearsUseCase: locator()));
//   //   locator.registerLazySingleton(
//   //         () => FetchBenefitsBloc(useCase: locator()));
//
//   locator.registerFactory(
//           () => ImarikaQuoteBloc(useCase: locator()));
//   locator.registerFactory(
//           () => ImarikaPurchaseBloc(clientOnBoardingUseCase: locator(), quoteUseCase: locator()));
//   locator.registerFactory(
//           () => AmountsBloc(maxMinUseCase: locator()));
//   locator.registerFactory(
//           () => SupportedFrequencyBloc(supportedFrequencyUseCase: locator()));
//   locator.registerFactory(
//           () => SupportedYearsBloc(supportedYearsUseCase: locator()));
//   locator.registerFactory(
//           () => FetchBenefitsBloc(useCase: locator()));
//
// }
