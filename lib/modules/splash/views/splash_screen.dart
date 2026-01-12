import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogpay/core/resources/app_strings.dart' as s;
import 'package:ogpay/core/services/preference_services.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/widgets/app_text.dart';
import 'package:ogpay/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * Created by karthi_rt on 02-01-2026.
 */


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final PreferenceServices pref = Get.find<PreferenceServices>();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {

    final seenOnboarding = await pref.getOnboardingSeen();
    await Future.delayed(const Duration(seconds: 2));

    if(seenOnboarding) {
      Get.offNamedUntil(AppRoutes.dashboardMenu, (route) => false);
    } else {
      Get.offNamedUntil(AppRoutes.onboarding, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: c.primary,
      body: Center(
        child: AppText(s.appName, fontSize: 24, color: c.white, fontWeight: FontWeight.bold,),
      ),
    );
  }
}