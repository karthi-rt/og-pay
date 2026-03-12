import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/widgets/app_card.dart';


/**
 * Created by karthi_rt on 02-01-2026.
 */

class AppTextField extends StatefulWidget {
  final String name; // required for FormBuilder
  final String hint;
  final TextEditingController? controller;

  // Explicit text properties
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final String? fontFamily;

  // Field properties
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;

  // Decoration
  final Color? hintColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final Color? fillColor;

  // Layout
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? contentPaddingTap;

  // Validation
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? initialValue;

  const AppTextField({
    super.key,
    required this.name,
    this.controller,
    required this.hint,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.fontFamily,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.hintColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.fillColor,
    this.margin,
    this.padding,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.contentPaddingTap,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      backgroundColor: c.white,
      shadow: true, borderRadius: widget.borderRadius ?? 36,
      margin: widget.margin,
      padding: widget.padding,
      child: FormBuilderTextField(
        name: widget.name,
        initialValue: widget.initialValue,
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscure : false,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        maxLines: widget.maxLines,
        validator: widget.validator,
        onChanged: widget.onChanged,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.textColor,
          fontFamily: widget.fontFamily ?? 'Poppins',
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 16.0, top: widget.contentPaddingTap ?? 0, bottom: 0, right: 6.0),
          hintStyle: TextStyle(
            color: widget.hintColor ?? c.gray,
            fontSize: widget.fontSize ?? 14.0,
            fontFamily: widget.fontFamily ?? 'Poppins',
          ),
          // filled: true,
          // fillColor: widget.fillColor ?? c.inputBackground,

          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          //   borderSide: BorderSide(
          //     color: widget.borderColor ?? c.border,
          //     width: widget.borderWidth ?? 1,
          //   ),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          //   borderSide: BorderSide(
          //     color: widget.borderColor ?? c.border,
          //     width: widget.borderWidth ?? 1,
          //   ),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          //   borderSide: BorderSide(
          //     color: widget.borderColor ?? c.primary,
          //     width: widget.borderWidth ?? 1,
          //   ),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          //   borderSide: BorderSide(
          //     color: c.error,
          //     width: widget.borderWidth ?? 1,
          //   ),
          // ),

          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                )
              : null,

        ),
      ),
    );
  }
}