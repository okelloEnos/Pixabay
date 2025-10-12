part of 'bottom_nav_bloc.dart';

sealed class BottomNavEvent {}

final class NavigationTappedEvent extends BottomNavEvent {
  final int currentIndex;

  NavigationTappedEvent({required this.currentIndex});
}
