part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState extends Equatable {
  final int currentIndex;

  const BottomNavState({required this.currentIndex});
}

final class CurrentIndex extends BottomNavState {
  const CurrentIndex({required super.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}

final class SearchActive extends BottomNavState {
  const SearchActive({required super.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}


final class SearchInActive extends BottomNavState {
  const SearchInActive({required super.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}

