import 'package:flutter/material.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import '../../../../core/widgets/app_text.dart';

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
    return const Scaffold(
      backgroundColor: c.white,
      body: Center(
        child: AppText("QR Screen"),
      ),
    );
  }
}