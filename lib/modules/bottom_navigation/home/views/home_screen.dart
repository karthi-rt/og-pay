import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/resources/app_icons.dart' as ic;
import 'package:ogpay/core/resources/app_images.dart' as img;
import 'package:ogpay/core/utils/ui_helper.dart';
import 'package:ogpay/core/widgets/app_button.dart';
import 'package:ogpay/core/widgets/app_card.dart';
import 'package:ogpay/core/widgets/app_text.dart';
import 'package:ogpay/modules/bottom_navigation/home/controller/home_controller.dart';
import 'package:ogpay/modules/bottom_navigation/home/widgets/feature_action_card.dart';

/**
 * Created by karthi_rt on 09-01-2026.
 */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final homeController = Get.find<HomeController>();
  final CarouselSliderController _controller = CarouselSliderController();

  int _current = 0;
  late List<Widget> imageSliders;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {}

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: c.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: statusBarHeight + 6),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => ZoomDrawer.of(context)!.open(),
                    child: SvgPicture.asset(ic.menu, width: 24, height: 24,)
                  ),
                  Expanded(child: Image.asset(img.logo, height: 48,),),
                  SvgPicture.asset(ic.search, width: 24, height: 24,),
                  UIHelper.horizontalSpaceM,
                  Badge(
                    label: Text('3'), // The number to display
                    child: SvgPicture.asset(ic.notification, width: 24, height: 24,),
                  ),
                  UIHelper.horizontalSpaceXS,
                ],
              ),
              UIHelper.verticalSpaceM,
              imageCarouselSlider(),
              UIHelper.verticalSpaceS,
              AppCard(
                backgroundColor: c.white,
                borderRadius: 8.0,
                child: Row(
                  children: [
                    SvgPicture.asset(ic.giftbox, width: 24, height: 24,),
                    UIHelper.horizontalSpaceM,
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("ONLY CASHBACK OFFER", fontSize: 12, fontWeight: FontWeight.w600,),
                          AppText("Performs 0 transactions to get daily cashback", fontSize: 12, fontWeight: FontWeight.w500, color: c.primary,)
                        ],
                      ),
                    ),
                    AppButton(
                      padding: EdgeInsets.zero,
                      borderRadius: 48, backgroundColor: c.secondary.withOpacity(0.90),
                      onPressed: (){},
                      label: "See now",
                      fontSize: 12, type: AppButtonType.elevated,
                    )
          
                  ],
                )
              ),
              UIHelper.verticalSpaceS,
              const AppCard(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
                backgroundColor: c.white,
                borderRadius: 8.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText("OGPAY Features", fontSize: 14, fontWeight: FontWeight.w600,),
                    UIHelper.verticalSpaceM,
                    Row(
                      children: [
                        FeatureActionCard(
                          iconPath: ic.bank,
                          title: "Bank Transfer",
                          backgroundColor: c.primary,
                        ),
                        UIHelper.horizontalSpaceS,
                        FeatureActionCard(
                          iconPath: ic.cash,
                          title: "Pay Money",
                          backgroundColor: c.primary,
                        ),
                        UIHelper.horizontalSpaceS,
                        FeatureActionCard(
                          iconPath: ic.wallet,
                          title: "OGPAY Wallet",
                          backgroundColor: c.primary,
                        ),
                      ],
                    )
                  ],
                )
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
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AppCard(
                    shadow: false,
                    backgroundColor: c.white,
                    child: Column(
                      children: [
                        Row(
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
                          ),
                      ],
                    )
                  );
                },
              ),
              UIHelper.verticalSpaceXXXL,
            ],
          ),
        ),
      )
    );
  }

  Widget imageCarouselSlider() {
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders = homeController.imgList.map((item) => Container(
            margin: const EdgeInsets.all(6.0),
            // padding: EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item)
                ],
              )
            ),)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              enlargeFactor: 0.3,
              aspectRatio: 2.0,
              height: 130,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: homeController.imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 6.0,
                height: 6.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : c.primary)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}