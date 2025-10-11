import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_web/core/widgets/media_query_functions.dart';
import 'package:pixabay_web/core/widgets/shimmer_widgets.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';
import 'package:pixabay_web/features/dashboard/ui/widgets/author_and_chips.dart';

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
      transform:
          hovering ? Matrix4.identity().scaled(1.03) : Matrix4.identity(),
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
          onHover: (isHovering) {
            setState(() {
              hovering = isHovering;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: isMobile(context) ? 18 / 6 : 16 / 9,
                child: widget.photo.thumbnail != null
                    ? CachedNetworkImage(
                        imageUrl: widget.photo.thumbnail!,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 400),
                        fadeOutDuration: const Duration(milliseconds: 200),
                        errorWidget: (_, __, ___) {
                          return Image.asset(
                            "assets/images/pixabay.png",
                            color: Colors.grey.shade100,
                          );
                        },
                        placeholder: (_, __) {
                          return const ShimmerContainer(
                            width: double.infinity,
                            height: double.infinity,
                            borderRadius: 8.0,
                          );
                        },
                      )
                    : Image.asset(
                        "assets/images/pixabay.png",
                        color: Colors.grey.shade100,
                      ),
              ),
              Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey.shade100,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AuthorAndChips(photo: photo),
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
    return LayoutBuilder(builder: (context, constraints) {
      final tags = <String>["", "", "", "", "", "", "", "", "", "", "", ""];
      final maxVisible = constraints.maxWidth >= 350
          ? 6
          : constraints.maxWidth >= 260
              ? 5
              : constraints.maxWidth >= 200
                  ? 4
                  : 1;

      final visible = tags.take(maxVisible).toList();

      return Card(
        elevation: 1.0,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: isMobile(context) ? 18 / 6 : 16 / 9,
              child: ShimmerWidget(
                  child: Image.asset(
                "assets/images/pixabay.png",
                color: Colors.grey.shade200,
              )),
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
                        ShimmerContainer(
                          width: 16.0,
                          height: 14.0,
                          borderRadius: 4.0,
                        ),
                        SizedBox(width: 4.0),
                        ShimmerContainer(
                            width: 100.0, height: 12.0, borderRadius: 4.0),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 6.0,
                      children: visible
                          .map(
                            (t) => const ShimmerContainer(
                              width: 50.0,
                              height: 12.0,
                              borderRadius: 4.0,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
