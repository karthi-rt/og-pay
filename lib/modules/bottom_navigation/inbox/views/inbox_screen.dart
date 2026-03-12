import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/resources/app_icons.dart' as ic;
import 'package:ogpay/core/resources/app_images.dart' as img;
import 'package:ogpay/core/utils/ui_helper.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_text.dart';

/**
 * Created by karthi_rt on 09-01-2026.
 */

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {

  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5","Item 6", "Item 7", "Item 8", "Item 9", "Item 10"];

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: c.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: statusBarHeight + 8),
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
                const AppText("Inbox", fontSize: 18, fontWeight: FontWeight.w600, color: c.primary, textAlign: TextAlign.center,),
                const Icon(Icons.add),
              ],
            ),
            UIHelper.verticalSpaceXXL,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(color: c.grey1, borderRadius: BorderRadius.circular(36),),
              child: const Row(
                children: [
                  Icon(Icons.search_rounded, color: c.textPrimary, size: 18,),
                  UIHelper.horizontalSpaceS,
                  AppText("Search", fontSize: 14,)
                ],
              ),
            ),
            UIHelper.verticalSpaceXXL,
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(items[index]),
                    // Right swipe (Read)
                    background: Container(
                      color: c.primary,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Icon(Icons.mark_email_read_outlined, color: c.white,),
                    ),
                    // Left swipe (Delete)
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
                    ),
                    onDismissed: (direction) {

                      if (direction == DismissDirection.startToEnd) {
                        // Right swipe
                        print("Marked as Read: ${items[index]}");
                      } else if (direction == DismissDirection.endToStart) {
                        // Left swipe
                        print("Deleted: ${items[index]}");
                        items.removeAt(index);
                      }
                    },
                    /*confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        print("Read");
                        return false; // don't dismiss
                      }
                      return true; // allow delete
                    },*/
                    child: AppCard(
                      shadow: false,
                      backgroundColor: c.white,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 18.0,
                                backgroundImage: AssetImage(img.profile),
                                backgroundColor: Colors.transparent,
                              ),
                              UIHelper.horizontalSpaceXS,
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText("Mike Lyne", fontSize: 14, fontWeight: FontWeight.w500,),
                                    AppText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", fontSize: 12, overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  const AppText("10:50 PM", fontSize: 12, color: c.primary, fontWeight: FontWeight.w600,),
                                  Container(
                                    height: 16.0,
                                    width: 16.0,
                                    padding: const EdgeInsets.all(2.0),
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: c.primary,),
                                    child: const Center(child: AppText("2", color: c.white, fontSize: 10,),),
                                  )
                                ],
                              ),
                            ],
                          ),
                          UIHelper.verticalSpaceM,
                          const Divider(color: c.grey2, thickness: 0.5,)
                        ],
                      )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}