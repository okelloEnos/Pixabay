import "package:envied/envied.dart";

part 'Api.g.dart';

@Envied(path: 'api.env')
abstract class Api {

  static const String pixabayBaseUrl = "https://pixabay.com/";

  static const String jsonBaseUrl = "https://jsonplaceholder.typicode.com/";

  /// ACCESS KEY
  @EnviedField(varName: 'ACCESS_KEY', defaultValue: '', obfuscate: true)
  static final String accessKey = _Api.accessKey;

}
