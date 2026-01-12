import 'package:flutter/material.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;

/**
 * Created by karthi_rt on 02-01-2026.
 */

enum AppButtonType { elevated, outlined, filled, text }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool enabled;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final String? fontFamily;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final AppButtonType type;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final double iconSize;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.enabled = true,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.fontFamily,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.type = AppButtonType.elevated, // default
    this.leadingIcon,
    this.trailingIcon,
    this.iconColor,
    this.iconPadding,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    final Color resolvedTextColor = textColor ?? (type == AppButtonType.outlined || type == AppButtonType.text ? c.primary : Colors.white);

    final Color resolvedIconColor = iconColor ?? resolvedTextColor;

    final textStyle = TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: textColor ?? Colors.white,
      fontFamily: fontFamily ?? 'Poppins',
    );

    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 6),);

    final ButtonStyle style;
    switch (type) {
      case AppButtonType.elevated:
        style = ElevatedButton.styleFrom(
          backgroundColor: enabled ? (backgroundColor ?? c.primary) : c.disabled,
          elevation: elevation ?? 2,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
          shape: shape,
        );
        break;

      case AppButtonType.outlined:
        style = OutlinedButton.styleFrom(
          foregroundColor: textColor ?? c.primary,
          side: BorderSide(color: backgroundColor ?? c.primary),
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
          shape: shape,
        );
        break;

      case AppButtonType.filled:
        style = FilledButton.styleFrom(
          backgroundColor: enabled ? (backgroundColor ?? c.primary) : c.disabled,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
          shape: shape,
        );
        break;

      case AppButtonType.text:
        style = TextButton.styleFrom(
          foregroundColor: textColor ?? c.primary,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
          shape: shape,
        );
        break;
    }

    Widget _buildIcon(IconData icon) {
      return Padding(
        padding: iconPadding ?? const EdgeInsets.symmetric(horizontal: 6),
        child: Icon(
          icon,
          size: iconSize,
          color: resolvedIconColor,
        ),
      );
    }

    final buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null) _buildIcon(leadingIcon!),
        Text(label, style: textStyle),
        if (trailingIcon != null) _buildIcon(trailingIcon!),
      ],
    );

    Widget button;
    switch (type) {
      case AppButtonType.elevated:
        button = ElevatedButton(
          style: style,
          onPressed: enabled ? onPressed : null,
          child: buttonChild,
        );
        break;
      case AppButtonType.outlined:
        button = OutlinedButton(
          style: style,
          onPressed: enabled ? onPressed : null,
          child: buttonChild,
        );
        break;
      case AppButtonType.filled:
        button = FilledButton(
          style: style,
          onPressed: enabled ? onPressed : null,
          child: buttonChild,
        );
        break;
      case AppButtonType.text:
        button = TextButton(
          style: style,
          onPressed: enabled ? onPressed : null,
          child: buttonChild,
        );
        break;
    }

    return Container(
      margin: margin,
      width: width,
      height: height,
      child: button,
    );
  }
}