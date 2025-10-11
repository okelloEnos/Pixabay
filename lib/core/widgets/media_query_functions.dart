import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 600;

bool isTablet(BuildContext context) =>
    MediaQuery.sizeOf(context).width < 1000 &&
    MediaQuery.sizeOf(context).width >= 600;

bool isDesktop(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= 1000;
