import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_font_weight.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle largeTitle = TextStyle(
    fontSize: 32.sp, // Font size dùng .sp
    fontWeight: AppFontWeight.semiBold,
    height: 42 / 32, // Line height là tỉ lệ nên giữ nguyên
    letterSpacing: 0,
  );

  static final TextStyle title1 = TextStyle(
    fontSize: 28.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 32 / 28,
    letterSpacing: 0,
  );

  static final TextStyle title2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 28 / 24,
    letterSpacing: 0,
  );

  static final TextStyle title3 = TextStyle(
    fontSize: 20.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 24 / 20,
    letterSpacing: 0,
  );

  static final TextStyle textLargeSemi = TextStyle(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 24 / 17,
    letterSpacing: 0,
  );

  static final TextStyle textLargeMedium = TextStyle(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.medium,
    height: 24 / 17,
    letterSpacing: 0,
  );

  static final TextStyle textLargeRegular = TextStyle(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.regular,
    height: 24 / 17,
    letterSpacing: 0,
  );

  static final TextStyle textSmallSemi = TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 25 / 15,
    letterSpacing: 0.2.w, // Letter spacing dùng .w
  );

  static final TextStyle textSmallMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.medium,
    height: 25 / 15,
    letterSpacing: 0.2.w,
  );

  static final TextStyle textSmallRegular = TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.regular,
    height: 25 / 15,
    letterSpacing: 0.2.w,
  );

  static final TextStyle textVerySmallSemi = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.semiBold,
    height: 22 / 13,
    letterSpacing: 0.2.w,
  );

  static final TextStyle textVerySmallMedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.medium,
    height: 22 / 13,
    letterSpacing: 0.2.w,
  );

  static final TextStyle textVerySmallRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeight.regular,
    height: 22 / 13,
    letterSpacing: 0.2.w,
  );
}