

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pixabay_web/features/dashboard/dashboard.dart';
import 'package:pixabay_web/features/dashboard/home_page.dart';

import 'pages/routing_error_page.dart';
import 'widgets/app_custom_animation_page_builder.dart';

/// app route configuration
final GoRouter appRouter = GoRouter(
  initialLocation: "/home",
  redirect: (context, state) {
    //
    // final Uri uri = Uri.base;
    // String path = uri.toString();
    // ProfileState profileState = context.read<ProfileBloc>().state;
    // bool contains = path.contains("home");
    // String token = locator<SharedPreferencesUtil>().getValidToken();
    //
    //
    // if (contains && token.isEmpty) {
    //   // user has not logged in
    //   return OnBoardingRoute.logIn;
    // } else if (contains &&
    //     token.isNotEmpty &&
    //     profileState is! ProfileOnSuccess) {
    //   // fetch information from the profile state
    //   // user has logged in
    //   return DashboardRoute.home;
    // } else if (path.contains("login") && token.isNotEmpty) {
    //   // don't go to login
    //   if (enableMfa) {
    //     if (locator<SharedPreferencesUtil>().getMfaStatus()) {
    //       return DashboardRoute.home;
    //     }
    //   } else {
    //     return DashboardRoute.home;
    //   }
    // }

    return null;
  },
  routes: <RouteBase>[
          // splashRouteWeb,
          // dashboard
          StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) =>
                  Dashboard(child: navigationShell),
              branches: <StatefulShellBranch>[
                StatefulShellBranch(routes: [
                  GoRoute(
                      path: '/home',
                      name: 'home',
                      pageBuilder: (context, state) =>
                          pageBuilderWithTransition(
                              context: context,
                              state: state,
                              duration: 350,
                              transitionType: PageTransitionType.fade,
                              child: const HomePage()),
                      routes: [
                        // GoRoute(
                        //   path: 'deals_webview',
                        //   name: 'deals_webview',
                        //   pageBuilder: (context, state) =>
                        //       pageBuilderWithTransition(
                        //     context: context,
                        //     state: state,
                        //     duration: pageTransitionValue,
                        //     transitionType: PageTransitionType.rightToLeft,
                        //     child: DealsWebView(
                        //         dealsModel: state.extra as DealsModel),
                        //   ),
                        // ),
                        // GoRoute(
                        //   path: 'search',
                        //   name: 'search',
                        //   pageBuilder: (context, state) =>
                        //       pageBuilderWithTransition(
                        //           context: context,
                        //           state: state,
                        //           duration: 350,
                        //           transitionType:
                        //               PageTransitionType.rightToLeft,
                        //           child: const SearchPage()),
                        // ),
                        // GoRoute(
                        //     path: 'products',
                        //     name: 'products',
                        //     pageBuilder: (context, state) =>
                        //         pageBuilderWithTransition(
                        //             context: context,
                        //             state: state,
                        //             duration: 350,
                        //             transitionType: PageTransitionType.fade,
                        //             child: const ProductsPage()),
                        //     routes: [
                        //       //  pension portal web
                        //       GoRoute(
                        //         path: 'pension_portal_web',
                        //         name: 'pension_portal_web',
                        //         pageBuilder: (context, state) => pageBuilderWithTransition(
                        //           context: context,
                        //           state: state,
                        //           duration: pageTransitionValue,
                        //           transitionType: PageTransitionType.rightToLeft,
                        //           child: MultiBlocProvider(providers: [
                        //             BlocProvider<PensionPortalBloc>(
                        //               create: (_) => PensionPortalBloc(),
                        //             ),
                        //           ], child: const PensionPortalPage()),
                        //         ),
                        //       ),
                        //       GoRoute(
                        //         path: 'view_pdf_page',
                        //         name: 'view_pdf_page',
                        //         pageBuilder: (context, state) =>
                        //             pageBuilderWithTransition(
                        //           context: context,
                        //           state: state,
                        //           duration: pageTransitionValue,
                        //           transitionType:
                        //               PageTransitionType.rightToLeft,
                        //           child: MultiBlocProvider(
                        //             providers: [
                        //               BlocProvider<SharePdfBloc>(
                        //                 create: (_) => SharePdfBloc(),
                        //               ),
                        //             ],
                        //             child: ViewPdfPage(
                        //                 pdfData: state.extra
                        //                     as Map<String, dynamic>),
                        //           ),
                        //         ),
                        //       ),
                        //       // product detail
                        //       GoRoute(
                        //         redirect: (context, state) {
                        //           if (state.extra is! ProductModel) {
                        //             return "/home";
                        //           }
                        //         },
                        //         path: 'product-detail',
                        //         name: 'product-detail',
                        //         pageBuilder: (context, state) {
                        //           final productModel =
                        //               state.extra as ProductModel;
                        //
                        //           return pageBuilderWithTransition(
                        //               context: context,
                        //               state: state,
                        //               duration: 350,
                        //               transitionType:
                        //                   PageTransitionType.rightToLeft,
                        //               child: MultiBlocProvider(
                        //                   providers: [
                        //                     // BlocProvider<ProductDetailBloc>(
                        //                     //   create: (_) => locator<ProductDetailBloc>(),
                        //                     // ),
                        //                     BlocProvider<ProductDetailBloc>(
                        //                       create: (_) =>
                        //                           locator<ProductDetailBloc>(),
                        //                     ),
                        //                     BlocProvider<
                        //                         HealthProductDetailBloc>(
                        //                       create: (_) => locator<
                        //                           HealthProductDetailBloc>(),
                        //                     ),
                        //                     BlocProvider<
                        //                         GenerateInvestmentStatementBloc>(
                        //                       create: (_) =>
                        //                           GenerateInvestmentStatementBloc(),
                        //                     ),
                        //                   ],
                        //                   child: ProductDetailPage(
                        //                       product: productModel)));
                        //         },
                        //       ),
                        //     ]),
                        // GoRoute(
                        //   path: 'discover',
                        //   name: 'discover',
                        //   pageBuilder: (context, state) =>
                        //       pageBuilderWithTransition(
                        //           context: context,
                        //           state: state,
                        //           duration: 350,
                        //           transitionType: PageTransitionType.fade,
                        //           child: const DiscoverPage()),
                        // ),
                        // GoRoute(
                        //   path: 'activity',
                        //   name: 'activity',
                        //   pageBuilder: (context, state) =>
                        //       pageBuilderWithTransition(
                        //           context: context,
                        //           state: state,
                        //           duration: 350,
                        //           transitionType: PageTransitionType.fade,
                        //           child: const ActivityPage()),
                        // ),
                        // GoRoute(
                        //     path: 'help',
                        //     name: 'help',
                        //     pageBuilder: (context, state) =>
                        //         pageBuilderWithTransition(
                        //             context: context,
                        //             state: state,
                        //             duration: 350,
                        //             transitionType: PageTransitionType.fade,
                        //             child: const HelpPage()),
                        //     routes: [
                        //       // locate branch
                        //       GoRoute(
                        //         path: 'locate-branch',
                        //         name: 'locate-branch',
                        //         pageBuilder: (context, state) =>
                        //             pageBuilderWithTransition(
                        //                 context: context,
                        //                 state: state,
                        //                 duration: 350,
                        //                 transitionType:
                        //                     PageTransitionType.rightToLeft,
                        //                 child: const LocateBranchPage()),
                        //       ),
                        //
                        //       GoRoute(
                        //         path: 'request-callback',
                        //         name: 'request-callback',
                        //         pageBuilder: (context, state) =>
                        //             pageBuilderWithTransition(
                        //                 context: context,
                        //                 state: state,
                        //                 duration: 350,
                        //                 transitionType:
                        //                     PageTransitionType.rightToLeft,
                        //                 child: const RequestCallbackPage()),
                        //       ),
                        //
                        //       //  faq shell route
                        //       ShellRoute(
                        //           navigatorKey: faqShellNavigatorKey,
                        //           builder: (context, state, child) {
                        //             return FAQPage(child: child);
                        //           },
                        //           routes: [
                        //             GoRoute(
                        //                 path: 'faq-questions',
                        //                 name: 'faq-questions',
                        //                 pageBuilder: (context, state) =>
                        //                     pageBuilderWithTransition(
                        //                         context: context,
                        //                         state: state,
                        //                         duration: 350,
                        //                         transitionType:
                        //                             PageTransitionType
                        //                                 .rightToLeft,
                        //                         child:
                        //                             const FAQQuestionsPage()),
                        //                 routes: [
                        //                   GoRoute(
                        //                     path: 'faq-view',
                        //                     name: 'faq-view',
                        //                     pageBuilder: (context, state) {
                        //                       final faqModel =
                        //                           state.extra as FAQModel;
                        //
                        //                       return pageBuilderWithTransition(
                        //                           context: context,
                        //                           state: state,
                        //                           duration: 350,
                        //                           transitionType:
                        //                               PageTransitionType
                        //                                   .rightToLeft,
                        //                           child: FAQViewPage(
                        //                             faqModel: faqModel,
                        //                           ));
                        //                     },
                        //                   ),
                        //                 ]),
                        //           ]),
                        //     ]),
                        // GoRoute(
                        //   path: 'pdf_preview',
                        //   name: 'pdf_preview',
                        //   pageBuilder: (context, state) =>
                        //       pageBuilderWithTransition(
                        //     context: context,
                        //     state: state,
                        //     duration: pageTransitionValue,
                        //     transitionType: PageTransitionType.rightToLeft,
                        //     child: PdfPreviewPage(
                        //         generatePdfMethod:
                        //             state.extra as Future<Uint8List>),
                        //   ),
                        // ),
                        // GoRoute(
                        //     path: 'all-actions',
                        //     name: 'all-actions',
                        //     pageBuilder: (context, state) =>
                        //         pageBuilderWithTransition(
                        //             context: context,
                        //             state: state,
                        //             duration: 350,
                        //             transitionType:
                        //                 PageTransitionType.rightToLeft,
                        //             child: const AllActionsPage()),
                        //     routes: webCallToActionsRoutesAlt),
                        //
                        // // notifications
                        // GoRoute(
                        //   path: 'notifications',
                        //   name: 'notifications',
                        //   pageBuilder: (context, state) =>
                        //       pageBuilderWithTransition(
                        //           context: context,
                        //           state: state,
                        //           duration: 350,
                        //           transitionType:
                        //               PageTransitionType.rightToLeft,
                        //           child: const NotificationsPage()),
                        // ),
                      ]),
                ]),
              ]),
        ],
  errorBuilder: (context, state) => RoutingErrorPage(
    goRouterState: state,
  ),
);
