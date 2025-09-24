

import 'package:flutter/material.dart';
import 'package:pixabay_web/core/app_route.dart';
import 'package:pixabay_web/core/app_theme.dart';
import 'package:pixabay_web/core/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpLocator();

runApp(const PixabayApp());
}


class PixabayApp extends StatelessWidget {
  const PixabayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PixabayView();
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<OnBoardingBloc>(
    //       lazy: false,
    //       create: (_) =>
    //       locator<OnBoardingBloc>()..add(FetchedOnBoardingContentEvent()),
    //     ),
    //     BlocProvider<CoreBloc>(
    //       create: (_) => CoreBloc(),
    //     ),
    //     BlocProvider<DashboardBloc>(
    //       create: (_) => DashboardBloc(),
    //     ),
    //     BlocProvider<ActivityBloc>(
    //       create: (_) => ActivityBloc(),
    //     ),
    //     BlocProvider<DiscoverBloc>(
    //       create: (_) => DiscoverBloc(),
    //     ),
    //     BlocProvider<HelpBloc>(
    //       create: (_) => HelpBloc(),
    //     ),
    //     BlocProvider<WhatsappBloc>(
    //       create: (_) => WhatsappBloc(),
    //     ),
    //     BlocProvider<FilePickerBloc>(
    //       create: (_) => FilePickerBloc(),
    //     ),
    //     BlocProvider<FilePickerBeneficiaryBloc>(
    //       create: (_) => FilePickerBeneficiaryBloc(),
    //     ),
    //     BlocProvider<FilePickerWebBloc>(
    //       create: (_) => FilePickerWebBloc(),
    //     ),
    //     BlocProvider<FilePickerNomineeWebBloc>(
    //       create: (_) => FilePickerNomineeWebBloc(),
    //     ),
    //     BlocProvider<ProductCategoriesBloc>(
    //       create: (_) => ProductCategoriesBloc(),
    //     ),
    //     BlocProvider<BottomNavBloc>(
    //       create: (_) => BottomNavBloc(),
    //     ),
    //     BlocProvider<ProductsBloc>(
    //       create: (_) => ProductsBloc(),
    //     ),
    //     BlocProvider<BtnsCubit>(
    //       create: (_) => BtnsCubit(),
    //     ),
    //     BlocProvider<TimerBloc>(
    //       create: (_) => locator<TimerBloc>(),
    //     ),
    //     BlocProvider<PolicyBloc>(
    //       create: (_) => locator<PolicyBloc>(),
    //     ),
    //     BlocProvider<TypeOfRequestBloc>(
    //       create: (_) => TypeOfRequestBloc(),
    //     ),
    //     BlocProvider<PaymentModeBloc>(
    //       create: (_) => locator<PaymentModeBloc>(),
    //     ),
    //     BlocProvider<SupportedBankBranchesBloc>(
    //       create: (_) => locator<SupportedBankBranchesBloc>(),
    //     ),
    //     BlocProvider<SupportedBanksBloc>(
    //       create: (_) => locator<SupportedBanksBloc>(),
    //     ),
    //
    //     BlocProvider<SupportedMobileMoniesBloc>(
    //       create: (_) => locator<SupportedMobileMoniesBloc>(),
    //     ),
    //     BlocProvider<RepaymentDurationBloc>(
    //       create: (_) => RepaymentDurationBloc(),
    //     ),
    //     BlocProvider<TimeFrequencyBloc>(
    //       create: (_) => TimeFrequencyBloc(),
    //     ),
    //     BlocProvider<TargetBloc>(
    //       create: (_) => TargetBloc(),
    //     ),
    //     BlocProvider<CtaBloc>(
    //       create: (_) => CtaBloc(),
    //     ),
    //     BlocProvider<AvailablePayoutsBloc>(
    //       create: (_) => locator<AvailablePayoutsBloc>(),
    //     ),
    //     BlocProvider<SidebarBloc>(
    //       create: (_) => SidebarBloc(),
    //     ),
    //     BlocProvider<BranchesBloc>(
    //       create: (_) => BranchesBloc(),
    //     ),
    //     BlocProvider<FaqBloc>(
    //       create: (_) => FaqBloc(),
    //     ),
    //     BlocProvider<SubmitFeedbackBloc>(
    //       create: (_) => SubmitFeedbackBloc(),
    //     ),
    //     BlocProvider<RequestCallbackBloc>(
    //       create: (_) => RequestCallbackBloc(),
    //     ),
    //     BlocProvider<TaxBloc>(
    //       create: (_) => TaxBloc(),
    //     ),
    //     BlocProvider<TaxCertificateDownloadBloc>(
    //       create: (_) => TaxCertificateDownloadBloc(),
    //     ),
    //     BlocProvider<PolicyDownloadBloc>(
    //       create: (_) => PolicyDownloadBloc(),
    //     ),
    //     BlocProvider<SignUpBloc>(
    //       create: (_) => locator<SignUpBloc>(),
    //     ),
    //     BlocProvider<LogInBloc>(
    //       create: (_) => locator<LogInBloc>(),
    //     ),
    //     BlocProvider<ForgotPasswordBloc>(
    //       create: (_) => locator<ForgotPasswordBloc>(),
    //     ),
    //     BlocProvider<StatementBloc>(
    //       create: (_) => StatementBloc(),
    //     ),
    //     BlocProvider<ActivateNomineeBloc>(
    //       create: (_) => ActivateNomineeBloc(),
    //     ),
    //     BlocProvider<ProfileBloc>(
    //       create: (_) => locator<ProfileBloc>(),
    //     ),
    //     BlocProvider<UserCrmBloc>(
    //       create: (_) => UserCrmBloc(),
    //     ),
    //     BlocProvider<PartialWithdrawalBloc>(
    //       create: (_) => locator<PartialWithdrawalBloc>(),
    //     ),
    //     BlocProvider<RaiseSrWithAttachmentBloc>(
    //       create: (_) => RaiseSrWithAttachmentBloc(),
    //     ),
    //     BlocProvider<RaiseSrWithoutAttachmentBloc>(
    //       create: (_) => RaiseSrWithoutAttachmentBloc(),
    //     ),
    //     BlocProvider<PensionGetMemberIdBloc>(
    //       create: (_) => PensionGetMemberIdBloc(),
    //     ),
    //     BlocProvider<PensionGetAccountDetailsBloc>(
    //       create: (_) => PensionGetAccountDetailsBloc(),
    //     ),
    //     BlocProvider<PensionGetOpenBalanceBloc>(
    //       create: (_) => PensionGetOpenBalanceBloc(),
    //     ),
    //     BlocProvider<PensionClosingBalanceBloc>(
    //       create: (_) => PensionClosingBalanceBloc(),
    //     ),
    //     BlocProvider<PensionGetContributionsBloc>(
    //       create: (_) => PensionGetContributionsBloc(),
    //     ),
    //     BlocProvider<PensionGetPolicyPaymentsBloc>(
    //       create: (_) => PensionGetPolicyPaymentsBloc(),
    //     ),
    //     BlocProvider<PensionGetInvestmentInterestBloc>(
    //       create: (_) => PensionGetInvestmentInterestBloc(),
    //     ),
    //     BlocProvider<LifeGetPolicyBenefitsBloc>(
    //       create: (_) => LifeGetPolicyBenefitsBloc(),
    //     ),
    //     BlocProvider<LifeGetPolicyDetailsBloc>(
    //       create: (_) => LifeGetPolicyDetailsBloc(),
    //     ),
    //     BlocProvider<LifeGetPolicyRelationsBloc>(
    //       create: (_) => LifeGetPolicyRelationsBloc(),
    //     ),
    //     BlocProvider<GiGetPolicyDetailsBloc>(
    //       create: (_) => GiGetPolicyDetailsBloc(),
    //     ),
    //     BlocProvider<GiGetPolicyCoverBloc>(
    //       create: (_) => GiGetPolicyCoverBloc(),
    //     ),
    //     BlocProvider<GiGetInvoicesBloc>(
    //       create: (_) => GiGetInvoicesBloc(),
    //     ),
    //     BlocProvider<GiGetPolicyPaymentsBloc>(
    //       create: (_) => GiGetPolicyPaymentsBloc(),
    //     ),
    //     BlocProvider<MotorLogBookFilePickerBloc>(
    //       create: (_) => MotorLogBookFilePickerBloc(),
    //     ),
    //     BlocProvider<InvestmentsGetAccountHoldingsBloc>(
    //       create: (_) => InvestmentsGetAccountHoldingsBloc(),
    //     ),
    //     BlocProvider<InvestmentsGetAccountHoldingsToBloc>(
    //       create: (_) => InvestmentsGetAccountHoldingsToBloc(),
    //     ),
    //     BlocProvider<InvestmentsGetAccountTransactionsBloc>(
    //       create: (_) => InvestmentsGetAccountTransactionsBloc(),
    //     ),
    //     BlocProvider<InvestmentsGetAccountBankDetailsBloc>(
    //       create: (_) => InvestmentsGetAccountBankDetailsBloc(),
    //     ),
    //     BlocProvider<InvestmentsGetAccountNomineesBloc>(
    //       create: (_) => InvestmentsGetAccountNomineesBloc(),
    //     ),
    //     BlocProvider<InvestmentsGetAccountTargetsBloc>(
    //       create: (_) => InvestmentsGetAccountTargetsBloc(),
    //     ),
    //     BlocProvider<MpesaStkBloc>(
    //       create: (_) => MpesaStkBloc(),
    //     ),
    //     BlocProvider<MmfMpesaStkBloc>(
    //       create: (_) => MmfMpesaStkBloc(),
    //     ),
    //     BlocProvider<MpesaCallbackBloc>(
    //       create: (_) => MpesaCallbackBloc(),
    //     ),
    //     BlocProvider<CreateBamAccountBloc>(
    //       create: (_) => CreateBamAccountBloc(),
    //     ),
    //     BlocProvider<CreateClientBloc>(
    //       create: (_) => CreateClientBloc(),
    //     ),
    //     BlocProvider<CreateAccountBloc>(
    //       create: (_) => CreateAccountBloc(),
    //     ),
    //     BlocProvider<MmfRateBloc>(
    //       create: (_) => MmfRateBloc(),
    //     ),
    //     BlocProvider<BritamLobBloc>(
    //       create: (_) => locator<BritamLobBloc>(),
    //     ),
    //     BlocProvider<PersonBloc>(
    //       create: (_) => locator<PersonBloc>(),
    //     ),
    //     BlocProvider<HoldingsBloc>(
    //       create: (_) => locator<HoldingsBloc>(),
    //     ),
    //     BlocProvider<TransferAccountHoldingBloc>(
    //       create: (_) => locator<TransferAccountHoldingBloc>(),
    //     ),
    //     BlocProvider<PremiumUnitLinkedEligibilityBloc>(
    //       create: (_) => PremiumUnitLinkedEligibilityBloc(),
    //     ),
    //     BlocProvider<PremiumStatementBloc>(
    //       create: (_) => PremiumStatementBloc(),
    //     ),
    //     BlocProvider<UnitLinkedStatementBloc>(
    //       create: (_) => UnitLinkedStatementBloc(),
    //     ),
    //     BlocProvider<StatementBeneficiariesBloc>(
    //       create: (_) => StatementBeneficiariesBloc(),
    //     ),
    //     BlocProvider<AppearanceSettingsBloc>(
    //       create: (_) =>
    //       AppearanceSettingsBloc()..add(GetAppearanceSettingsEvent()),
    //     ),
    //     BlocProvider<GeneralSettingsBloc>(
    //       create: (_) => GeneralSettingsBloc()..add(GetGeneralSettingsEvent()),
    //     ),
    //     BlocProvider<DeviceInfoBloc>(
    //       create: (_) => DeviceInfoBloc(),
    //     ),
    //     BlocProvider<ThemeBloc>(
    //       create: (_) => ThemeBloc(),
    //     ),
    //     BlocProvider<ImageAndFilePickerBloc>(
    //       create: (_) => ImageAndFilePickerBloc(),
    //     ),
    //     BlocProvider<CardPaymentBloc>(
    //       create: (_) => locator<CardPaymentBloc>(),
    //     ),
    //     BlocProvider<PaymentsBloc>(
    //       create: (_) => locator<PaymentsBloc>(),
    //     ),
    //     BlocProvider<LifePaymentsBloc>(
    //       create: (_) => locator<LifePaymentsBloc>(),
    //     ),
    //     BlocProvider<GeneralPaymentsBloc>(
    //       create: (_) => locator<GeneralPaymentsBloc>(),
    //     ),
    //     BlocProvider<BritamProductBloc>(
    //       create: (_) => locator<BritamProductBloc>(),
    //     ),
    //     BlocProvider<SrBloc>(
    //       create: (_) => locator<SrBloc>(),
    //     ),
    //     BlocProvider<CountryBloc>(
    //       create: (_) => CountryBloc(),
    //     ),
    //     BlocProvider<TogglePdfViewerBloc>(
    //       create: (_) => TogglePdfViewerBloc(),
    //     ),
    //     BlocProvider<MotorIdFilePickerBloc>(
    //       create: (_) => MotorIdFilePickerBloc(),
    //     ),
    //     BlocProvider<SearchBloc>(
    //       create: (_) => SearchBloc(),
    //     ),
    //   ],
    //   child: const PixabayView(),
    // );
  }
}

class PixabayView extends StatefulWidget {
  const PixabayView({super.key});

  @override
  State<PixabayView> createState() => _PixabayViewState();
}

class _PixabayViewState extends State<PixabayView>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Pixabay',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
    );

  }
}
