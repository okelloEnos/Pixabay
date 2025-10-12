part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

final class SubmitUserInfoEvent extends ProfileEvent {
  final ProfileEntity profile;

  const SubmitUserInfoEvent({required this.profile});

  @override
  List<Object?> get props => [profile];
}
