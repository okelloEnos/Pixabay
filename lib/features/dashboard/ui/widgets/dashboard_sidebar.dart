import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/features/dashboard/ui/widgets/dashboard_sidebar_content.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/sidebar/sidebar_bloc.dart';

class DashboardSideBar extends StatefulWidget {
  const DashboardSideBar({super.key});

  @override
  State<DashboardSideBar> createState() => _DashboardSideBarState();
}

class _DashboardSideBarState extends State<DashboardSideBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarBloc, SidebarState>(
      builder: (context, sidebarState) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
            width: sidebarState is SidebarExpanded ? 300 : 100,
            height: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: DashboardSideBarContent(sidebarState: sidebarState));
      },
    );
  }
}
