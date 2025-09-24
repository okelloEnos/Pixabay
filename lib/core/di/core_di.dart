import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pixabay_web/core/util/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> invokeCoreDI({required GetIt locator}) async {

  /// Zoom Drawer
  // locator.registerLazySingleton<ZoomDrawerController>(() => ZoomDrawerController());

  /// Shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  /// DIO
  locator.registerLazySingleton<Dio>(() {
    return Dio(BaseOptions(
        baseUrl: Api.pixabayBaseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 5),
        sendTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5),
        contentType: 'application/json',
        headers: {
          // 'Authorization':
          //     'Bearer ${locator<SharedPreferencesUtil>().getValidToken()}',
          'ngrok-skip-browser-warning': true
        }));
  });

}
