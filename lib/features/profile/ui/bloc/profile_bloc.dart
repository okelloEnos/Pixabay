import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixabay_web/features/profile/domain/entity/profile_entity.dart';
import 'package:pixabay_web/features/profile/domain/usecase/submit_user_info_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SubmitUserInfoUseCase _useCase;

  ProfileBloc({required SubmitUserInfoUseCase useCase}) : _useCase = useCase, super(ProfileInitial()) {
    on<SubmitUserInfoEvent>(_onSubmitUserInfo);
  }

  void _onSubmitUserInfo(SubmitUserInfoEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final result = await _useCase.call(profile: event.profile);
      emit(ProfileSuccess(id: result));
    } catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
    }
  }
}
