import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../../core/widgets/app_text.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/resources/app_icons.dart' as ic;
import 'package:ogpay/core/resources/app_images.dart' as img;

/**
 * Created by karthi_rt on 10-03-2026.
 */

class AmountInfoWidget extends StatelessWidget {
  final String title;
  final String amount;

  const AmountInfoWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ic.rupee, width: 18, height: 18),
        UIHelper.horizontalSpaceXS,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title,
              color: c.primary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            AppText(
              "₹ $amount",
              color: c.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ],
        )
      ],
    );
  }
}