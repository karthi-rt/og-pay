import 'package:flutter/material.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: c.primary,
      scaffoldBackgroundColor: c.background,
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        labelMedium: AppTextStyles.labelMedium,
      ),
      colorScheme: const ColorScheme.light(
        primary: c.primary,
        secondary: c.secondary,
        background: c.background,
        surface: c.surface,
        error: c.error,
        onPrimary: Colors.white,
        onSecondary: c.textPrimary,
        onBackground: c.textPrimary,
        onSurface: c.textSecondary,
        onError: Colors.white,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: c.primary,
      scaffoldBackgroundColor: c.grey10,
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLargeDark,
        headlineMedium: AppTextStyles.headlineMediumDark,
        titleSmall: AppTextStyles.titleSmallDark,
        bodyLarge: AppTextStyles.bodyLargeDark,
        labelMedium: AppTextStyles.labelMediumDark,
      ),
      colorScheme: const ColorScheme.dark(
        primary: c.primary,
        secondary: c.secondary,
        background: c.grey10,
        surface: c.grey8,
        error: c.error,
        onPrimary: Colors.white,
        onSecondary: c.grey2,
        onBackground: c.grey2,
        onSurface: c.grey4,
        onError: Colors.white,
      ),
    );
  }
}
