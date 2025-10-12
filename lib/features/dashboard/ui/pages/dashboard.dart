import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixabay_web/core/widgets/media_query_functions.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/theme/pixabay_theme_cubit.dart';
import 'package:pixabay_web/features/dashboard/ui/widgets/dashboard_sidebar.dart';
import 'package:pixabay_web/features/dashboard/ui/widgets/dashboard_sidebar_content.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/sidebar/sidebar_bloc.dart';
import 'package:pixabay_web/features/dashboard/ui/widgets/theme_widget.dart';

class Dashboard extends StatelessWidget {
  final Widget child;

  const Dashboard({super.key, required this.child});

  Widget getDashboardTitle(
      {required int currentIndex, required BuildContext context}) {
    switch (currentIndex) {
      case 1:
        return Text("Gallery", style: Theme.of(context).textTheme.titleSmall);
      case 2:
        return Text("Profile", style: Theme.of(context).textTheme.titleSmall);
      case 0:
      default:
        return Text("Home", style: Theme.of(context).textTheme.titleSmall);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<SidebarBloc, SidebarState>(
        builder: (context, sidebarState) {
          if ((isTablet(context) || isMobile(context)) &&
              sidebarState is SidebarExpanded) {
            BlocProvider.of<SidebarBloc>(context).add(CollapseSidebarEvent());
          } else if (isDesktop(context) && sidebarState is SidebarCollapsed) {
            BlocProvider.of<SidebarBloc>(context).add(ExpandSidebarEvent());
          }

          return AnnotatedRegion(
            value: SystemUiOverlayStyle(
                statusBarColor: Theme.of(context).scaffoldBackgroundColor,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor:
                    Theme.of(context).colorScheme.onPrimary,
                systemNavigationBarIconBrightness: Brightness.dark),
            child: BlocBuilder<BottomNavBloc, BottomNavState>(
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  appBar: isMobile(context)
                      ? AppBar(
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          surfaceTintColor:
                              Theme.of(context).colorScheme.onPrimary,
                          elevation: 8,
                          toolbarHeight: 80,
                          title: getDashboardTitle(
                              currentIndex: state.currentIndex,
                              context: context),
                          leading: Builder(builder: (myContext) {
                            return MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () =>
                                    Scaffold.of(myContext).openDrawer(),
                                child: UnconstrainedBox(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/images/hamburger.svg',
                                        width: 20,
                                        height: 20,
                                        colorFilter: ColorFilter.mode(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        )
                      : null,
                  drawer: isMobile(context)
                      ? Drawer(
                          width: double.infinity,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          child: const DashboardSideBarContent())
                      : null,
                  body: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Theme.of(context).colorScheme.onTertiary,
                      // color: Colors.green,
                      child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              isMobile(context)
                                  ? const SizedBox.shrink()
                                  : const DashboardSideBar(),
                              Expanded(
                                child: Stack(
                                  children: [
                                    isMobile(context)
                                        ? child
                                        : Padding(
                                            padding: const EdgeInsets.only(top: 50),
                                            child: child),
                                    Positioned(
                                      top: 5.0,
                                      right: 0.0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Center(
                                          child: CustomThemeSwitch(
                                            isDarkMode: Theme.of(context).brightness == Brightness.dark,
                                            onChanged: (f){
                                              context.read<PixabayThemeCubit>().toggleTheme();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))),
                );
              },
            ),
          );
        },
      );
    });
  }
}
