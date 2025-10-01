import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DashboardAppBarWeb extends StatefulWidget {
  final double maxWidth;
  final bool isSearchActive;
  final VoidCallback onHamburgerTap;

  const DashboardAppBarWeb(
      {super.key,
      required this.maxWidth,
      this.isSearchActive = false,
      required this.onHamburgerTap});

  @override
  State<DashboardAppBarWeb> createState() => _DashboardAppBarWebState();
}

class _DashboardAppBarWebState extends State<DashboardAppBarWeb> {
  late final TextEditingController _textEditingController;
  String searchFilter = '';

  ValueNotifier<bool> darkModeActivated = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      setState(() {
        searchFilter = _textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 55,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius:
          const BorderRadius.only(topLeft: Radius.circular(24))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  HAMBURGER
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: widget.onHamburgerTap,
              child: UnconstrainedBox(
                child: Container(
                  width: 30,
                  height: 30,
                  color: Colors.transparent,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/hamburger.svg',
                      width: double.infinity,
                      height: double.infinity,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //  SEARCH
          UnconstrainedBox(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: widget.maxWidth * 0.5,
              height: 40,
              // margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: widget.isSearchActive
                      ? const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))
                      : null),
              child:
              // widget.isSearchActive
              //     ?

              Column(
                children: [
                  // BlocBuilder<BottomNavBloc, BottomNavState>(
                  //   builder: (context, state) {
                  //     return TextFormField(
                  //       controller: _textEditingController,
                  //       textAlign: TextAlign.start,
                  //       textAlignVertical: TextAlignVertical.center,
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //       onTap: () {
                  //         BlocProvider.of<BottomNavBloc>(context).add(
                  //             ToggleSearch(
                  //                 isActive: true,
                  //                 currentIndex: state.currentIndex));
                  //       },
                  //       decoration: InputDecoration(
                  //         hintText: 'Search anything...',
                  //         prefixIcon: UnconstrainedBox(
                  //           child: SvgPicture.asset(
                  //             'assets/images/icons/search.svg',
                  //             width: 20,
                  //             height: 20,
                  //             colorFilter: const ColorFilter.mode(
                  //                 blackColor, BlendMode.srcIn),
                  //           ),
                  //         ),
                  //         hintStyle: TextStyle(
                  //             fontSize: 13,
                  //             fontWeight: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyMedium!
                  //                 .fontWeight,
                  //             color: Colors.black.withOpacity(0.5)),
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //             borderSide: BorderSide(
                  //                 color: Colors.black.withOpacity(0.1),
                  //                 width: 1)),
                  //         enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //             borderSide: BorderSide(
                  //                 color: Colors.black.withOpacity(0.1),
                  //                 width: 1)),
                  //         contentPadding: const EdgeInsets.symmetric(
                  //             horizontal: 24),
                  //         fillColor:
                  //             Theme.of(context).colorScheme.onPrimary,
                  //         filled: true,
                  //       ),
                  //       onChanged: (value){
                  //         setState(() {
                  //           searchFilter = _textEditingController.text;
                  //         });
                  //       },
                  //     );
                  //   },
                  // ),
                  const SizedBox(height: 24),
                  // Expanded(
                  //     child: SearchPage(
                  //       showTextfield: true,
                  //       bgColor: Theme.of(context).colorScheme.onPrimary,
                  //       padding: 0,
                  //       searchFilter: searchFilter,
                  //     ))
                ],
              )
              //     : BlocBuilder<BottomNavBloc, BottomNavState>(
              //   builder: (context, state) {
              //     return TextFormField(
              //       controller: _textEditingController,
              //       textAlign: TextAlign.start,
              //       textAlignVertical: TextAlignVertical.center,
              //       style: Theme.of(context).textTheme.bodyMedium,
              //       onTap: () {
              //         BlocProvider.of<SearchBloc>(context)
              //             .add(EnableSearchEvent());
              //       },
              //       decoration: InputDecoration(
              //         hintText: 'Search anything...',
              //         prefixIcon: UnconstrainedBox(
              //           child: SvgPicture.asset(
              //             'assets/images/icons/search.svg',
              //             width: 20,
              //             height: 20,
              //             colorFilter: ColorFilter.mode(
              //                 Theme.of(context).colorScheme.tertiary,
              //                 BlendMode.srcIn),
              //           ),
              //         ),
              //         hintStyle: TextStyle(
              //             fontSize: 13,
              //             fontWeight: Theme.of(context)
              //                 .textTheme
              //                 .bodyMedium!
              //                 .fontWeight,
              //             color: Theme.of(context)
              //                 .colorScheme
              //                 .tertiary
              //                 .withOpacity(0.5)),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(12),
              //             borderSide: BorderSide(
              //                 color: Theme.of(context)
              //                     .colorScheme
              //                     .tertiary
              //                     .withOpacity(0.1),
              //                 width: 1)),
              //         enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(12),
              //             borderSide: BorderSide(
              //                 color: Theme.of(context)
              //                     .colorScheme
              //                     .tertiary
              //                     .withOpacity(0.1),
              //                 width: 1)),
              //         contentPadding:
              //         const EdgeInsets.symmetric(horizontal: 24),
              //         fillColor: Colors.transparent,
              //         filled: true,
              //       ),
              //       onChanged: (value) {
              //         setState(() {
              //           searchFilter = _textEditingController.text;
              //         });
              //       },
              //     );
              //   },
              // ),
            ),
          ),

