import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixabay_web/features/bottom_nav/bottom_nav_bloc.dart';
import 'package:pixabay_web/features/dashboard/dasboard_sidebar_web.dart';
import 'package:pixabay_web/features/dashboard/dashboard_appbar_web.dart';
import 'package:pixabay_web/features/dashboard/dashboard_sidebar_web_content.dart';
import 'package:pixabay_web/features/dashboard/web_footer.dart';
import '../../core/constants/screen_dimensions.dart';
import '../../core/widgets/media_query_functions.dart';
import '../sidebar/sidebar_bloc.dart';

class DashboardWeb extends StatefulWidget {
  final Widget child;
  final double maxWidth;

  const DashboardWeb({super.key, required this.child, required this.maxWidth});

  @override
  State<DashboardWeb> createState() => _DashboardWebState();
}

class _DashboardWebState extends State<DashboardWeb> {

  @override
  void initState() {
    super.initState();
  }

  Widget getDashboardTitle({required int currentIndex}) {
    switch (currentIndex) {
      case 1:
        return Text("Gallery",
            style: Theme.of(context).textTheme.titleSmall);
      case 2:
        return Text("Profile", style: Theme.of(context).textTheme.titleSmall);
      case 0:
      default:
        return Text("Home", style: Theme.of(context).textTheme.titleSmall);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarBloc, SidebarState>(
      builder: (context, sidebarState) {
        if ((isTablet(context) || isMobile(context)) && sidebarState is SidebarExpanded) {
          BlocProvider.of<SidebarBloc>(context).add(CollapseSidebarEvent());
        }
        else if (isDesktop(context) && sidebarState is SidebarCollapsed) {
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
                appBar: widget.maxWidth <= webSmall
                    ? AppBar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        surfaceTintColor:
                            Theme.of(context).colorScheme.onPrimary,
                        elevation: 8,
                        toolbarHeight: 80,
                        title: getDashboardTitle(
                            currentIndex: state.currentIndex),
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
                drawer: widget.maxWidth <= webSmall
                    ? Drawer(
                        width: double.infinity,
                        backgroundColor:
                            Theme.of(context).colorScheme.primary,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: const DashboardSidebarWebContent())
                    : null,
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: Align(
                    alignment: Alignment.center,
                            child: Row(
                              children: [
                                //  sidebar
                                widget.maxWidth <= webSmall
                                    ? const SizedBox.shrink()
                                    : const DashboardSidebarWeb(),

                                //  main content
                                Expanded(
                                  child: widget.maxWidth <= webSmall
                                      ? widget.child
                                      : Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          top: 30),
                                      child: widget.child),),
                              ],
                            ))
                ),
              );
            },
          ),
        );
      },
    );
  }
}
