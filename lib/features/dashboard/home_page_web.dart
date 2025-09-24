import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWeb extends StatefulWidget {
  final double maxWidth;

  const HomePageWeb({super.key, required this.maxWidth});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Home"),
    );
    // return Scaffold(
    //   backgroundColor: Theme
    //       .of(context)
    //       .scaffoldBackgroundColor,
    //   body: Builder(
    //       builder: (context) {
    //         final productsBlocState = context
    //             .watch<DashboardBloc>()
    //             .state;
    //         final discoverBlocState = context
    //             .watch<DiscoverBloc>()
    //             .state;
    //         final userCrmBlocState = context
    //             .watch<UserCrmBloc>()
    //             .state;
    //         final productCategoriesBlocState =
    //             context
    //                 .watch<ProductCategoriesBloc>()
    //                 .state;
    //
    //         final isPageLoading = productsBlocState is UserProductsLoading ||
    //             discoverBlocState is DealsLoading ||
    //             userCrmBlocState is UserCrmLoading;
    //
    //         if (productsBlocState is UserProductsFailed ||
    //             discoverBlocState is DealsFailed ||
    //             productCategoriesBlocState is BritamProductsFailed ||
    //             userCrmBlocState is UserCrmFailed) {
    //           return LoadingErrorScreen(
    //               lottie: 'assets/lottie/error-fetching.json',
    //               errorTitle: "Oops! Something Went Wrong",
    //               errorDescription:
    //               "We've encountered a technical issue. Please try again later.",
    //               onRefresh: () async {
    //                 BlocProvider.of<UserCrmBloc>(context).add(
    //                     FetchUserCRMDetailsEvent(
    //                         nationalId: profile!.socialSecurityNumber!));
    //                 BlocProvider.of<DashboardBloc>(context).add(
    //                     FetchUserProductsEvent(
    //                         userNationalId: profile!.socialSecurityNumber!));
    //                 BlocProvider.of<ProductCategoriesBloc>(context)
    //                     .add(FetchBritamProductsEvent());
    //                 BlocProvider.of<DiscoverBloc>(context)
    //                     .add(FetchDealsAndOffersEvent());
    //                 context.read<CtaBloc>().add(FetchSupportedCtasEvent());
    //               });
    //         }
    //
    //         return CustomScrollView(
    //           physics: const BouncingScrollPhysics(),
    //           slivers: [
    //             const SliverToBoxAdapter(child: SizedBox(height: 40)),
    //
    //             //  Welcome Section
    //             WebWelcomeSection(maxWidth: widget.maxWidth, isLoading: isPageLoading,),
    //             const SliverToBoxAdapter(child: SizedBox(height: 40)),
    //
    //             //  My Products section implementation
    //             SliverToBoxAdapter(
    //               child: Padding(
    //                 padding: EdgeInsets.symmetric(
    //                     horizontal: widget.maxWidth <= webSmall ? 16 : 32.0),
    //                 child: Container(
    //                   width: double.infinity,
    //                   height: widget.maxWidth <= webSmall ? null : 350,
    //                   color: Theme
    //                       .of(context)
    //                       .scaffoldBackgroundColor,
    //                   child: widget.maxWidth <= webSmall
    //                       ? Column(
    //                     children: [
    //                       BlocBuilder<DashboardBloc, DashboardState>(
    //                         builder: (context, state) {
    //                           return QuickActionsSection(
    //                               maxWidth: widget.maxWidth,
    //                               isLoading: state is UserProductsLoading);
    //                         },
    //                       ),
    //                       const SizedBox(height: 24),
    //                       //  my products section
    //                       BlocBuilder<DashboardBloc, DashboardState>(
    //                         builder: (context, state) {
    //                           if (state is UserProductsLoading) {
    //                             return MyProductsSection(
    //                               maxWidth: widget.maxWidth,
    //                             );
    //                           }
    //
    //                           if (state is UserProductsSuccess) {
    //                             return MyProductsSection(
    //                               products: state.products,
    //                               maxWidth: widget.maxWidth,
    //                             );
    //                           }
    //
    //                           return MyProductsSection(
    //                             maxWidth: widget.maxWidth,
    //                           );
    //                         },
    //                       ),
    //                     ],
    //                   )
    //                       : Row(
    //                     children: [
    //                       //  my products section
    //                       BlocBuilder<DashboardBloc, DashboardState>(
    //                         builder: (context, state) {
    //                           if (state is UserProductsLoading) {
    //                             return MyProductsSection(
    //                               maxWidth: widget.maxWidth,
    //                             );
    //                           }
    //
    //                           if (state is UserProductsSuccess) {
    //                             return MyProductsSection(
    //                               products: state.products,
    //                               maxWidth: widget.maxWidth,
    //                             );
    //                           }
    //
    //                           return MyProductsSection(
    //                             maxWidth: widget.maxWidth,
    //                           );
    //                         },
    //                       ),
    //                       const SizedBox(width: 16),
    //                       BlocBuilder<DashboardBloc, DashboardState>(
    //                         builder: (context, state) {
    //                           return QuickActionsSection(
    //                               maxWidth: widget.maxWidth,
    //                               isLoading: state is UserProductsLoading);
    //                         },
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SliverToBoxAdapter(child: SizedBox(height: 40)),
    //
    //             //  deals and offers section
    //             BlocBuilder<DiscoverBloc, DiscoverState>(
    //               builder: (context, state) {
    //                 if (state is DealsLoading) {
    //                   return DealsAndOffersSection(maxWidth: widget.maxWidth);
    //                 }
    //
    //                 if (state is DealsSuccess) {
    //                   return DealsAndOffersSection(
    //                       dealsAndOffers: state.dealsAndOffers.take(3).toList(),
    //                       maxWidth: widget.maxWidth);
    //                 }
    //
    //                 if (state is DealsFailed) {
    //                   return DealsAndOffersSection(maxWidth: widget.maxWidth);
    //                 }
    //
    //                 return DealsAndOffersSection(maxWidth: widget.maxWidth);
    //               },
    //             ),
    //             const SliverToBoxAdapter(child: SizedBox(height: 32)),
    //
    //             //  our products section
    //             BlocBuilder<ProductCategoriesBloc, ProductCategoriesState>(
    //               builder: (context, state) {
    //                 if (state is BritamProductsLoading) {
    //                   return OurProductsSection(maxWidth: widget.maxWidth);
    //                 }
    //
    //                 if (state is BritamProductsSuccess) {
    //                   return OurProductsSection(
    //                       products: state.products, maxWidth: widget.maxWidth);
    //                 }
    //
    //                 if (state is BritamProductsFailed) {
    //                   return OurProductsSection(maxWidth: widget.maxWidth);
    //                 }
    //
    //                 return OurProductsSection(maxWidth: widget.maxWidth);
    //               },
    //             ),
    //             const SliverToBoxAdapter(child: SizedBox(height: 50)),
    //             //  footer
    //             // const SliverToBoxAdapter(child: DashboardFooter()),
    //           ],
    //         );
    //       }
    //   ),
    // );
  }
}
