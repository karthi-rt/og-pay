import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ogpay/core/resources/app_images.dart' as img;
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/resources/app_icons.dart' as ic;
import 'package:ogpay/core/utils/ui_helper.dart';
import 'package:ogpay/core/widgets/app_text.dart';

/**
 * Created by karthi_rt on 09-01-2026.
 */

class NavigationDrawerScreen extends StatefulWidget {
  final void Function(int) onItemSelected;
  const NavigationDrawerScreen({super.key, required this.onItemSelected});

  @override
  State<NavigationDrawerScreen> createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c.primary,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => ZoomDrawer.of(context)!.close(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0, right: 16),
                  child: SvgPicture.asset(ic.cancel, width: 14, height: 14, color: c.white,),
                ),
              ),
              Column(
                children: [
                  const CircleAvatar(radius: 28, backgroundImage: AssetImage(img.profile),),
                  UIHelper.verticalSpaceM,
                  const AppText("karthi_rt", color: c.white, fontWeight: FontWeight.w500,),
                  AppText("QOPAY ID: 4479-778-34", fontSize: 14, color: c.white.withOpacity(0.70),),
                  UIHelper.verticalSpaceXXXL,
                  _drawerItem(Icons.account_circle, "Account Details", () {widget.onItemSelected(0);} ),
                  _drawerItem(Icons.qr_code, "My QR Code", () => widget.onItemSelected(1)),
                  _drawerItem(Icons.history, "Transaction History", () => widget.onItemSelected(2)),
                  _drawerItem(Icons.card_giftcard, "Referral Program", () { ZoomDrawer.of(context)!.close(); widget.onItemSelected(3);} ),
                  _drawerItem(Icons.settings, "Settings", () => widget.onItemSelected(4)),
                  _drawerItem(Icons.help, "Help & Support", () => widget.onItemSelected(5)),
                  _drawerItem(Icons.logout, "Logout", () => widget.onItemSelected(6)),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText("- Privacy Policy", color: c.white, fontSize: 14,),
                  UIHelper.verticalSpaceS,
                  const AppText("- Terms & Conditions", color: c.white, fontSize: 14,),
                  UIHelper.verticalSpaceM,
                  AppText("Version 1.0", color: c.white.withOpacity(0.70), fontSize: 14,),
                  UIHelper.verticalSpaceM,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            UIHelper.horizontalSpaceS,
            AppText(label, color: c.white, fontSize: 14,),
          ],
        ),
      ),
    );
  }
}
