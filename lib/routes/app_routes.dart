import 'package:get/get.dart';
import 'package:ogpay/modules/dashboard_menu/views/dashboard_menu.dart';
import 'package:ogpay/modules/navigation_drawer/referrals/views/referral_program_screen.dart';
import 'package:ogpay/modules/navigation_drawer/transactions/views/transaction_history.dart';
import 'package:ogpay/modules/navigation_drawer/wallet/views/my_wallet.dart';
import 'package:ogpay/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:ogpay/modules/onboarding/views/onboarding_screen.dart';
import 'package:ogpay/modules/splash/controllers/splash_controller.dart';
import 'package:ogpay/modules/splash/views/splash_screen.dart';

/**
 * Created by karthi_rt on 02-01-2026.
 */

class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const dashboardMenu = '/dashboardMenu';
  static const referralProgram = '/referralProgram';
  static const transactionHistory = '/transactionHistory';
  static const myWallet = '/myWallet';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: dashboardMenu,
      page: () => const DashboardMenu(),
      /*binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),*/
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: referralProgram,
      page: () => const ReferralProgramScreen(),
      /*binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),*/
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: transactionHistory,
      page: () => const TransactionHistory(),
      /*binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),*/
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: myWallet,
      page: () => const MyWallet(),
      /*binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),*/
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),

  ];
}
