// screen sizes
import 'package:flutter/material.dart';

const double maximumWidthConstraint = 800.0;

bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 600;

bool isTablet(BuildContext context) =>
    MediaQuery.sizeOf(context).width < 1000 &&
    MediaQuery.sizeOf(context).width >= 600;

bool isDesktop(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= 1000;

double getHorizontalPadding(context) {
  if (isMobile(context)) {
    return 24;
  } else if (isTablet(context)) {
    return 28;
  } else {
    return 32;
  }
}
