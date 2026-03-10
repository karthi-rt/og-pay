import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/resources/app_icons.dart' as ic;
import 'package:ogpay/core/resources/app_images.dart' as img;
import 'package:ogpay/core/utils/ui_helper.dart';
import '../../../../core/widgets/app_text.dart';

/**
 * Created by karthi_rt on 09-01-2026.
 */

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;


    return Scaffold(
      backgroundColor: c.white,
      /*appBar: AppBar(
        backgroundColor: c.white,
        leading: Icon(Icons.menu),
        title: AppText("Inbox", color: c.primary,),
        centerTitle: true,
        actions: [
          Icon(Icons.add),
          UIHelper.horizontalSpaceL,
        ],
      ),*/
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: statusBarHeight + 6),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => ZoomDrawer.of(context)!.open(),
                      child: SvgPicture.asset(ic.menu, width: 24, height: 24,)
                  ),
                  AppText("Inbox", fontWeight: FontWeight.w500, color: c.primary, textAlign: TextAlign.center,),
                  Icon(Icons.add),
                ],
              ),
              UIHelper.verticalSpaceM,


            ],
          ),
        ),
      )
    );
  }
}
