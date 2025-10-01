import 'package:pixabay_web/features/profile/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity{
  const ProfileModel({
    super.id,
    super.fullName,
    super.email,
    super.favouriteCategory,
    super.password,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      favouriteCategory: json['favouriteCategory'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'favouriteCategory': favouriteCategory,
      'password': password,
    };
  }

  factory ProfileModel.fromEntity({required ProfileEntity entity}){
    return ProfileModel(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      favouriteCategory: entity.favouriteCategory,
      password: entity.password,
    );
  }
}