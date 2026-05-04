import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';

class AppGradients {
  AppGradients._();

  static const Gradient sky = LinearGradient(
    colors: [
      AppColor.background,
      Color(0xFFE0F2FE),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient primary = LinearGradient(
    colors: [
      AppColor.primary,
      AppColor.primaryDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Auth
  static const Gradient authBackground = LinearGradient(
    colors: [
      Colors.white,
      AppColor.background,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient authButton = primary;

  static const Gradient authIcon = primary;
}