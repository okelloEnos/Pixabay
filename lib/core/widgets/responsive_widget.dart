import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveLayoutWidget extends StatelessWidget {
  final Widget small;
  final Widget? medium;
  final Widget large;
  const ResponsiveLayoutWidget({
    super.key,
    required this.small,
    this.medium,
    required this.large,
  });

  // screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1000 &&
          MediaQuery.sizeOf(context).width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1000;

  @override
  Widget build(BuildContext context) {

    return isDesktop(context) ? large
    : isTablet(context) ? medium ?? small
    : small ;
  }
}
