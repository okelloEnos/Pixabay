
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pixabay_web/core/widgets/custom_text.dart';
import 'package:pixabay_web/core/widgets/responsive_widget.dart';

class WebFooter extends StatelessWidget {
  final bool? showBackground;
  const WebFooter({super.key, this.showBackground});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return (showBackground ?? false) ? Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
        ),
        color:  theme.colorScheme.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Divider(thickness: 1.0),
          ResponsiveLayoutWidget(small: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              // context.go("/${WebPagesRoute.termsOfUse}");
                            },
                            child: CustomText(text: "Terms of Use", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),)
                        )
                    ),
                    // CustomText(text: "Terms of Use", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                          height: 12.0,
                          child: VerticalDivider(thickness: 2,)),
                    ),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              // context.go("/${WebPagesRoute.privacyPolicy}");
                            },
                            child: CustomText(text: "Privacy Policy", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),)
                        )
                    ),
                    // CustomText(text: "Privacy Policy", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5)),
                  ],
                ),
                const SizedBox(height: 8.0),
                CustomText(text: "ⓒ ${DateTime.now().year} Britam Holdings PLC", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5)),
              ],
            ),
          ), large: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              // context.go("/${WebPagesRoute.termsOfUse}");
                            },
                            child: CustomText(text: "Terms of Use", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),)
                        )
                    ),
                    // CustomText(text: "Terms of Use", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                          height: 12.0,
                          child: VerticalDivider(thickness: 2,)),
                    ),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              // context.go("/${WebPagesRoute.privacyPolicy}");
                            },
                            child: CustomText(text: "Privacy Policy", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),)
                        )
                    ),
                    // CustomText(text: "Privacy Policy", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5)),
                  ],
                ),
                const SizedBox(width: 16.0),
                CustomText(text: "ⓒ ${DateTime.now().year} Britam Holdings PLC", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5)),
              ],
            ),
          )),
        ],
      ),
    ) : Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(thickness: 1.0),
        ResponsiveLayoutWidget(small: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){
                        // context.go("/${WebPagesRoute.termsOfUse}");
                      },
                      child: CustomText(text: "Terms of Use", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),)
                    )
                  ),
                  // CustomText(text: "Terms of Use", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                        height: 12.0,
                        child: VerticalDivider(thickness: 2,)),
                  ),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: (){
                            // context.go("/${WebPagesRoute.privacyPolicy}");
                          },
                          child: CustomText(text: "Privacy Policy", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),)
                      )
                  ),
                  // CustomText(text: "Privacy Policy", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5)),
                ],
              ),
              const SizedBox(height: 8.0),
              CustomText(text: "ⓒ ${DateTime.now().year} Britam Holdings PLC", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5)),
            ],
          ),
        ), large: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: (){
                            // context.go("/${WebPagesRoute.termsOfUse}");
                          },
                          child: CustomText(text: "Terms of Use", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),)
                      )
                  ),
                  // CustomText(text: "Terms of Use", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                        height: 12.0,
                        child: VerticalDivider(thickness: 2,)),
                  ),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: (){
                            // context.go("/${WebPagesRoute.privacyPolicy}");
                          },
                          child: CustomText(text: "Privacy Policy", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5),)
                      )
                  ),
                  // CustomText(text: "Privacy Policy", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5)),
                ],
              ),
              const SizedBox(width: 16.0),
              CustomText(text: "ⓒ ${DateTime.now().year} Britam Holdings PLC", fontSize: 12.0, color: theme.colorScheme.tertiary.withOpacity(0.5)),
            ],
          ),
        )),
      ],
    );
  }
}
