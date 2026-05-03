import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimens {
  AppDimens._();

  // --- Hệ thống lưới chuẩn Material (Baseline Grid) ---
  // Padding/Margin nên dùng .w (hoặc .h tuỳ ngữ cảnh, nhưng thường dùng .w cho đồng bộ tỉ lệ chéo)
  static final double grid0_5 = 4.0.w;
  static final double grid1 = 8.0.w;
  static final double grid1_5 = 12.0.w;
  static final double grid2 = 16.0.w;
  static final double grid3 = 24.0.w;
  static final double grid4 = 32.0.w;
  static final double grid5 = 40.0.w;
  static final double grid6 = 48.0.w;

  // --- Bố cục màn hình (Layout) ---
  static final double screenMargin = 16.0.w;
  static final double screenMarginTablet = 24.0.w;

  // --- Material 3 Shape Scale (Hệ thống bo góc) ---
  // Bo góc bắt buộc dùng .r
  static final double shapeExtraSmall = 4.0.r;
  static final double shapeSmall = 8.0.r;
  static final double shapeMedium = 12.0.r;
  static final double shapeLarge = 16.0.r;
  static final double shapeExtraLarge = 28.0.r;
  static final double shapeFull = 999.0.r;

  // --- Material Icon Sizes ---
  // Icon size nên dùng .w để vuông vức
  static final double iconSmall = 20.0.w;
  static final double iconMedium = 24.0.w;
  static final double iconLarge = 32.0.w;
  static final double iconExtraLarge = 48.0.w;

  // --- Trải nghiệm người dùng (Accessibility & Component Heights) ---
  static final double minTouchTarget = 48.0.w;
  static final double buttonHeight = 40.0.h; // Chiều cao dùng .h

  static final double fabSize = 56.0.w;
  static final double fabSizeLarge = 96.0.w;

  // --- Thanh điều hướng (Navigation) chuẩn M3 ---
  static final double topAppBarHeight = 64.0.h; // Chiều cao dùng .h
  static final double bottomNavHeight = 80.0.h; // Chiều cao dùng .h

  // --- Thông số cho App Học Tập của bạn ---
  static final double flashcardMinHeight = 240.0.h; // Chiều cao dùng .h
  static const double cardElevation = 1.0; // Elevation thường là số tuyệt đối, không cần scale
}