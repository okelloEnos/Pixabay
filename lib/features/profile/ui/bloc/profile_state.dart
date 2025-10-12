part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileSuccess extends ProfileState {
  final int id;

  const ProfileSuccess({required this.id});

  @override
  List<Object> get props => [id];
}

final class ProfileFailure extends ProfileState {
  final String errorMessage;

  const ProfileFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
