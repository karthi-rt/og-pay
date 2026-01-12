import 'package:flutter/material.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;

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
    return const Scaffold(
      backgroundColor: c.white,
      body: Center(
        child: AppText("Chat Screen"),
      ),
    );
  }
}
