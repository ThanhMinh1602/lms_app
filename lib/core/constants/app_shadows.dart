import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppShadows {
  AppShadows._();

  static List<BoxShadow> get card => [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 32.r,
      offset: Offset(0, 16.h),
    ),
  ];

  static List<BoxShadow> get soft => [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 20.r,
      offset: Offset(0, 8.h),
    ),
  ];
}
