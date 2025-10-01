
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixabay_web/core/constants/colors.dart';
import 'package:pixabay_web/features/dashboard/bottom_bar_model.dart';

class SideBarItem extends StatelessWidget {
  final BottomBarModel bottomBarModel;
  final bool isActive;
  final bool isCollapsed;
  final VoidCallback onTap;

  const SideBarItem(
      {super.key,
      required this.bottomBarModel,
      this.isActive = false,
      this.isCollapsed = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          margin: const EdgeInsets.only(top: 12),
          height: 70,
          child: Row(
            children: [
              isActive
                  ? Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 7,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                ),
              )
                  : const SizedBox.shrink(),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.only(
                      right: isCollapsed ? 8 : 16, left: isActive ? 0 : 8),
                  padding: EdgeInsets.symmetric(
                      vertical: 24, horizontal: isCollapsed ? 4 : 32),
                  decoration: BoxDecoration(
                      color: isActive
                          ? whiteColor.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius:
                      isActive ? BorderRadius.circular(16) : null,
                      border: isActive
                          ? null
                          : Border(
                          bottom: BorderSide(
                              color: whiteColor.withOpacity(0.1),
                              width: 1))),
                  child: isActive
                      ? Row(
                    mainAxisAlignment: isCollapsed
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(bottomBarModel.icon,
                          width: 24,
                          height: 24,
                          // colorFilter: ColorFilter.mode(
                          //    whiteColor,
                          //     BlendMode.srcIn)
                      )
                          .animate(autoPlay: true)
                          .moveX(
                          begin: 0,
                          end: 15,
                          curve: Curves.ease,
                          duration:
                          const Duration(milliseconds: 300))
                          .then()
                          .moveX(
                        begin: 0,
                        end: -15,
                        curve: Curves.ease,
                      ),
                      SizedBox(width: isCollapsed ? 0 : 16),
                      Visibility(
                        visible: !isCollapsed,
                        child: Text(bottomBarModel.label,
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontWeight,
                                color: whiteColor))
                            .animate(
                            autoPlay: true,
                            delay: Duration(milliseconds: 300))
                            .moveX(
                            begin: 0,
                            end: 15,
                            curve: Curves.ease,
                            duration:
                            const Duration(milliseconds: 300))
                            .then()
                            .moveX(
                          begin: 0,
                          end: -15,
                          curve: Curves.ease,
                        ),
                      )
                    ],
                  )
                      : Row(
                    mainAxisAlignment: isCollapsed
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(bottomBarModel.icon,
                          width: 24,
                          height: 24,
                          // colorFilter: const ColorFilter.mode(
                          //     whiteColor, BlendMode.srcIn)
                      ),
                      SizedBox(width: isCollapsed ? 0 : 16),
                      Visibility(
                        visible: !isCollapsed,
                        child: Text(bottomBarModel.label,
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontWeight,
                                color: whiteColor)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // return MouseRegion(
    //   cursor: SystemMouseCursors.click,
    //   child: GestureDetector(
    //     onTap: onTap,
    //     child: AnimatedContainer(
    //       duration: const Duration(milliseconds: 300),
    //       width: double.infinity,
    //       height: 70,
    //       decoration: BoxDecoration(
    //           color: isActive
    //               ? whiteColor.withOpacity(0.1)
    //               : Theme.of(context).colorScheme.primary,
    //           border: isActive
    //               ? null
    //               : Border(
    //                   bottom: BorderSide(
    //                       color: whiteColor
    //                           .withOpacity(0.2),
    //                       width: 1))),
    //       child: Stack(
    //         children: [
    //           isActive
    //               ? Align(
    //                   alignment: Alignment.centerLeft,
    //                   child: Container(
    //                       width: 5,
    //                       height: double.infinity,
    //                       color: whiteColor),
    //                 )
    //               : const SizedBox.shrink(),
    //           Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
    //             child: Row(
    //               mainAxisAlignment: isCollapsed
    //                   ? MainAxisAlignment.center
    //                   : MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 SvgPicture.asset(bottomBarModel.icon,
    //                     width: 24,
    //                     height: 24,
    //                     colorFilter: const ColorFilter.mode(
    //                         whiteColor,
    //                         BlendMode.srcIn)),
    //                 SizedBox(width: isCollapsed ? 0 : 16),
    //                 Visibility(
    //                   visible: !isCollapsed,
    //                   child: Text(bottomBarModel.label,
    //                       style: TextStyle(
    //                           fontSize: Theme.of(context)
    //                               .textTheme
    //                               .bodyMedium!
    //                               .fontSize,
    //                           fontWeight: Theme.of(context)
    //                               .textTheme
    //                               .bodyMedium!
    //                               .fontWeight,
    //                           color: whiteColor)),
    //                 )
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
