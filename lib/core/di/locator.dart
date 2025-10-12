import 'package:get_it/get_it.dart';
import 'package:pixabay_web/core/di/core_di.dart';
import 'package:pixabay_web/core/di/photos_di.dart';
import 'package:pixabay_web/core/di/profile_di.dart';

final locator = GetIt.instance;

Future<void> setUpLocator({String? myBaseUrl}) async {
  await invokeCoreDI(locator: locator);
  invokeProfileDI(locator: locator);
  invokePhotosDI(locator: locator);
}
