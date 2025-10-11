import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/core/widgets/media_query_functions.dart';
import 'package:pixabay_web/core/widgets/my_lottie.dart';
import 'package:pixabay_web/core/widgets/shimmer_widgets.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/trending_photo/trending_photo_cubit.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/trending_photo/trending_photo_event.dart';
import 'package:pixabay_web/features/dashboard/ui/widgets/photo_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
        builder: (context, constraints){
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 2.0),
              child: BlocBuilder<TrendingPhotoBloc, TrendingPhotoState>(
                builder: (context, state) {
                  return SmartRefresher(
                    scrollController:
                    context.read<TrendingPhotoBloc>().scrollController,
                    controller: context.read<TrendingPhotoBloc>().refreshController,
                    enablePullUp: true,
                    enablePullDown: false,
                    header: const WaterDropHeader(
                      waterDropColor: Colors.red,
                    ),
                    footer: const ClassicFooter(
                      textStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                      loadingText: "Fetching more photos...",
                      loadingIcon: CupertinoActivityIndicator(),
                      canLoadingText: "Release to fetch more photos",
                      canLoadingIcon: Icon(
                        Icons.catching_pokemon,
                        color: Colors.grey,
                      ),
                      idleText: "Pull up to load more",
                      noDataText: "No more photos available",
                      noMoreIcon: Icon(
                        Icons.catching_pokemon,
                        color: Colors.grey,
                      ),
                      failedText: "Failed to load more photos",
                      failedIcon: Icon(
                        Icons.call_missed_outgoing,
                        color: Colors.red,
                      ),
                      loadStyle: LoadStyle.ShowWhenLoading,
                      // iconPos: ptr.IconPosition.left,
                    ),
                    onRefresh: () async {
                      context.read<TrendingPhotoBloc>().add(RefreshTrendingPhotos());
                    },
                    onLoading: () async {
                      context.read<TrendingPhotoBloc>().add(FetchTrendingPhotos());
                    },
                    child: state is TrendingPhotoLoaded
                        ? state.photos.isEmpty
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyLottie(
                            lottie: 'assets/lottie/no-data.json',
                            size: Size(250, 250)),
                        const SizedBox(height: 16.0),
                        Text("There are no photos",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey, fontSize: 16.0)),
                      ],
                    )
                        : GridView.builder(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 16.0, right: 16.0, left: 16.0),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop(context)
                              ? 4
                              : isTablet(context)
                              ? 2
                              : 1,
                          crossAxisSpacing: 14.0,
                          mainAxisSpacing: 14.0,
                          childAspectRatio: isMobile(context) ? 3 / 1.5 : 1.0,
                        ),
                        itemBuilder: (context, index) {
                          PhotoEntity photo = state.photos[index];
                          return PhotoCard(photo: photo);
                        },
                        itemCount: state.photos.length)
                        : state is TrendingPhotoError
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyLottie(
                            lottie: 'assets/lottie/error.json',
                            size: Size(300, 300)),
                        const SizedBox(height: 16.0),
                        Text(state.message,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontSize: 14.0)),
                        const SizedBox(height: 32.0),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<TrendingPhotoBloc>()
                                .add(FetchTrendingPhotos());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minimumSize: const Size(150, 45.0),
                            textStyle: const TextStyle(fontSize: 16.0),
                          ),
                          child: const Text("Retry"),
                        )
                      ],
                    )
                        : GridView.builder(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 16.0, right: 16.0, left: 16.0),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop(context)
                              ? 4
                              : isTablet(context)
                              ? 2
                              : 1,
                          crossAxisSpacing: 14.0,
                          mainAxisSpacing: 14.0,
                          childAspectRatio: isMobile(context) ? 3 / 1.5 : 1.0,
                        ),
                        itemBuilder: (context, index) {
                          return const PhotoCardLoading();
                        },
                        itemCount: 20),
                  );
                },
              ),
            ),
          );
        }
    );
  }
}

