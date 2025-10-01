part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

// final class ToggleBottomNav extends BottomNavEvent {
//   final int currentIndex;
//
//   ToggleBottomNav({required this.currentIndex});
// }

final class ToggleSearch extends BottomNavEvent {
  final bool isActive;
  final int currentIndex;

  ToggleSearch({this.isActive = false, required this.currentIndex});
}
