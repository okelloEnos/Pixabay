import 'package:flutter/material.dart';
import 'package:pixabay_web/core/widgets/custom_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomText(text: "Profile Page")),
    );
  }
}
