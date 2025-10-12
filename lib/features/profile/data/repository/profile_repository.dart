import 'package:pixabay_web/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:pixabay_web/features/profile/data/model/profile_model.dart';
import 'package:pixabay_web/features/profile/domain/entity/profile_entity.dart';
import 'package:pixabay_web/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl({required ProfileRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<int> saveUserInformation({required ProfileEntity profile}) async {
    return await _remoteDataSource.saveUserInformation(
        profile: ProfileModel.fromEntity(entity: profile));
  }
}
