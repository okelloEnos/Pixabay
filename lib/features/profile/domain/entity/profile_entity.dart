import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable{
  final int? id;
  final String? fullName;
  final String? email;
  final String? favouriteCategory;
  final String? password;

  const ProfileEntity({
    this.id,
    this.fullName,
    this.email,
    this.favouriteCategory,
    this.password,
  });

  @override
  List<Object?> get props => [id, fullName, email, favouriteCategory, password];

}