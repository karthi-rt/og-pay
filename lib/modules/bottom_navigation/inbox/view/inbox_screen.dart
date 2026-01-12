import 'package:flutter/material.dart';
import 'package:ogpay/core/widgets/app_text.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;

/**
 * Created by karthi_rt on 09-01-2026.
 */

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: c.white,
      body: Center(
        child: AppText("Inbox Screen"),
      ),
    );
  }
}



