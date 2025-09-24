import 'package:flutter/material.dart';
import 'package:pixabay_web/features/dashboard/dashboard_web.dart';

class Dashboard extends StatefulWidget {
  final Widget child;

  const Dashboard({super.key, required this.child});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => DashboardWeb(
                maxWidth: constraints.maxWidth,
                child: widget.child,
              )
          );
  }
}

