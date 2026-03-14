

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const Color defaultColor = AppColors.defaultTextColor;

  // ------------------- Title / Large Heading -------------------
  static TextStyle titleBold28({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 28.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle titleSemiBold24({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle titleMedium24({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 24.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  // ------------------- Subtitle / Medium Heading -------------------
  static TextStyle subtitleBold20({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle subtitleSemiBold18({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle subtitleMedium18({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle subtitleRegular16({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  // ------------------- Body Text / Paragraph -------------------
  static TextStyle bodyRegular16({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyMedium16({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyRegular14({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyMedium14({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyRegular12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle bodyMedium12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  // ------------------- Label -------------------
  static TextStyle labelBold16({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelSemiBold16({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelMedium16({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelRegular16({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelBold14({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelSemiBold14({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelMedium14({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelRegular14({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelBold12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelSemiBold12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelMedium12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelRegular12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelBold10({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 10.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelSemiBold10({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 10.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelMedium10({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelRegular10({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  // ------------------- Small / Caption -------------------
  static TextStyle captionRegular12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle captionLight12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 12.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle captionRegular10({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle captionLight10({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 10.sp,
    color: color ?? defaultColor,
    overflow: TextOverflow.ellipsis,
  );

  // ------------------- Link Text / Underline -------------------
  static TextStyle link12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: color ?? Colors.blue,
    decoration: TextDecoration.underline,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle link10({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.outfit().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
    color: color ?? Colors.blue,
    decoration: TextDecoration.underline,
    overflow: TextOverflow.ellipsis,
  );
}