part of 'bottom_nav_bloc.dart';

sealed class BottomNavState extends Equatable {
  final int currentIndex;

  const BottomNavState({required this.currentIndex});
}

final class SelectedTab extends BottomNavState {
  const SelectedTab({required super.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
