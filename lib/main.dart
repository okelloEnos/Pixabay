import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/core/app_route.dart';
import 'package:pixabay_web/core/app_theme.dart';
import 'package:pixabay_web/core/di/locator.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/theme/pixabay_theme_cubit.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/trending_photo/trending_photo_cubit.dart';
import 'package:pixabay_web/features/gallery/ui/bloc/gallery_bloc.dart';
import 'package:pixabay_web/features/profile/ui/bloc/profile_bloc.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/sidebar/sidebar_bloc.dart';

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
        BlocProvider<TrendingPhotoBloc>(
          create: (_) => locator<TrendingPhotoBloc>(),
        ),
        BlocProvider<GalleryBloc>(
          create: (_) => locator<GalleryBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (_) => locator<ProfileBloc>(),
        ),
        BlocProvider<PixabayThemeCubit>(create: (_) => PixabayThemeCubit()),
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
    return BlocBuilder<PixabayThemeCubit, PixabayAppTheme>(
      builder: (context, state) {
        return MaterialApp.router(
          routerDelegate: appRouter.routerDelegate,
          routeInformationParser: appRouter.routeInformationParser,
          routeInformationProvider: appRouter.routeInformationProvider,
          debugShowCheckedModeBanner: false,
          title: 'Pixabay',
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: state == PixabayAppTheme.light ? ThemeMode.light : ThemeMode.dark,
        );
      },
    );
  }
}
