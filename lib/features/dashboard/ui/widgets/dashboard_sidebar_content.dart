import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pixabay_web/core/widgets/media_query_functions.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:pixabay_web/features/dashboard/data/model/bottom_bar_model.dart';
import 'package:pixabay_web/features/dashboard/ui/widgets/sidebar_item.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/sidebar/sidebar_bloc.dart';

class DashboardSideBarContent extends StatefulWidget {
  final SidebarState? sidebarState;

  const DashboardSideBarContent({super.key, this.sidebarState});

  @override
  State<DashboardSideBarContent> createState() =>
      _DashboardSideBarContentState();
}

class _DashboardSideBarContentState
    extends State<DashboardSideBarContent> {
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 28.0, right: 16.0, top: 8.0),
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
                        NavigationTappedEvent(currentIndex: 0));
                  },
                  child: UnconstrainedBox(
                    child:  widget.sidebarState is SidebarCollapsed ? Image.asset(
                      'assets/images/pixabay_short.png',
                      width: 50,
                      height: 50) : Image.asset(
                      'assets/images/pixabay.png',
                      width: 150,
                      height: 150, color: Colors.white),
                  ),
                ),
              ),
              isMobile(context) ? IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: Icon(CupertinoIcons.clear_circled,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 32)) : const SizedBox.shrink()
            ],
          ),
        ),
        const SizedBox(height: 16.0),
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
                                NavigationTappedEvent(currentIndex: index));
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
