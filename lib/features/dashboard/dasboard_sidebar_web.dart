// import 'package:britam/core/util/functions/check_dark_mode.dart';
// import 'package:britam/features/dashboard/presentation/widgets/web/dashboard/dashboard_sidebar_web_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/features/dashboard/dashboard_sidebar_web_content.dart';
import 'package:pixabay_web/features/sidebar/sidebar_bloc.dart';

class DashboardSidebarWeb extends StatefulWidget {
  final bool isSmall;

  const DashboardSidebarWeb({super.key, this.isSmall = false});

  @override
  State<DashboardSidebarWeb> createState() => _DashboardSidebarWebState();
}

class _DashboardSidebarWebState extends State<DashboardSidebarWeb> {
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
            child: DashboardSidebarWebContent(sidebarState: sidebarState));
      },
    );
  }
}
