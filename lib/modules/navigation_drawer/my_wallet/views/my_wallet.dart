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
import '../../../../routes/app_routes.dart';
import '../../../widgets/feature_action_card.dart';

/**
 * Created by karthi_rt on 11-03-2026.
 */

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: c.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(16, statusBarHeight * 1.5, 16, 0.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    AppCard(
                      backgroundColor: c.white,
                      borderRadius: 36,
                      shadow: true,
                      child: Icon(Icons.arrow_back_ios_new, size: 18,),
                    ),
                    Expanded(child: AppText("My Wallet", color: c.primary, fontSize: 18, fontWeight: FontWeight.w600, textAlign: TextAlign.center,)),
                    Icon(Icons.notifications_none_outlined,),
                  ],
                ),
                UIHelper.verticalSpaceM,
                const AppCard(
                  padding: EdgeInsets.all(12.0),
                  borderRadius: 14,
                  backgroundColor: c.primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppText("Hello, karthi_rt", color: c.white, fontSize: 14, fontWeight: FontWeight.w600,),
                        ],
                      ),
                      UIHelper.verticalSpaceL,
                      AppText("OGPay ID Number", color: c.white, fontSize: 12, fontWeight: FontWeight.w600,),
                      AppText("4479-1112-3456", color: c.white, fontSize: 16, fontWeight: FontWeight.w600,),
                      UIHelper.verticalSpaceL,
                      AppText("Current Balance", color: c.white, fontSize: 12, fontWeight: FontWeight.w600,),
                      AppText("₹ 5468.40", color: c.white, fontSize: 14, fontWeight: FontWeight.w600,),
                    ]
                  )
                ),
                UIHelper.verticalSpaceM,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText("OGPAY Features", fontSize: 14, fontWeight: FontWeight.w600,),
                    UIHelper.verticalSpaceM,
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FeatureActionCard(
                            iconPath: ic.rupee,
                            title: "Add Money",
                            backgroundColor: c.primary,
                          ),
                          UIHelper.horizontalSpaceS,
                          FeatureActionCard(
                            iconPath: ic.cash,
                            title: "Transfer to Bank",
                            backgroundColor: c.primary,
                            onTap: ()=> Get.toNamed(AppRoutes.transferToBank),
                          ),
                          UIHelper.horizontalSpaceS,
                          FeatureActionCard(
                            iconPath: ic.wallet,
                            title: "Transaction History",
                            backgroundColor: c.primary,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                UIHelper.verticalSpaceXL,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText("Recent Transactions", fontSize: 14, fontWeight: FontWeight.w600,),
                    AppText("See all", fontSize: 14, fontWeight: FontWeight.w600,),
                  ],
                ),
                UIHelper.verticalSpaceM,
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 30),
                  itemCount: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AppCard(
                        shadow: false,
                        backgroundColor: c.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  backgroundImage: AssetImage(img.profile),
                                  backgroundColor: Colors.transparent,
                                ),
                                UIHelper.horizontalSpaceXS,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText("Mike Lyne", fontSize: 14, fontWeight: FontWeight.w500,),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: 'Transaction ID : ', style: TextStyle(fontFamily: 'Poppins',fontSize: 12)),
                                          TextSpan(
                                            text: '10387483',
                                            style: TextStyle(fontFamily: 'Poppins',color: c.primary, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(ic.rupee, width: 18, height: 18,),
                                const AppText("RENT", fontSize: 10, fontWeight: FontWeight.w600,),
                              ],
                            ),
                            const Column(
                              children: [
                                AppText("₹ 10", fontSize: 14, color: c.primary, fontWeight: FontWeight.w700,),
                                AppText("3 min ago", fontSize: 12,),
                              ],
                            ),
                          ],
                        )
                    );
                  },
                ),
              ]
            ),
          ),
        )
    );
  }
}
