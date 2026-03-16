import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Color? hintTextColor;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final Color suffixIconColor;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool enabled;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double borderRadius;
  final bool isPasswordField;

  const CustomInputField({
    super.key,
    required this.controller,
    this.hintText,
    this.hintTextColor,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.suffixIconColor = Colors.grey,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius = 30,
    this.isPasswordField = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _isPasswordVisible = false;
  bool _isFocused = false;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    final bool hasError = _errorText != null && _errorText!.isNotEmpty;
    final double effectiveRadius = hasError ? 8.r : widget.borderRadius;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(effectiveRadius),
              border: Border.all(
                color: hasError
                    ? AppColors.alarm500
                    : _isFocused
                    ? (widget.focusedBorderColor ?? AppColors.brand700)
                    : (widget.borderColor ?? AppColors.luckyGrey300),
                width: hasError ? 0.5 : _isFocused ? 1.5 : 1.0,
              ),
              boxShadow: hasError
                  ? [
                BoxShadow(
                  color: AppColors.alarm500.withValues(alpha: 0.12),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ]
                  : _isFocused
                  ? [
                BoxShadow(
                  color: AppColors.brand700.withValues(alpha: 0.15),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ]
                  : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: TextFormField(
              controller: widget.controller,
              obscureText:
              widget.isPasswordField ? !_isPasswordVisible : widget.obscureText,
              keyboardType: widget.keyboardType,
              onChanged: (value) {
                if (_errorText != null) {
                  final result = widget.validator?.call(value);
                  setState(() => _errorText = result);
                }
                widget.onChanged?.call(value);
              },
              cursorColor: AppColors.brand700,
              validator: (value) {
                final result = widget.validator?.call(value);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) setState(() => _errorText = result);
                });
                return null;
              },
              maxLines: widget.obscureText ? 1 : widget.maxLines,
              enabled: widget.enabled,
              style: TextStyle(
                color: AppColors.luckyGrey900,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                labelText: widget.labelText,
                hintStyle: TextStyle(
                  color: widget.hintTextColor ?? AppColors.luckyGrey400,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                labelStyle: TextStyle(
                  color: _isFocused
                      ? (widget.focusedBorderColor ?? AppColors.brand700)
                      : AppColors.luckyGrey400,
                  fontSize: 14.sp,
                ),
                prefixIcon: widget.prefixIcon != null
                    ? Icon(
                  widget.prefixIcon,
                  color: _isFocused
                      ? AppColors.brand700
                      : AppColors.luckyGrey400,
                  size: 20.sp,
                )
                    : null,
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: _isFocused
                        ? AppColors.brand700
                        : AppColors.luckyGrey400,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
                    : (widget.suffixIcon != null
                    ? Icon(
                  widget.suffixIcon,
                  color: widget.suffixIconColor,
                  size: 20.sp,
                )
                    : null),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                errorStyle: const TextStyle(fontSize: 0, height: 0),
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: EdgeInsets.only(top: 6.h, left: 12.w),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 13.sp,
                  color: AppColors.alarm500,
                ),
                SizedBox(width: 4.w),
                Text(
                  _errorText!,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.alarm500,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}