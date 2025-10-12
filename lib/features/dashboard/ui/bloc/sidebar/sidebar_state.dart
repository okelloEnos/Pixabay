part of 'sidebar_bloc.dart';

sealed class SidebarState {}

final class SidebarCollapsed extends SidebarState {}

final class SidebarExpanded extends SidebarState {}
