import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/utils/ui_helper.dart';
import 'package:ogpay/core/widgets/app_card.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/app_textfield.dart';
import 'package:ogpay/core/resources/app_images.dart' as img;


/**
 * Created by karthi_rt on 09-01-2026.
 */

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: c.grey3,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    // padding: EdgeInsets.only(top: statusBarHeight + 10),
                    color: c.grey3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText("Scan OGPAY, QR", color: c.white, fontSize: 14, fontWeight: FontWeight.w600,),
                        UIHelper.verticalSpaceHuge,
                        UIHelper.verticalSpaceHuge,
                        AppText("Please hold for QR Scan", color: c.white, fontSize: 14, fontWeight: FontWeight.w600,)
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      height: 28.0,
                      width: 28.0,
                      margin: EdgeInsets.only(top: statusBarHeight + 10, left: statusBarHeight),
                      padding: const EdgeInsets.all(2.0),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: c.grey6),
                      child: const Center(child: Icon(Icons.close_rounded, color: c.white, size: 18,)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: AppCard(
                padding: const EdgeInsets.symmetric(horizontal: 20), margin: EdgeInsets.zero,
                shadow: false, width: Get.width,
                topRightRadius: 16, topLeftRadius: 16,
                backgroundColor: c.white,
                child: Column(
                  children: [
                    UIHelper.verticalSpaceS,
                    const AppCard(
                      width: 60, shadow: false,
                      height: 6, borderRadius: 16,
                      backgroundColor: c.grey2,
                      child: SizedBox(),
                    ),
                    UIHelper.verticalSpaceS,
                    const AppTextField(
                      name: "Name", hint: "Enter Name / Mobile No.", borderRadius: 36, keyboardType: TextInputType.name, textInputAction: TextInputAction.next,
                      padding: EdgeInsets.symmetric(vertical: 0), margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                    UIHelper.verticalSpaceS,
                    const Align(
                      alignment: Alignment.topLeft,
                      child: AppText("Recents", fontSize: 14, fontWeight: FontWeight.w600,)
                    ),
                    UIHelper.verticalSpaceS,
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const AppCard(
                            shadow: false,
                            backgroundColor: c.white,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.only(right: 6),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  // backgroundImage: NetworkImage('https://example.com'),
                                  backgroundImage: AssetImage(img.profile),
                                ),
                                UIHelper.verticalSpaceXS,
                                AppText("Mike", fontSize: 12,)
                              ],
                            )
                          );
                        },
                      ),
                    ),
                    AppButton(
                      width: Get.width, backgroundColor: c.primary,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 28.0),
                      borderRadius: 48,
                      onPressed: () async {},
                      label: 'Proceed',
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}