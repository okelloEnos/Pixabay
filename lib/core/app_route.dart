import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pixabay_web/features/dashboard/ui/pages/dashboard.dart';
import 'package:pixabay_web/features/dashboard/ui/pages/home_page.dart';
import 'package:pixabay_web/features/gallery/ui/pages/gallery_page.dart';
import 'package:pixabay_web/features/profile/ui/pages/profile_page.dart';
import 'pages/routing_error_page.dart';
import 'widgets/app_custom_animation_page_builder.dart';

/// app route configuration
final GoRouter appRouter = GoRouter(
  initialLocation: "/home",
  redirect: (context, state) {
    return null;
  },
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            Dashboard(child: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/home',
                name: 'home',
                pageBuilder: (context, state) => pageBuilderWithTransition(
                    context: context,
                    state: state,
                    duration: 350,
                    transitionType: PageTransitionType.fade,
                    child: const HomePage()),
                routes: [
                  GoRoute(
                    path: 'gallery',
                    name: 'gallery',
                    pageBuilder: (context, state) => pageBuilderWithTransition(
                        context: context,
                        state: state,
                        duration: 350,
                        transitionType: PageTransitionType.fade,
                        child: const GalleryPage()),
                  ),
                  GoRoute(
                    path: 'profile',
                    name: 'profile',
                    pageBuilder: (context, state) => pageBuilderWithTransition(
                        context: context,
                        state: state,
                        duration: 350,
                        transitionType: PageTransitionType.fade,
                        child: const ProfilePage()),
                  ),
                ]),
          ]),
        ]),
  ],
  errorBuilder: (context, state) => RoutingErrorPage(
    goRouterState: state,
  ),
);
