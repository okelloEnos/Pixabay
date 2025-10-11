import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pixabay_web/core/util/Api.dart';

Future<void> invokeCoreDI({required GetIt locator}) async {
  /// DIO
  locator.registerLazySingleton<Dio>(() {
    return Dio(BaseOptions(
      baseUrl: Api.pixabayBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(minutes: 5),
      sendTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
      contentType: 'application/json',
    ));
  });
}
