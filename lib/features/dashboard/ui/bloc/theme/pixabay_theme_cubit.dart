import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class PixabayThemeCubit extends Cubit<PixabayAppTheme> {
  PixabayThemeCubit() : super(PixabayAppTheme.light);

  void toggleTheme() {
    if (state == PixabayAppTheme.light) {
      emit(PixabayAppTheme.dark);
    } else {
      emit(PixabayAppTheme.light);
    }
  }
}

enum PixabayAppTheme { light, dark }