          //  AVATAR
          // BlocBuilder<UserCrmBloc, UserCrmState>(
          //   builder: (context, state) {
          //     return Row(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         // BlocConsumer<AppearanceSettingsBloc,
          //         //     AppearanceSettingsState>(
          //         //   builder: (context, appearanceState) {
          //         //     return ValueListenableBuilder<bool>(
          //         //         valueListenable: darkModeActivated,
          //         //         builder: (BuildContext context, bool value,
          //         //                 Widget? child) =>
          //         //             IconButton(
          //         //                 onPressed: () {
          //         //                   BlocProvider.of<AppearanceSettingsBloc>(
          //         //                           context)
          //         //                       .add(SetAppearanceSettingEvent(
          //         //                           key: themeModeKey,
          //         //                           value: !value
          //         //                               ? ThemeModeModel.dark.name
          //         //                               : ThemeModeModel
          //         //                                   .light.name));
          //         //
          //         //                   BlocProvider.of<AppearanceSettingsBloc>(
          //         //                           context)
          //         //                       .add(GetAppearanceSettingsEvent());
          //         //
          //         //                   darkModeActivated.value = !value;
          //         //                 },
          //         //                 icon: SvgPicture.asset(
          //         //                     'assets/images/web/dark_mode.svg',
          //         //                     width: 24,
          //         //                     height: 24,
          //         //                     colorFilter: ColorFilter.mode(
          //         //                         Theme.of(context)
          //         //                             .textTheme
          //         //                             .bodyMedium!
          //         //                             .color!,
          //         //                         BlendMode.srcIn))));
          //         //   },
          //         //   listener: (BuildContext context,
          //         //       AppearanceSettingsState appearanceState) {
          //         //     if (appearanceState is AppearanceSettingsSuccess) {
          //         //       darkModeActivated.value = appearanceState
          //         //               .appearanceSettingsModel.themeModeModel ==
          //         //           ThemeModeModel.dark;
          //         //     }
          //         //   },
          //         // ),
          //         state is UserCrmLoading
          //             ? Shimmer.fromColors(
          //           baseColor:
          //           Theme.of(context).colorScheme.onPrimary,
          //           highlightColor:
          //           Theme.of(context).scaffoldBackgroundColor,
          //           child: Container(
          //             width: 50,
          //             height: 50,
          //             decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: Theme.of(context)
          //                     .colorScheme
          //                     .onPrimary),
          //           ),
          //         )
          //             : const Avatar(
          //             size: Size(45, 45),
          //             showBorder: true,
          //             backgroundColor: avatarOrange),
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
    );
    // return AnimatedContainer(
    //   duration: const Duration(milliseconds: 300),
    //   width: double.infinity,
    //   height: widget.isSearchActive ? 700 : 80,
    //   decoration: const BoxDecoration(
    //       color: Colors.transparent,
    //       borderRadius: BorderRadius.only(topLeft: Radius.circular(24))),
    //   child: Stack(
    //     children: [
    //       Column(
    //         children: [
    //           Container(
    //             width: double.infinity,
    //             height: 80,
    //             constraints: const BoxConstraints(minHeight: 80),
    //             padding: EdgeInsets.symmetric(
    //                 horizontal: widget.maxWidth <= webSmall ? 16 : 40),
    //             decoration: BoxDecoration(
    //                 color: Theme.of(context).colorScheme.onPrimary,
    //                 boxShadow: widget.isSearchActive
    //                     ? null
    //                     : [
    //                         BoxShadow(
    //                             color: Theme.of(context)
    //                                 .colorScheme
    //                                 .tertiary
    //                                 .withOpacity(0.1),
    //                             spreadRadius: 2,
    //                             blurRadius: 5)
    //                       ],
    //                 borderRadius:
    //                     const BorderRadius.only(topLeft: Radius.circular(24))),
    //           ),
    //         ],
    //       ),
    //
    //       //  HAMBURGER
    //       Align(
    //         alignment: Alignment.topLeft,
    //         child: MouseRegion(
    //           cursor: SystemMouseCursors.click,
    //           child: GestureDetector(
    //             onTap: widget.onHamburgerTap,
    //             child: UnconstrainedBox(
    //               child: Container(
    //                 width: 30,
    //                 height: 30,
    //                 color: Theme.of(context).colorScheme.onPrimary,
    //                 margin: const EdgeInsets.symmetric(
    //                     horizontal: 24, vertical: 24),
    //                 child: Center(
    //                   child: SvgPicture.asset(
    //                     'assets/images/icons/web/hamburger_web.svg',
    //                     width: double.infinity,
    //                     height: double.infinity,
    //                     colorFilter: ColorFilter.mode(
    //                         Theme.of(context).colorScheme.primary,
    //                         BlendMode.srcIn),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //
    //       //  SEARCH
    //       Align(
    //         alignment: Alignment.topCenter,
    //         child: UnconstrainedBox(
    //           child: AnimatedContainer(
    //             duration: const Duration(milliseconds: 300),
    //             width: widget.maxWidth * 0.5,
    //             height: widget.isSearchActive ? 600 : 35,
    //             margin: const EdgeInsets.symmetric(vertical: 24),
    //             padding: EdgeInsets.symmetric(
    //                 horizontal: widget.isSearchActive ? 16 : 0),
    //             decoration: BoxDecoration(
    //                 color: Colors.transparent,
    //                 borderRadius: widget.isSearchActive
    //                     ? const BorderRadius.only(
    //                         bottomLeft: Radius.circular(24),
    //                         bottomRight: Radius.circular(24))
    //                     : null),
    //             child: widget.isSearchActive
    //                 ? Column(
    //                     children: [
    //                       // BlocBuilder<BottomNavBloc, BottomNavState>(
    //                       //   builder: (context, state) {
    //                       //     return TextFormField(
    //                       //       controller: _textEditingController,
    //                       //       textAlign: TextAlign.start,
    //                       //       textAlignVertical: TextAlignVertical.center,
    //                       //       style: Theme.of(context).textTheme.bodyMedium,
    //                       //       onTap: () {
    //                       //         BlocProvider.of<BottomNavBloc>(context).add(
    //                       //             ToggleSearch(
    //                       //                 isActive: true,
    //                       //                 currentIndex: state.currentIndex));
    //                       //       },
    //                       //       decoration: InputDecoration(
    //                       //         hintText: 'Search anything...',
    //                       //         prefixIcon: UnconstrainedBox(
    //                       //           child: SvgPicture.asset(
    //                       //             'assets/images/icons/search.svg',
    //                       //             width: 20,
    //                       //             height: 20,
    //                       //             colorFilter: const ColorFilter.mode(
    //                       //                 blackColor, BlendMode.srcIn),
    //                       //           ),
    //                       //         ),
    //                       //         hintStyle: TextStyle(
    //                       //             fontSize: 13,
    //                       //             fontWeight: Theme.of(context)
    //                       //                 .textTheme
    //                       //                 .bodyMedium!
    //                       //                 .fontWeight,
    //                       //             color: Colors.black.withOpacity(0.5)),
    //                       //         border: OutlineInputBorder(
    //                       //             borderRadius: BorderRadius.circular(12),
    //                       //             borderSide: BorderSide(
    //                       //                 color: Colors.black.withOpacity(0.1),
    //                       //                 width: 1)),
    //                       //         enabledBorder: OutlineInputBorder(
    //                       //             borderRadius: BorderRadius.circular(12),
    //                       //             borderSide: BorderSide(
    //                       //                 color: Colors.black.withOpacity(0.1),
    //                       //                 width: 1)),
    //                       //         contentPadding: const EdgeInsets.symmetric(
    //                       //             horizontal: 24),
    //                       //         fillColor:
    //                       //             Theme.of(context).colorScheme.onPrimary,
    //                       //         filled: true,
    //                       //       ),
    //                       //       onChanged: (value){
    //                       //         setState(() {
    //                       //           searchFilter = _textEditingController.text;
    //                       //         });
    //                       //       },
    //                       //     );
    //                       //   },
    //                       // ),
    //                       const SizedBox(height: 24),
    //                       Expanded(
    //                           child: SearchPage(
    //                         showTextfield: true,
    //                         bgColor: Theme.of(context).colorScheme.onPrimary,
    //                         padding: 0,
    //                         searchFilter: searchFilter,
    //                       ))
    //                     ],
    //                   )
    //                 : BlocBuilder<BottomNavBloc, BottomNavState>(
    //                     builder: (context, state) {
    //                       return TextFormField(
    //                         controller: _textEditingController,
    //                         textAlign: TextAlign.start,
    //                         textAlignVertical: TextAlignVertical.center,
    //                         style: Theme.of(context).textTheme.bodyMedium,
    //                         onTap: () {
    //                           BlocProvider.of<SearchBloc>(context)
    //                               .add(EnableSearchEvent());
    //                         },
    //                         decoration: InputDecoration(
    //                           hintText: 'Search anything...',
    //                           prefixIcon: UnconstrainedBox(
    //                             child: SvgPicture.asset(
    //                               'assets/images/icons/search.svg',
    //                               width: 20,
    //                               height: 20,
    //                               colorFilter: ColorFilter.mode(
    //                                   Theme.of(context).colorScheme.tertiary, BlendMode.srcIn),
    //                             ),
    //                           ),
    //                           hintStyle: TextStyle(
    //                               fontSize: 13,
    //                               fontWeight: Theme.of(context)
    //                                   .textTheme
    //                                   .bodyMedium!
    //                                   .fontWeight,
    //                               color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5)),
    //                           border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(12),
    //                               borderSide: BorderSide(
    //                                   color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
    //                                   width: 1)),
    //                           enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(12),
    //                               borderSide: BorderSide(
    //                                   color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
    //                                   width: 1)),
    //                           contentPadding:
    //                               const EdgeInsets.symmetric(horizontal: 24),
    //                           fillColor:
    //                               Theme.of(context).colorScheme.onPrimary,
    //                           filled: true,
    //                         ),
    //                         onChanged: (value) {
    //                           setState(() {
    //                             searchFilter = _textEditingController.text;
    //                           });
    //                         },
    //                       );
    //                     },
    //                   ),
    //           ),
    //         ),
    //       ),
    //
    //       //  AVATAR
    //       BlocBuilder<UserCrmBloc, UserCrmState>(
    //         builder: (context, state) {
    //           return Align(
    //               alignment: Alignment.topRight,
    //               child: Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                       horizontal: 24, vertical: 24),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       BlocBuilder<AppearanceSettingsBloc,
    //                           AppearanceSettingsState>(
    //                         builder: (context, appearanceState) {
    //                           return ValueListenableBuilder(
    //                               valueListenable: enableDarkMode,
    //                               builder: (BuildContext context,
    //                                       bool darkModeEnabled,
    //                                       Widget? child) =>
    //                                   CustomSwitch(
    //                                       isActive: isDarkMode(
    //                                               themeModeModel: appearanceState
    //                                                   .appearanceSettingsModel
    //                                                   .themeModeModel) ||
    //                                           darkModeEnabled,
    //                                       onChanged: (toggled) {
    //                                         enableDarkMode.value = toggled;
    //
    //                                         BlocProvider.of<
    //                                                     AppearanceSettingsBloc>(
    //                                                 context)
    //                                             .add(SetAppearanceSettingEvent(
    //                                                 key: themeModeKey,
    //                                                 value: toggled
    //                                                     ? ThemeModeModel
    //                                                         .dark.name
    //                                                     : ThemeModeModel
    //                                                         .light.name));
    //
    //                                         BlocProvider.of<
    //                                                     AppearanceSettingsBloc>(
    //                                                 context)
    //                                             .add(
    //                                                 GetAppearanceSettingsEvent());
    //                                       }));
    //                         },
    //                       ),
    //                       const SizedBox(width: 16),
    //                       state is UserCrmLoading
    //                           ? Shimmer.fromColors(
    //                               baseColor:
    //                                   Theme.of(context).colorScheme.onPrimary,
    //                               highlightColor:
    //                                   Theme.of(context).scaffoldBackgroundColor,
    //                               child: Container(
    //                                 width: 50,
    //                                 height: 50,
    //                                 decoration: BoxDecoration(
    //                                     shape: BoxShape.circle,
    //                                     color: Theme.of(context)
    //                                         .colorScheme
    //                                         .onPrimary),
    //                               ),
    //                             )
    //                           : const Avatar(
    //                               size: Size(50, 50),
    //                               backgroundColor: avatarOrange),
    //                     ],
    //                   )));
    //         },
    //       ),
    //       // Row(
    //       //   crossAxisAlignment: widget.isSearchActive
    //       //       ? CrossAxisAlignment.start
    //       //       : CrossAxisAlignment.center,
    //       //   children: [
    //       //     //  hamburger menu
    //       //     Expanded(
    //       //         flex: 1,
    //       //         child: Align(
    //       //           alignment: Alignment.centerLeft,
    //       //           child: MouseRegion(
    //       //             cursor: SystemMouseCursors.click,
    //       //             child: GestureDetector(
    //       //               onTap: widget.onHamburgerTap,
    //       //               child: UnconstrainedBox(
    //       //                 child: Container(
    //       //                   width: 50,
    //       //                   height: 50,
    //       //                   color: Theme.of(context).colorScheme.onPrimary,
    //       //                   child: Center(
    //       //                     child: SvgPicture.asset(
    //       //                       'assets/images/icons/web/hamburger_web.svg',
    //       //                       width: 20,
    //       //                       height: 20,
    //       //                       colorFilter: ColorFilter.mode(
    //       //                           Theme.of(context).colorScheme.primary,
    //       //                           BlendMode.srcIn),
    //       //                     ),
    //       //                   ),
    //       //                 ),
    //       //               ),
    //       //             ),
    //       //           ),
    //       //         )),
    //       //
    //       //     //  search
    //       //     Expanded(
    //       //         flex: 4,
    //       //         child: AnimatedContainer(
    //       //           duration: const Duration(milliseconds: 300),
    //       //           width: double.infinity,
    //       //           height: widget.isSearchActive ? 400 : 50,
    //       //           padding: EdgeInsets.symmetric(
    //       //               horizontal: widget.isSearchActive ? 16 : 0),
    //       //           decoration: BoxDecoration(
    //       //               color: Colors.red,
    //       //               borderRadius: widget.isSearchActive
    //       //                   ? BorderRadius.only(
    //       //                       bottomLeft: Radius.circular(24),
    //       //                       bottomRight: Radius.circular(24))
    //       //                   : null),
    //       //           child: TextFormField(
    //       //             controller: _textEditingController,
    //       //             textAlign: TextAlign.start,
    //       //             textAlignVertical: TextAlignVertical.center,
    //       //             style: Theme.of(context).textTheme.bodyMedium,
    //       //             decoration: InputDecoration(
    //       //                 hintText: 'Search anything...',
    //       //                 prefixIcon: UnconstrainedBox(
    //       //                   child: SvgPicture.asset(
    //       //                     'assets/images/icons/search.svg',
    //       //                     width: 20,
    //       //                     height: 20,
    //       //                     colorFilter: const ColorFilter.mode(
    //       //                         blackColor, BlendMode.srcIn),
    //       //                   ),
    //       //                 ),
    //       //                 hintStyle: TextStyle(
    //       //                     fontSize: 13,
    //       //                     fontWeight: Theme.of(context)
    //       //                         .textTheme
    //       //                         .bodyMedium!
    //       //                         .fontWeight,
    //       //                     color: Colors.black.withOpacity(0.5)),
    //       //                 border: OutlineInputBorder(
    //       //                     borderRadius: BorderRadius.circular(12),
    //       //                     borderSide: BorderSide(
    //       //                         color: Colors.black.withOpacity(0.1),
    //       //                         width: 1)),
    //       //                 enabledBorder: OutlineInputBorder(
    //       //                     borderRadius: BorderRadius.circular(12),
    //       //                     borderSide: BorderSide(
    //       //                         color: Colors.black.withOpacity(0.1),
    //       //                         width: 1)),
    //       //                 contentPadding:
    //       //                     const EdgeInsets.symmetric(horizontal: 24),
    //       //                 fillColor: Theme.of(context).colorScheme.onPrimary,
    //       //                 filled: true),
    //       //           ),
    //       //         )),
    //       //     //  notification and profile
    //       //     const Expanded(
    //       //       flex: 1,
    //       //       child:
    //       //           Avatar(size: Size(40, 40), backgroundColor: avatarOrange),
    //       //     )
    //       //   ],
    //       // ),
    //     ],
    //   ),
    // );
  }
}
