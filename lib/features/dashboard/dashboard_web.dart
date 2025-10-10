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
        if ((isTablet(context) || isMobile(context)) &&
            sidebarState is SidebarExpanded) {
          BlocProvider.of<SidebarBloc>(context).add(CollapseSidebarEvent());
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
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    //  sidebar
                                    widget.maxWidth <= webSmall
                                        ? const SizedBox.shrink()
                                        : const DashboardSidebarWeb(),
                                    //  main content
                                    Expanded(
                                        child: Stack(
                                      children: [
                                        //  main content
                                        widget.maxWidth <= webSmall
                                            ? widget.child
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 55),
                                                child: widget.child),

                                        //  appbar
                                        widget.maxWidth <= webSmall
                                            ? const SizedBox.shrink()
                                            : BlocBuilder<BottomNavBloc,
                                                BottomNavState>(
                                                builder: (context, state) {
                                                  return DashboardAppBarWeb(
                                                    maxWidth: widget.maxWidth,
                                                    isSearchActive:
                                                        state is SearchActive,
                                                    onHamburgerTap: () {
                                                      //  toggle sidebar
                                                      BlocProvider.of<
                                                                  SidebarBloc>(
                                                              context)
                                                          .add(
                                                              ToggleSidebarEvent());
                                                    },
                                                  );
                                                },
                                              ),

                                        // BlocBuilder<TogglePdfViewerBloc,
                                        //     TogglePdfViewerState>(
                                        //   builder:
                                        //       (context, pdfViewOpenState) {
                                        //     return pdfViewOpenState
                                        //                 is! TogglePdfViewerOpen &&
                                        //             pdfViewOpenState
                                        //                 is! ToggleStoryViewOpen &&
                                        //             pdfViewOpenState
                                        //                 is! ToggleDealsViewOpen &&
                                        //             pdfViewOpenState
                                        //                 is! ToggleDealsVideoOpen
                                        //         ? const SizedBox.shrink()
                                        //         : ClipRRect(
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     8),
                                        //             child: BackdropFilter(
                                        //               filter:
                                        //                   ImageFilter.blur(
                                        //                       sigmaX: 6,
                                        //                       sigmaY: 6),
                                        //               child: Container(
                                        //                 width:
                                        //                     double.infinity,
                                        //                 height:
                                        //                     double.infinity,
                                        //                 clipBehavior:
                                        //                     Clip.hardEdge,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   color: isDarkMode(
                                        //                           themeModeModel:
                                        //                               appearanceState
                                        //                                   .appearanceSettingsModel
                                        //                                   .themeModeModel)
                                        //                       ? Theme.of(
                                        //                               context)
                                        //                           .scaffoldBackgroundColor
                                        //                           .withOpacity(
                                        //                               0.5)
                                        //                       : blackColor
                                        //                           .withOpacity(
                                        //                               0.8),
                                        //                 ),
                                        //                 child: Stack(
                                        //                   children: [
                                        //                     SizedBox(
                                        //                         width: double
                                        //                             .infinity,
                                        //                         height: double
                                        //                             .infinity,
                                        //                         child: pdfViewOpenState
                                        //                                 is TogglePdfViewerOpen
                                        //                             ? ViewPdfPage(
                                        //                                 pdfData: pdfViewOpenState
                                        //                                     .pdfData)
                                        //                             : pdfViewOpenState
                                        //                                     is ToggleStoryViewOpen
                                        //                                 ? SizedBox(
                                        //                                     width: double.infinity,
                                        //                                     height: double.infinity,
                                        //                                     child: MultiBlocListener(
                                        //                                       listeners: [
                                        //                                         BlocListener<DiscoverBloc, DiscoverState>(listener: (context, dealsState) {
                                        //                                           if (dealsState is DealsSuccess) {
                                        //                                             BlocProvider.of<GetStoryItemsFromHiveBloc>(context).add(EventGetStoryItemsFromHive(artworkDeals: dealsState.dealsAndOffers.where((deal) => deal.isArtwork).toList()));
                                        //                                           }
                                        //                                         })
                                        //                                       ],
                                        //                                       child: const StoryViewPage(),
                                        //                                     ),
                                        //                                   )
                                        //                                 : pdfViewOpenState is ToggleDealsViewOpen
                                        //                                     ? const OverlayDealsViewWeb()
                                        //                                     : pdfViewOpenState is ToggleDealsVideoOpen
                                        //                                         ? OverlayDealsVideoWeb(
                                        //                                             deal: pdfViewOpenState.deal,
                                        //                                             allVideos: pdfViewOpenState.allVideos,
                                        //                                           )
                                        //                                         : const SizedBox.shrink()),
                                        //                     Visibility(
                                        //                       visible:
                                        //                           pdfViewOpenState
                                        //                               is! ToggleStoryViewOpen && pdfViewOpenState is! TogglePdfViewerOpen,
                                        //                       child:
                                        //                           Positioned(
                                        //                               top: 0,
                                        //                               right:
                                        //                                   0,
                                        //                               child:
                                        //                                   Padding(
                                        //                                 padding: const EdgeInsets
                                        //                                     .all(
                                        //                                     30.0),
                                        //                                 child:
                                        //                                     IconButton(
                                        //                                   onPressed:
                                        //                                       () {
                                        //                                     BlocProvider.of<TogglePdfViewerBloc>(context).add(CloseViewerEvent());
                                        //                                   },
                                        //                                   icon:
                                        //                                       SvgPicture.asset(
                                        //                                     'assets/images/close.svg',
                                        //                                     width: 26,
                                        //                                     height: 26,
                                        //                                     colorFilter: const ColorFilter.mode(whiteColor, BlendMode.srcIn),
                                        //                                   ),
                                        //                                 ),
                                        //                               )),
                                        //                     )
                                        //                   ],
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           );
                                        //   },
                                        // )
                                      ],
                                    ))
                                  ],
                                ),
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
