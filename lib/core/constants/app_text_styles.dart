import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/core/constants/app_font_weight.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get largeTitle => TextStyle(
    fontSize: 32.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 42 / 32,
    letterSpacing: 0,
  );

  static TextStyle get title1 => TextStyle(
    fontSize: 28.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 32 / 28,
    letterSpacing: 0,
  );

  static TextStyle get title2 => TextStyle(
    fontSize: 24.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 28 / 24,
    letterSpacing: 0,
  );

  static TextStyle get title3 => TextStyle(
    fontSize: 20.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 24 / 20,
    letterSpacing: 0,
  );

  static TextStyle get textLargeSemi => TextStyle(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 24 / 17,
    letterSpacing: 0,
  );

  static TextStyle get textLargeMedium => TextStyle(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.medium,
    height: 24 / 17,
    letterSpacing: 0,
  );

  static TextStyle get textLargeRegular => TextStyle(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.regular,
    height: 24 / 17,
    letterSpacing: 0,
  );

  static TextStyle get textSmallSemi => TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 25 / 15,
    letterSpacing: 0.2.w,
  );

  static TextStyle get textSmallMedium => TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.medium,
    height: 25 / 15,
    letterSpacing: 0.2.w,
  );

  static TextStyle get textSmallRegular => TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.regular,
    height: 25 / 15,
    letterSpacing: 0.2.w,
  );

  static TextStyle get textVerySmallSemi => TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 22 / 13,
    letterSpacing: 0.2.w,
  );

  static TextStyle get textVerySmallMedium => TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.medium,
    height: 22 / 13,
    letterSpacing: 0.2.w,
  );

  static TextStyle get textVerySmallRegular => TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.regular,
    height: 22 / 13,
    letterSpacing: 0.2.w,
  );
}
