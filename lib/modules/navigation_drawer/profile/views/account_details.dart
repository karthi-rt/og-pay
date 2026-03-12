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
 * Created by karthi_rt on 12-03-2026.
 */

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: c.white,
        body: Container(
          height: Get.height,
          child: Stack(
            children: [
              AppCard(
                width: Get.width,
                height: Get.width/2,
                padding: EdgeInsets.fromLTRB(Get.width/10, statusBarHeight + 16, Get.width/10, 16.0),
                backgroundColor: c.primary,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios, color: c.white, size: 20,),
                  ],
                ),
              ),
              Positioned(
                top: Get.width/3,
                child: AppCard(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  topLeftRadius: 16.0, topRightRadius: 16.0,
                  shadow: false,
                  width: Get.width,
                  backgroundColor: c.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UIHelper.verticalSpaceXXXL,
                        const AppText("Disabled Account", fontSize: 17, color: c.primary, fontWeight: FontWeight.w600,),
                        UIHelper.verticalSpaceXXS,
                        const AppText("Account will be disabled temporarily", fontSize: 14, color: c.textPrimary,),
                        UIHelper.verticalSpaceXXL,
                        const AppText("Why are you disabling the account?", fontSize: 14, color: c.primary, fontWeight: FontWeight.w600,),
                        UIHelper.verticalSpaceM,
                        SvgPicture.asset(img.disabled_account, width: Get.width, height: Get.width/3,),
                        UIHelper.verticalSpaceM,
                        const AppTextField(name: "Reason", hint: "Write your reason", borderRadius: 12, maxLines: 6,
                          keyboardType: TextInputType.text, textInputAction: TextInputAction.done,
                          padding: EdgeInsets.symmetric(vertical: 0), contentPaddingTap: 12,
                        ),
                        UIHelper.verticalSpaceL,
                        const AppText("Please note that disabled can only be enabled by our customer support team", textAlign: TextAlign.center, padding: EdgeInsets.symmetric(horizontal: 12.0), fontSize: 14, color: c.textPrimary,),
                        UIHelper.verticalSpaceXXL,
                        AppButton(
                          width: Get.width, backgroundColor: c.textSecondary,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 28.0),
                          borderRadius: 48,
                          onPressed: () async {},
                          label: 'Disable Now',
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}