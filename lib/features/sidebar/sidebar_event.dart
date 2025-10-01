part of 'sidebar_bloc.dart';

@immutable
sealed class SidebarEvent {}

final class ToggleSidebarEvent extends SidebarEvent {}

final class ExpandSidebarEvent extends SidebarEvent {}

final class CollapseSidebarEvent extends SidebarEvent {}
