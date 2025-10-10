// import 'package:britam/core/core_barrel.dart';
// import 'package:britam/core/presentation/common_widgets/show_snackbar.dart';
// import 'package:britam/features/dashboard/presentation/bloc/sidebar/sidebar_bloc.dart';
// import 'package:britam/features/dashboard/presentation/widgets/web/dashboard/sidebar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pixabay_web/core/constants/colors.dart';
import 'package:pixabay_web/features/bottom_nav/bottom_nav_bloc.dart';
import 'package:pixabay_web/features/dashboard/bottom_bar_model.dart';
import 'package:pixabay_web/features/dashboard/sidebar_item.dart';
import 'package:pixabay_web/features/sidebar/sidebar_bloc.dart';

class DashboardSidebarWebContent extends StatefulWidget {
  final SidebarState? sidebarState;

  const DashboardSidebarWebContent({super.key, this.sidebarState});

  @override
  State<DashboardSidebarWebContent> createState() =>
      _DashboardSidebarWebContentState();
}

class _DashboardSidebarWebContentState
    extends State<DashboardSidebarWebContent> {
  late final List<BottomBarModel> bottomNavItems;

  @override
  void initState() {
    super.initState();
    bottomNavItems = const <BottomBarModel>[
      BottomBarModel(icon: 'assets/images/dashboard.png', label: 'Dashboard'),
      BottomBarModel(
          icon: 'assets/images/gallery.png', label: 'Gallery'),
      BottomBarModel(
          icon: 'assets/images/user.png', label: 'Profile'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  logo
        Visibility(
          visible: widget.sidebarState == null
              ? true
              : widget.sidebarState is SidebarExpanded,
          child: widget.sidebarState == null
              ? Padding(
            padding:
            const EdgeInsets.only(left: 35.0, right: 16.0, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      context.go('/home');
                      BlocProvider.of<BottomNavBloc>(context).add(
                          ToggleSearch(
                              isActive: false, currentIndex: 0));
                    },
                    child: UnconstrainedBox(
                      child: Image.asset(
                          'assets/images/pixabay.png',
                          width: 45,
                          height: 45),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: Icon(Icons.close_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 32))
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 30),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  context.go('/home');
                  BlocProvider.of<BottomNavBloc>(context).add(
                      ToggleSearch(isActive: false, currentIndex: 0));
                },
                child: UnconstrainedBox(
                  child: Image.asset(
                      'assets/images/pixabay.png',
                      width: 45,
                      height: 45),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 32),

        //  dashboard links
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) =>
                    BlocConsumer<BottomNavBloc, BottomNavState>(
                      listener: (context, state) {
                        switch (state.currentIndex) {
                          case 0:
                            context.goNamed('home');
                            break;
                          case 1:
                            context.goNamed('gallery');
                            break;
                          case 2:
                            context.goNamed('profile');
                            break;
                        }

                        if (widget.sidebarState == null) {
                          Scaffold.of(context).closeDrawer();
                        }
                      },
                      builder: (context, state) {
                        final uri = Uri.base;
                        final path = uri.toString().toLowerCase();


                        return SideBarItem(
                          bottomBarModel: bottomNavItems[index],
                          isActive: index == state.currentIndex,
                          isCollapsed: widget.sidebarState == null
                              ? false
                              : widget.sidebarState is SidebarCollapsed,
                          onTap: () {
                            BlocProvider.of<BottomNavBloc>(context).add(
                                ToggleSearch(
                                    isActive: false, currentIndex: index));
                          },
                        );
                      },
                    ),
                itemCount: bottomNavItems.length,
                physics: const BouncingScrollPhysics())),
      ],
    );
  }
}
