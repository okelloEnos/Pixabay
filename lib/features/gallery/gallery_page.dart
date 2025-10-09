
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search photos...",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: (){
                        _searchController.clear();
                        // context.read<GalleryBloc>().add(const RefreshPhotosEvent(query: ''));
                      },
                    ) : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  onSubmitted: (value){
                    context.read<GalleryBloc>().add(RefreshPhotosEvent(query: value.trim()));
                  },
                  onChanged: (value){
                    context.read<GalleryBloc>().add(RefreshPhotosEvent(query: value.trim()));
                  },
                ),
                const SizedBox(height: 16.0,),
                Expanded(
                  child: SmartRefresher(
                    scrollController: context.read<GalleryBloc>().scrollController,
                    controller: context.read<GalleryBloc>().refreshController,
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
                      context.read<GalleryBloc>().add(RefreshPhotosEvent(query: _searchController.text.trim()));
                    },
                    onLoading: () async {
                      context.read<GalleryBloc>().add(FetchAllPhotosEvent(query: _searchController.text.trim()));
                    },
                    child: state is GalleryLoaded
                        ? state.photos.isEmpty ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/hamburger.svg", color: Colors.grey.shade100, height: 150.0, width: 150.0,),
                        const SizedBox(height: 50.0),
                        Text("The Gallery has no creatures", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey, fontSize: 16.0)),
                      ],
                    ):
                    GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                          // widget.maxWidth > 1200 ? 4 : widget.maxWidth > 800 ? 3 :
                          2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index){
                          PhotoEntity photo = state.photos[index];
                          return PhotoCard(photo: photo);
                        },
                        itemCount: state.photos.length)
                        : state is GalleryError
                        ? Text("Error: ${state.message}")
                        : const Text("Loading..."),
                  ),
                ),
              ],
            );
            return SmartRefresher(
              controller: context.read<GalleryBloc>().refreshController,
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
                context.read<GalleryBloc>().add(RefreshPhotosEvent(query: _searchController.text.trim()));
              },
              onLoading: () async {
                context.read<GalleryBloc>().add(FetchAllPhotosEvent(query: _searchController.text.trim()));
              },
              child: state is GalleryLoaded
                  ? state.photos.isEmpty ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/hamburger.svg", color: Colors.grey.shade100, height: 150.0, width: 150.0,),
                  const SizedBox(height: 50.0),
                  Text("The Gallery has no creatures", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey, fontSize: 16.0)),
                ],
              ):
              Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search photos...",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: (){
                          _searchController.clear();
                          // context.read<GalleryBloc>().add(const RefreshPhotosEvent(query: ''));
                        },
                      ) : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    onSubmitted: (value){
                      context.read<GalleryBloc>().add(RefreshPhotosEvent(query: value.trim()));
                    },
                    onChanged: (value){
                      // setState((){});
                      // context.read<GalleryBloc>().add(RefreshPhotosEvent(query: value.trim()));
///
//                       if (_debounce?.isActive ?? false) _debounce!.cancel();
//                       _debounce = Timer(const Duration(milliseconds: 500), () {
//                         context.read<GalleryBloc>().add(
//                           FetchAllPhotosEvent(query: value.trim()),
//                         );
//                       });

                      // _debouncer(() {
                        context.read<GalleryBloc>().add(RefreshPhotosEvent(query: value.trim()));
                      // });
                    },
                  ),
                  const SizedBox(height: 16.0,),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                          // widget.maxWidth > 1200 ? 4 : widget.maxWidth > 800 ? 3 :
                          2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index){
                          PhotoEntity photo = state.photos[index];
                          return PhotoCard(photo: photo);
                        },
                        itemCount: state.photos.length),
                  ),
                ],
              )
                  : state is GalleryError
                  ? Text("Error: ${state.message}")
                  : const Text("Loading..."),
            );
          },
        ),
      ),
    );
  }
}