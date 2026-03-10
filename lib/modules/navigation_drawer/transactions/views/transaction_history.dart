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
import '../widgets/amount_info_widget.dart';

/**
 * Created by karthi_rt on 12-01-2026.
 */

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: c.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36),),
        backgroundColor: c.primary,
        child: const Icon(Icons.article),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppCard(
              bottomLeftRadius: 16.0, bottomRightRadius: 16.0,
              padding: EdgeInsets.fromLTRB(Get.width/10, statusBarHeight * 1.5, Get.width/10, 16.0),
              backgroundColor: c.primary,
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back_ios, color: c.white, size: 18,),
                      Expanded(child: AppText("Transaction History", color: c.white, fontWeight: FontWeight.w600, textAlign: TextAlign.center,)),
                      Icon(Icons.filter_alt_outlined, color: c.white, size: 18,),
                    ],
                  ),
                  UIHelper.verticalSpaceXXL,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("Current Balance", color: c.white, fontSize: 14, fontWeight: FontWeight.w400,),
                          AppText("₹ 5468.40", color: c.white, fontSize: 18, fontWeight: FontWeight.w600,),
                        ],
                      ),
                      AppText("March, 2026", color: c.white, fontSize: 14,),
                    ],
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpaceM,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AmountInfoWidget(
                              title: "Total Addition",
                              amount: "5468.40",
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: c.textPrimary,
                            ),
                            AmountInfoWidget(
                              title: "Total Spents",
                              amount: "516.40",
                            ),
                          ],
                        ),
                      ),
                    UIHelper.verticalSpaceXXL,
                    const AppText("Total Transactions", fontSize: 14, fontWeight: FontWeight.w600,),
                    UIHelper.verticalSpaceS,
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 30),
                        itemCount: 16,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
