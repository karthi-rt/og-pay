import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/resources/app_icons.dart' as ic;
import 'package:ogpay/core/resources/app_images.dart' as img;
import 'package:ogpay/core/widgets/app_button.dart';
import 'package:ogpay/core/widgets/app_card.dart';
import 'package:ogpay/core/widgets/app_text.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../../core/widgets/app_textfield.dart';

/**
 * Created by karthi_rt on 11-05-2026.
 */

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: c.white,
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(img.verification_failed, width: Get.width, fit: BoxFit.fitWidth,),
                    const AppText("Verification Failed", fontSize: 18, color: c.error, fontWeight: FontWeight.w600,),
                    UIHelper.verticalSpaceS,
                    const AppText("Unfortunately, your account document verification has failed. Please get in touch with Customer Support to know more.", fontSize: 14, color: c.textPrimary, textAlign: TextAlign.center,),
                  ],
                ),
              ),
              const AppText("By using this app you agree to all the applicable", fontSize: 12, color: c.textPrimary, textAlign: TextAlign.center,),
              UIHelper.verticalSpaceXXS,
              const AppText("customersupport@ogpay.co.au", fontSize: 12, color: c.primary, textAlign: TextAlign.center, decoration: TextDecoration.underline, decorationColor: c.primary,),
              UIHelper.verticalSpaceXXXL,
            ],
          ),
        )
    );
  }
}