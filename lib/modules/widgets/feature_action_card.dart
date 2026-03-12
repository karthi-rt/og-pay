import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import '../../../../core/utils/ui_helper.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_text.dart';

/**
 * Created by karthi_rt on 12-01-2026.
 */

class FeatureActionCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const FeatureActionCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AppCard(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
          backgroundColor: backgroundColor,
          borderRadius: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath, width: 22, height: 22, color: c.white,),
              UIHelper.horizontalSpaceXS,
              Flexible(
                child: AppText(
                  title,
                  color: c.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
