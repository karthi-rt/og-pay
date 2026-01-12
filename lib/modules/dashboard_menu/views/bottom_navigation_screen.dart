import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ogpay/core/utils/ui_helper.dart';
import 'package:ogpay/modules/bottom_navigation/chat/views/chat_screen.dart';
import 'package:ogpay/modules/bottom_navigation/home/views/home_screen.dart';
import 'package:ogpay/modules/bottom_navigation/inbox/view/inbox_screen.dart';
import 'package:ogpay/modules/bottom_navigation/qr/view/qr_screen.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/resources/app_icons.dart' as ic;
import '../../../core/widgets/app_text.dart';
import '../../bottom_navigation/home/controller/home_controller.dart';

/**
 * Created by karthi_rt on 09-01-2026.
 */

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    GetBuilder<HomeController>(init: HomeController(), builder: (_) => const HomeScreen(), ),// index 0
    GetBuilder<HomeController>(init: HomeController(), builder: (_) => const InboxScreen(), ),// index 1
    GetBuilder<HomeController>(init: HomeController(), builder: (_) => const ChatScreen(), ),// index 2
    GetBuilder<HomeController>(init: HomeController(), builder: (_) => const QRScreen(), ),// index 3
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () { _onItemTapped(3);},
        backgroundColor: c.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code, size: 24), ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0, height: 66,
        color: c.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(ic.home, ic.home_fill, "Home", 0),
            _buildNavItem(ic.chat, ic.chat_fill, "Chat", 1, badgeCount: 2),
            _buildNavItem(ic.promotion, ic.promotion_fill, "Promotions", 2, badgeCount: 3),
            UIHelper.horizontalSpaceXXL, // space for QR FAB
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String selectedIconPath, String label, int index, {int? badgeCount}) {
    final isSelected = _selectedIndex == index;

    Widget icon = SvgPicture.asset( isSelected ? selectedIconPath : iconPath, width: 24, height: 24, );

    if(badgeCount != null && badgeCount > 0) {
      icon = Badge(
        // alignment: Alignment.topLeft,
        label: Text(badgeCount.toString(),
        style: const TextStyle(fontSize: 10),
      ),
      child: icon,
      );
    }

    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          AppText(label, color: isSelected ? c.primary : c.black, fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal, fontSize: 12,),
        ],
      ),
    );
  }
}