// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
//
// class DashboardAppBarWeb extends StatefulWidget {
//   final double maxWidth;
//   final bool isSearchActive;
//   final VoidCallback onHamburgerTap;
//
//   const DashboardAppBarWeb(
//       {super.key,
//       required this.maxWidth,
//       this.isSearchActive = false,
//       required this.onHamburgerTap});
//
//   @override
//   State<DashboardAppBarWeb> createState() => _DashboardAppBarWebState();
// }
//
// class _DashboardAppBarWebState extends State<DashboardAppBarWeb> {
//   late final TextEditingController _textEditingController;
//   String searchFilter = '';
//
//   ValueNotifier<bool> darkModeActivated = ValueNotifier(false);
//
//   @override
//   void initState() {
//     super.initState();
//
//     _textEditingController = TextEditingController();
//     _textEditingController.addListener(() {
//       setState(() {
//         searchFilter = _textEditingController.text;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Text("DERE");
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       height: 55,
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.onPrimary,
//           borderRadius:
//           const BorderRadius.only(topLeft: Radius.circular(24))),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           MouseRegion(
//             cursor: SystemMouseCursors.click,
//             child: GestureDetector(
//               onTap: widget.onHamburgerTap,
//               child: UnconstrainedBox(
//                 child: Container(
//                   width: 30,
//                   height: 30,
//                   color: Colors.transparent,
//                   child: Center(
//                     child: SvgPicture.asset(
//                       'assets/images/hamburger.svg',
//                       width: double.infinity,
//                       height: double.infinity,
//                       colorFilter: ColorFilter.mode(
//                           Theme.of(context).colorScheme.primary,
//                           BlendMode.srcIn),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // UnconstrainedBox(
//           //   child: AnimatedContainer(
//           //     duration: const Duration(milliseconds: 300),
//           //     width: widget.maxWidth * 0.5,
//           //     height: 40,
//           //     // margin: const EdgeInsets.symmetric(vertical: 4),
//           //     decoration: BoxDecoration(
//           //         color: Colors.transparent,
//           //         borderRadius: widget.isSearchActive
//           //             ? const BorderRadius.only(
//           //             bottomLeft: Radius.circular(24),
//           //             bottomRight: Radius.circular(24))
//           //             : null),
//           //     child:
//           //     // widget.isSearchActive
//           //     //     ?
//           //
//           //     Column(
//           //       children: [
//           //         // BlocBuilder<BottomNavBloc, BottomNavState>(
//           //         //   builder: (context, state) {
//           //         //     return TextFormField(
//           //         //       controller: _textEditingController,
//           //         //       textAlign: TextAlign.start,
//           //         //       textAlignVertical: TextAlignVertical.center,
//           //         //       style: Theme.of(context).textTheme.bodyMedium,
//           //         //       onTap: () {
//           //         //         BlocProvider.of<BottomNavBloc>(context).add(
//           //         //             ToggleSearch(
//           //         //                 isActive: true,
//           //         //                 currentIndex: state.currentIndex));
//           //         //       },
//           //         //       decoration: InputDecoration(
//           //         //         hintText: 'Search anything...',
//           //         //         prefixIcon: UnconstrainedBox(
//           //         //           child: SvgPicture.asset(
//           //         //             'assets/images/icons/search.svg',
//           //         //             width: 20,
//           //         //             height: 20,
//           //         //             colorFilter: const ColorFilter.mode(
//           //         //                 blackColor, BlendMode.srcIn),
//           //         //           ),
//           //         //         ),
//           //         //         hintStyle: TextStyle(
//           //         //             fontSize: 13,
//           //         //             fontWeight: Theme.of(context)
//           //         //                 .textTheme
//           //         //                 .bodyMedium!
//           //         //                 .fontWeight,
//           //         //             color: Colors.black.withOpacity(0.5)),
//           //         //         border: OutlineInputBorder(
//           //         //             borderRadius: BorderRadius.circular(12),
//           //         //             borderSide: BorderSide(
//           //         //                 color: Colors.black.withOpacity(0.1),
//           //         //                 width: 1)),
//           //         //         enabledBorder: OutlineInputBorder(
//           //         //             borderRadius: BorderRadius.circular(12),
//           //         //             borderSide: BorderSide(
//           //         //                 color: Colors.black.withOpacity(0.1),
//           //         //                 width: 1)),
//           //         //         contentPadding: const EdgeInsets.symmetric(
//           //         //             horizontal: 24),
//           //         //         fillColor:
//           //         //             Theme.of(context).colorScheme.onPrimary,
//           //         //         filled: true,
//           //         //       ),
//           //         //       onChanged: (value){
//           //         //         setState(() {
//           //         //           searchFilter = _textEditingController.text;
//           //         //         });
//           //         //       },
//           //         //     );
//           //         //   },
//           //         // ),
//           //         const SizedBox(height: 24),
//           //       ],
//           //     )
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
