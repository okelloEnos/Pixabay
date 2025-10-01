import 'package:pixabay_web/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<int> saveUserInformation({required ProfileEntity profile});
}