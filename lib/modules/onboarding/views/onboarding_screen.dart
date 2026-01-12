import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ogpay/core/resources/app_images.dart' as img;
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/widgets/app_button.dart';
import 'package:ogpay/core/widgets/app_text.dart';
import '../../../core/services/preference_services.dart';
import '../../../core/utils/ui_helper.dart';
import '../../../routes/app_routes.dart';

/**
 * Created by karthi_rt on 02-01-2026.
 */

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PreferenceServices pref = Get.find<PreferenceServices>();
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": img.onboarding_login,
      "title": "Easy to Register",
      "description": "Just enter your details and you are ready to take off"
    },
    {
      "image": img.onboarding_chat,
      "title": "Stay Connected",
      "description": "Chat with friends, share updates, and keep your conversations in one place."
    },
    {
      "image": img.onboarding_wallet,
      "title": "Easy Payments",
      "description": "Send and receive money securely with just a few taps."
    },
    {
      "image": img.onboarding_get_started,
      "title": "Let's Get Started",
      "description": "Signup now and enjoy seamless payment experience."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      onboardingData[index]["image"]!,
                      height: Get.height/2.3,
                      width: Get.width,
                      fit: BoxFit.contain,
                    ),
                    UIHelper.verticalSpaceM,
                    AppText(onboardingData[index]["title"]!, fontSize: 22, color: c.primary, fontWeight: FontWeight.bold,),
                    UIHelper.verticalSpaceM,
                    AppText(onboardingData[index]["description"]!, fontSize: 16, color: c.textSecondary, textAlign: TextAlign.center,),
                  ],
                )
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length, (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 20 : 8,
                  decoration: BoxDecoration(color: _currentPage == index ? c.primary : c.grey4,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            UIHelper.verticalSpaceXXXL,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _currentPage == onboardingData.length - 1
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 28.0),
                          borderRadius: 48,
                          onPressed: () async {
                            await pref.setOnboardingSeen();
                            Get.offNamedUntil(AppRoutes.dashboardMenu, (route) => false);
                          },
                          label: 'Create Account',
                        ),
                        UIHelper.verticalSpaceM,
                        AppButton(
                          width: Get.width,
                          type: AppButtonType.outlined,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 28.0),
                          borderRadius: 48, textColor: c.primary,
                          onPressed: () async {
                            await pref.setOnboardingSeen();
                            Get.offNamedUntil(AppRoutes.dashboardMenu, (route) => false);
                          },
                          label: 'Login',
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          borderRadius: 48, textColor: c.primary,
                          backgroundColor: c.white,
                          onPressed: () {
                            _controller.jumpToPage(onboardingData.length - 1);
                          },
                          label: 'Skip',
                        ),
                        AppButton(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          borderRadius: 48,
                          onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                          label: 'Next',
                        ),
                      ],
                  ),
            ),
            UIHelper.verticalSpaceHuge,
          ],
        ),
      ),
    );
  }
}