import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/modules/dashboard_menu/views/bottom_navigation_screen.dart';
import 'package:ogpay/modules/dashboard_menu/views/navigation_drawer_screen.dart';
import 'package:ogpay/modules/navigation_drawer/referrals/views/referral_program_screen.dart';

import '../../../routes/app_routes.dart';

class DashboardMenu extends StatefulWidget {
  const DashboardMenu({super.key});

  @override
  State<DashboardMenu> createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ZoomDrawer(
          style: DrawerStyle.defaultStyle,
            menuScreen: NavigationDrawerScreen(
              onItemSelected: (id) {
                debugPrint("Tapped id $id");
                if(id == 0) {
                } else if (id == 1) {
                } else if (id == 2) {
                } else if (id == 3) {
                  Get.toNamed(AppRoutes.referralProgram);
                } else if (id == 4) {
                } else if (id == 5) {
                } else if (id == 6) {
                } else {
                  //TODO
                }
              }
            ),
            mainScreen: const BottomNavigationScreen(),
            borderRadius: 30,
            showShadow: true,
            angle: 0.0,
            slideWidth: MediaQuery.of(context).size.width * 0.65,
            menuBackgroundColor: c.primary,
        ),
      ),
    );
  }
}
