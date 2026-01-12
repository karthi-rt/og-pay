import 'package:flutter/material.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;


class AppTextStyles {
  // ===== Light Theme =====
  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 48,
    color: c.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 24,
    color: c.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: c.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal, // Regular
    fontSize: 16,
    color: c.textSecondary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: c.textSecondary,
  );

  // ===== Dark Theme =====
  static const TextStyle displayLargeDark = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 48,
    color: c.grey2,
  );

  static const TextStyle headlineMediumDark = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: c.grey2,
  );

  static const TextStyle titleSmallDark = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: c.grey3,
  );

  static const TextStyle bodyLargeDark = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: c.grey4,
  );

  static const TextStyle labelMediumDark = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: c.grey5,
  );
}
