
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixabay_web/core/widgets/media_query_functions.dart';
import 'package:pixabay_web/core/widgets/my_lottie.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/home_page_web.dart';
import 'package:pixabay_web/features/gallery/ui/bloc/gallery_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(fontSize: 14.0),
                  decoration: InputDecoration(
                    hintText: 'Search photos....',
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onSubmitted: (value){
                    context.read<GalleryBloc>().add(RefreshPhotosEvent(query: value.trim()));
                  },
                  onChanged: (value){
                    context.read<GalleryBloc>().add(RefreshPhotosEvent(query: value.trim()));
                  },
                ),
              ),
              const SizedBox(height: 16.0,),
              Expanded(
                child: SmartRefresher(
                  scrollController: context.read<GalleryBloc>().scrollController,
                  controller: context.read<GalleryBloc>().refreshController,
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
                    context.read<GalleryBloc>().add(RefreshPhotosEvent(query: _searchController.text.trim()));
                  },
                  onLoading: () async {
                    context.read<GalleryBloc>().add(FetchAllPhotosEvent(query: _searchController.text.trim()));
                  },
                  child: state is GalleryLoaded
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
                        // crossAxisCount:
                        // // widget.maxWidth > 1200 ? 4 : widget.maxWidth > 800 ? 3 :
                        // 2,
                        crossAxisCount: isDesktop(context) ? 4 : isTablet(context) ? 3 : 2,
                        crossAxisSpacing: 14.0,
                        mainAxisSpacing: 14.0,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index){
                        PhotoEntity photo = state.photos[index];
                        return PhotoCard(photo: photo);
                      },
                      itemCount: state.photos.length)
                      : state is GalleryError
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
                        crossAxisCount: isDesktop(context) ? 4 : isTablet(context) ? 3 : 2,
                        crossAxisSpacing: 14.0,
                        mainAxisSpacing: 14.0,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index){
                        return const PhotoCardLoading();
                      },
                      itemCount: 20),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}