import 'package:flutter/material.dart';
import 'package:pixabay_web/features/dashboard/home_page_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => HomePageWeb(
          maxWidth: constraints.maxWidth,
        )
    );
  }
}
