import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/core/widgets/custom_text.dart';
import 'package:pixabay_web/features/gallery/ui/bloc/gallery_bloc.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          return Center(child: CustomText(text: "Gallery : ${state}",));
        },
      ),
    );
  }
}
