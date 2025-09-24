import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixabay_web/core/widgets/custom_text.dart';
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
        child: ResponsiveWidget(mobile: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "There was an issue experienced while accessing the next screen kindly contact the customer support.",
              textAlign: TextAlign.center,
              color: theme.hintColor,
            ),
            const SizedBox(height: 40.0,),
            GestureDetector(onTap: (){
              context.push("/need_help");
            }, child: CustomText(text: "Need help?",
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
              fontSize: 14.0,
            )),
          ],
        ), desktop: ResponsiveLayoutWidget(
          small: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyLottie(
                  lottie: 'assets/lottie/not_found.json',
                  size: Size(300, 300)),
              CustomText(
                text: "There was an issue experienced while accessing the next screen kindly contact the customer support.",
                textAlign: TextAlign.center,
                color: theme.hintColor,
              ),
              const SizedBox(height: 40.0,),

              GestureDetector(onTap: (){
                context.push("/need_help");
              }, child: CustomText(text: "Need help?",
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
              )),
            ],
          ),
          large: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyLottie(
                  lottie: 'assets/lottie/not_found.json',
                  size: Size(500, 500)),
              CustomText(
                text: "There was an issue experienced while accessing the next screen kindly contact the customer support. ",
                textAlign: TextAlign.center,
                color: theme.hintColor,
              ),
              const SizedBox(height: 40.0,),

              GestureDetector(onTap: (){
                context.push("/need_help");
              }, child: CustomText(text: "Need help?",
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
              )),
            ],
          ),
        )),
      ),
    );
  }
}
