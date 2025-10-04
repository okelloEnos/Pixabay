import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/trending_photo_cubit.dart';
import 'package:pixabay_web/features/dashboard/ui/bloc/trending_photo_event.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePageWeb extends StatefulWidget {
  final double maxWidth;

  const HomePageWeb({super.key, required this.maxWidth});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
        child: BlocBuilder<TrendingPhotoBloc, TrendingPhotoState>(
          builder: (context, state) {
            return SmartRefresher(
              controller: context.read<TrendingPhotoBloc>().refreshController,
              enablePullUp: true,
              enablePullDown: true,
              header: const WaterDropHeader(
                waterDropColor: Colors.red,
              ),
              footer: const ClassicFooter(
                textStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                loadingText: "Fetching more creatures...",
                loadingIcon: CupertinoActivityIndicator(),
                canLoadingText: "Release to fetch more creatures",
                canLoadingIcon: Icon(Icons.catching_pokemon, color: Colors.grey,),
                idleText: "Pull up to load more",
                noDataText: "No more creatures available",
                noMoreIcon: Icon(Icons.catching_pokemon, color: Colors.grey,),
                failedText: "Failed to load more creatures",
                failedIcon: Icon(Icons.call_missed_outgoing, color: Colors.red,),
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
                  ? state.photos.isEmpty ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/hamburger.svg", color: Colors.grey.shade100, height: 150.0, width: 150.0,),
                  const SizedBox(height: 50.0),
                  Text("The Gallery has no creatures", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey, fontSize: 16.0)),
                ],
              ):
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.maxWidth > 1200 ? 4 : widget.maxWidth > 800 ? 3 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index){
                    PhotoEntity photo = state.photos[index];
                    return PhotoCard(photo: photo);
                  },
                  itemCount: state.photos.length)
                  : state is TrendingPhotoError
                  ? Text("Error: ${state.message}")
                  : const Text("Loading..."),
            );
          },
        ),
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final PhotoEntity photo;
  final double? height;
  const PhotoCard({super.key, required this.photo, this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height ?? 150,
          child: photo.thumbnail != null ? CachedNetworkImage(imageUrl: photo.thumbnail!,
            errorWidget: (_, __, ___){
              return const Text("Error");
            },
            placeholder: (_, __){
              return const CircularProgressIndicator();
            },
          ) : const Text("No Image"),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  photo.photographerName ?? 'Unknown',
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Wrap(),
                Wrap(
                  // scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: (photo.tags ?? []).map((tag) => Container(
                    margin: const EdgeInsets.only(right: 4.0),
                    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  )).toList(),
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}
