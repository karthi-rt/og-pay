import 'package:flutter/material.dart';

/**
 * Created by karthi_rt on 02-01-2026.
 */

class AppText extends StatelessWidget {
  final String data;

  // Explicit text style properties
  final double? fontSize;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;

  // Text widget properties
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  // Extra: margin, padding & background
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const AppText(
      this.data, {
        super.key,
        this.fontSize,
        this.fontWeight = FontWeight.w400, // default regular
        this.fontStyle,
        this.color,
        this.letterSpacing,
        this.wordSpacing,
        this.height,
        this.decoration,
        this.decorationColor,
        this.decorationStyle,
        this.decorationThickness,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.margin,
        this.padding,
        this.backgroundColor,
      });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      data,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color ?? Theme.of(context).colorScheme.onBackground,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
      ),
    );

    if (margin != null || padding != null || backgroundColor != null) {
      return Container(
        margin: margin,
        padding: padding,
        color: backgroundColor,
        child: textWidget,
      );
    }
    return textWidget;
  }
}