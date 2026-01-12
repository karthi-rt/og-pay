import 'package:flutter/material.dart';

/**
 * Created by karthi_rt on 02-01-2026.
 */

class AppCard extends StatelessWidget {
  final Widget child;

  // Explicit style properties
  final Color? backgroundColor;
  final Gradient? gradient;
  final double? elevation;

  // Border radius
  final double? borderRadius; // uniform
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;

  final Color? borderColor;
  final double? borderWidth;
  final Clip? clipBehavior;
  final bool shadow;

  // Layout
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  // Action
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.gradient,
    this.elevation,
    this.borderRadius,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.borderColor,
    this.borderWidth,
    this.clipBehavior,
    this.shadow = true,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Decide effective border radius
    final effectiveBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(topLeftRadius ?? borderRadius ?? 0),
      topRight: Radius.circular(topRightRadius ?? borderRadius ?? 0),
      bottomLeft: Radius.circular(bottomLeftRadius ?? borderRadius ?? 0),
      bottomRight: Radius.circular(bottomRightRadius ?? borderRadius ?? 0),
    );

    final cardContent = Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? backgroundColor : null,
        borderRadius: effectiveBorderRadius,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(6),
        child: child,
      ),
    );

    final card = Card(
      elevation: shadow ? (elevation ?? 2) : 0,
      clipBehavior: clipBehavior ?? Clip.none,
      shape: RoundedRectangleBorder(
        borderRadius: effectiveBorderRadius,
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
      child: cardContent,
    );

    return Container(
      margin: margin,
      child: onTap != null ? InkWell(
        borderRadius: effectiveBorderRadius,
        onTap: onTap,
        child: card,
      )
          : card,
    );
  }
}