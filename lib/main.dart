import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/core/app_route.dart';
import 'package:pixabay_web/core/app_theme.dart';
import 'package:pixabay_web/core/di/locator.dart';
import 'package:pixabay_web/features/bottom_nav/bottom_nav_bloc.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/trending_photo_cubit.dart';
import 'package:pixabay_web/features/gallery/ui/bloc/gallery_bloc.dart';
import 'package:pixabay_web/features/profile/ui/bloc/profile_bloc.dart';
import 'package:pixabay_web/features/sidebar/sidebar_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpLocator();

  runApp(const PixabayApp());
}

class PixabayApp extends StatelessWidget {
  const PixabayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SidebarBloc>(
          create: (_) => SidebarBloc(),
        ),
        BlocProvider<BottomNavBloc>(
          create: (_) => BottomNavBloc(),
        ),
        BlocProvider<TrendingPhotoCubit>(
          create: (_) => locator<TrendingPhotoCubit>(),
        ),
        BlocProvider<GalleryBloc>(
          create: (_) => locator<GalleryBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (_) => locator<ProfileBloc>(),
        ),
      ],
      child: const PixabayView(),
    );
  }
}

class PixabayView extends StatefulWidget {
  const PixabayView({super.key});

  @override
  State<PixabayView> createState() => _PixabayViewState();
}

class _PixabayViewState extends State<PixabayView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Pixabay',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
    );
  }
}
