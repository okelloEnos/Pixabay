import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';

part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const SearchInActive(currentIndex: 0)) {
    // on<ToggleBottomNav>(
    //     (event, emit) => emit(CurrentIndex(currentIndex: event.currentIndex)));

    on<ToggleSearch>((event, emit) => emit(event.isActive
        ? SearchActive(currentIndex: event.currentIndex)
        : SearchInActive(currentIndex: event.currentIndex)));
  }
}
