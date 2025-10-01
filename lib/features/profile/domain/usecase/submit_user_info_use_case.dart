import 'package:pixabay_web/features/profile/domain/entity/profile_entity.dart';
import 'package:pixabay_web/features/profile/domain/repository/profile_repository.dart';

class SubmitUserInfoUseCase {
  final ProfileRepository _repository;

  SubmitUserInfoUseCase({required ProfileRepository repository})
      : _repository = repository;

  Future<int> call({required ProfileEntity profile}) async {
    return await _repository.saveUserInformation(profile: profile);
  }
}