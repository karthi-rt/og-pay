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

/**
 * Created by karthi_rt on 12-01-2026.
 */

class ReferralProgramScreen extends StatefulWidget {
  const ReferralProgramScreen({super.key});

  @override
  State<ReferralProgramScreen> createState() => _ReferralProgramScreenState();
}

class _ReferralProgramScreenState extends State<ReferralProgramScreen> {
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: c.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppCard(
                bottomLeftRadius: 16.0, bottomRightRadius: 16.0,
                padding: EdgeInsets.fromLTRB(Get.width/10, statusBarHeight + 6, Get.width/10, 16.0),
                backgroundColor: c.primary,
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back_ios, color: c.white, size: 18,),
                        UIHelper.horizontalSpaceXL,
                        AppText("Referral Program", color: c.white, fontWeight: FontWeight.w600,),
                      ],
                    ),
                    UIHelper.verticalSpaceXXL,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText("Total Earned this Month", color: c.white, fontSize: 14, fontWeight: FontWeight.w400,),
                            AppText("₹ 20.00", color: c.white, fontSize: 18, fontWeight: FontWeight.w600,),
                          ],
                        ),
                        AppButton(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          borderRadius: 26, padding: EdgeInsets.symmetric(horizontal: 12.0),
                          type: AppButtonType.outlined,
                          backgroundColor: c.white,
                          label: "Details"
                        )
                      ],
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceM,
              SvgPicture.asset(img.mobile_share, width: Get.width, height: Get.width/2,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width/8),
                child: const Column(
                  children: [
                    AppText("How it works", color: c.primary, fontWeight: FontWeight.w600,),
                    UIHelper.verticalSpaceM,
                    AppText(
                      "Share your refer code with you friends & family. Earn up to ₹ 20 for every person you refer",
                      textAlign: TextAlign.center, fontSize: 14,
                    ),
                    UIHelper.verticalSpaceXL,
                    AppText("MIK - 578", fontSize: 18, fontWeight: FontWeight.w600,),
                    UIHelper.verticalSpaceS,
                    AppText("Your code", color: c.primary, fontWeight: FontWeight.w500,),
                    UIHelper.verticalSpaceXXL,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          borderRadius: 48, textColor: c.primary,
                          backgroundColor: c.primaryLite,
                          type: AppButtonType.filled,
                          label: "Share",
                          leadingIcon: Icons.share_outlined, iconPadding: EdgeInsets.only(right: 6.0),
                        ),
                        AppButton(
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          borderRadius: 48, textColor: c.textPrimary,
                          backgroundColor: c.primaryLite,
                          type: AppButtonType.filled,
                          label: "Copy",
                          leadingIcon: Icons.insert_link_outlined, iconPadding: EdgeInsets.only(right: 6.0),
                        )
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}

