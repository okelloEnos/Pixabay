import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixabay_web/core/extension/string_extension.dart';
import 'package:pixabay_web/core/widgets/my_lottie.dart';
import 'package:pixabay_web/core/widgets/shimmer_widgets.dart';
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
        padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 2.0),
        child: BlocBuilder<TrendingPhotoBloc, TrendingPhotoState>(
          builder: (context, state) {
            return SmartRefresher(
              scrollController: context.read<TrendingPhotoBloc>().scrollController,
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
                canLoadingIcon: Icon(Icons.catching_pokemon, color: Colors.grey,),
                idleText: "Pull up to load more",
                noDataText: "No more photos available",
                noMoreIcon: Icon(Icons.catching_pokemon, color: Colors.grey,),
                failedText: "Failed to load more photos",
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
                  const MyLottie(
                      lottie: 'assets/lottie/no-data.json',
                      size: Size(250, 250)),
                  const SizedBox(height: 16.0),
                  Text("There are no photos", textAlign: TextAlign.center, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey, fontSize: 16.0)),
                ],
              ):
              GridView.builder(
                padding: const EdgeInsets.only(top: 4.0, bottom: 16.0, right: 16.0, left: 16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.maxWidth > 1200 ? 4 : widget.maxWidth > 800 ? 3 : 2,
                    crossAxisSpacing: 14.0,
                    mainAxisSpacing: 14.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index){
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
                      Text(state.message, textAlign: TextAlign.center, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.0)),
                    ],
                  )
                  : GridView.builder(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 16.0, right: 16.0, left: 16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.maxWidth > 1200 ? 4 : widget.maxWidth > 800 ? 3 : 2,
                    crossAxisSpacing: 14.0,
                    mainAxisSpacing: 14.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index){
                    return const PhotoCardLoading();
                  },
                  itemCount: 20),
            );
          },
        ),
      ),
    );
  }
}

class PhotoCard extends StatefulWidget {
  final PhotoEntity photo;
  final double? height;
  const PhotoCard({super.key, required this.photo, this.height});

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    final photo = widget.photo;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: hovering
            ? Matrix4.identity().scaled(1.03)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: hovering ? 12 : 4,
              offset: const Offset(0, 4),
            )
          ],
        ),
      child: Card(
        elevation: 1.0,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {}, // open details
          hoverColor: Colors.black12,
          onHover: (isHovering){
            setState(() {
              hovering = isHovering;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: widget.photo.thumbnail != null ? CachedNetworkImage(imageUrl: widget.photo.thumbnail!, fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 400),
                  fadeOutDuration: const Duration(milliseconds: 200),
                  errorWidget: (_, __, ___){
                    return Image.asset("assets/images/pixabay.png", color: Colors.grey.shade100,);
                  },
                  placeholder: (_, __){
                    return const ShimmerContainer(width: double.infinity, height: double.infinity, borderRadius: 8.0,);
                  },
                ) : Image.asset("assets/images/pixabay.png", color: Colors.grey.shade100,),
              ),
              Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey.shade100,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.person, size: 12.0, color: Colors.grey),
                          const SizedBox(width: 4.0),
                          Text(photo.photographerName ?? 'Unknown', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            overflow: TextOverflow.ellipsis, fontSize: 16.0
                          )),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Wrap(
                        spacing: 4.0,
                        runSpacing: 4.0,
                        children: (photo.tags ?? []).take(6).map((t) => Container(
                          margin: const EdgeInsets.only(right: 4.0),
                          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            t.capitalizeFirstName,
                            style: const TextStyle(color: Colors.white, fontSize: 10.0),
                          ),
                        )).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoCardLoading extends StatelessWidget {
  const PhotoCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ShimmerWidget(child: Image.asset("assets/images/pixabay.png", color: Colors.grey.shade200,)),
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey.shade100,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShimmerContainer(width: 16.0, height: 14.0, borderRadius: 4.0,),
                      SizedBox(width: 4.0),
                      ShimmerContainer(width: 100.0, height: 12.0, borderRadius: 4.0),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 6.0,
                    children: ["", "", "", "", "", "", "", ""].take(8).map((t) => const ShimmerContainer(width: 50.0, height: 12.0, borderRadius: 4.0,),).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );;
  }
}

