import 'package:flutter_bloc/flutter_bloc.dart';

part 'sidebar_event.dart';

part 'sidebar_state.dart';

class SidebarBloc extends Bloc<SidebarEvent, SidebarState> {
  SidebarBloc() : super(SidebarExpanded()) {
    on<ToggleSidebarEvent>(_toggleSidebar);
    on<ExpandSidebarEvent>(_expandSidebar);
    on<CollapseSidebarEvent>(_collapseSidebar);
  }

  Future<void> _toggleSidebar(
          ToggleSidebarEvent event, Emitter<SidebarState> emit) async =>
      state is SidebarExpanded
          ? emit(SidebarCollapsed())
          : emit(SidebarExpanded());

  Future<void> _expandSidebar(
          ExpandSidebarEvent event, Emitter<SidebarState> emit) async =>
      emit(SidebarExpanded());

  Future<void> _collapseSidebar(
          CollapseSidebarEvent event, Emitter<SidebarState> emit) async =>
      emit(SidebarCollapsed());
}
