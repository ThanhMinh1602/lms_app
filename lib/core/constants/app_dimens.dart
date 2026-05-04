import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimens {
  AppDimens._();

  // Baseline grid
  static double get grid0_5 => 4.0.w;
  static double get grid1 => 8.0.w;
  static double get grid1_5 => 12.0.w;
  static double get grid2 => 16.0.w;
  static double get grid3 => 24.0.w;
  static double get grid4 => 32.0.w;
  static double get grid5 => 40.0.w;
  static double get grid6 => 48.0.w;

  // Layout
  static double get screenMargin => 16.0.w;
  static double get screenMarginTablet => 24.0.w;
  static double get sectionSpacing => 24.0.h;

  // Shape scale
  static double get shapeExtraSmall => 4.0.r;
  static double get shapeSmall => 8.0.r;
  static double get shapeMedium => 12.0.r;
  static double get shapeLarge => 16.0.r;
  static double get shapeExtraLarge => 28.0.r;
  static double get shapeFull => 999.0.r;

  // Icons
  static double get iconSmall => 20.0.w;
  static double get iconMedium => 24.0.w;
  static double get iconLarge => 32.0.w;
  static double get iconExtraLarge => 48.0.w;

  // Accessibility & components
  static double get minTouchTarget => 48.0.w;
  static double get buttonHeight => 48.0.h;
  static double get inputHeight => 56.0.h;

  static double get fabSize => 56.0.w;
  static double get fabSizeLarge => 96.0.w;

  // Navigation
  static double get topAppBarHeight => 64.0.h;
  static double get bottomNavHeight => 80.0.h;

  // LMS specific
  static double get flashcardMinHeight => 240.0.h;
  static const double cardElevation = 1.0;
  static const double dividerThickness = 1.0;
}
