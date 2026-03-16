



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:google_fonts/google_fonts.dart';
import '../styles/app_colors.dart';



class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? fontSize;
  final double? radius;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isActive;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.textColor,
    this.backgroundColor,
    this.fontSize,
    this.radius,
    this.isActive = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.brand700;
            }
            return backgroundColor ?? AppColors.brand700;
          }),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( radius ?? 4.r),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Center(
          child: Text( text,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: fontSize ?? 16.sp,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.roboto().fontFamily,
              color: textColor ?? Colors.white,
              letterSpacing: 0,
            ),

          ),
        ),
      ),
    );
  }
}
