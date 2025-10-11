import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixabay_web/core/widgets/my_lottie.dart';
import 'package:pixabay_web/core/widgets/responsive_widget.dart';

class RoutingErrorPage extends StatelessWidget {
  final GoRouterState goRouterState;

  const RoutingErrorPage({super.key, required this.goRouterState});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: ResponsiveLayoutWidget(
            small: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                      "There was an issue experienced while accessing the next screen kindly contact the customer support.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: theme.hintColor),
                ),
              ],
            ),
            large: ResponsiveLayoutWidget(
              small: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MyLottie(
                      lottie: 'assets/lottie/not_found.json',
                      size: Size(300, 300)),
                  Text(
                    "There was an issue experienced while accessing the next screen kindly contact the customer support.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: theme.hintColor),
                  ),
                ],
              ),
              large: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MyLottie(
                      lottie: 'assets/lottie/not_found.json',
                      size: Size(500, 500)),
                  Text(
                    "There was an issue experienced while accessing the next screen kindly contact the customer support.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: theme.hintColor),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
