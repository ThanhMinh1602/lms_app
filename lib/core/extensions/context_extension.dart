import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // ==========================================
  // 1. THEME & COLORS (Màu sắc & Phông chữ)
  // ==========================================

  /// Lấy toàn bộ ThemeData
  ThemeData get theme => Theme.of(this);

  /// Lấy ColorScheme (Quản lý mọi màu sắc chuẩn Material 3)
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Lấy TextTheme (Quản lý mọi kiểu chữ: tiêu đề, nội dung...)
  TextTheme get textStyles => Theme.of(this).textTheme;

  // ==========================================
  // 2. KÍCH THƯỚC MÀN HÌNH (Responsive)
  // ==========================================

  /// Lấy chiều rộng của màn hình thiết bị
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Lấy chiều cao của màn hình thiết bị
  double get screenHeight => MediaQuery.sizeOf(this).height;

  // ==========================================
  // 3. SAFE AREA (Vùng an toàn tránh tai thỏ)
  // ==========================================

  /// Lấy chiều cao của thanh trạng thái (Status Bar) ở trên cùng
  double get statusBarHeight => MediaQuery.paddingOf(this).top;

  /// Lấy chiều cao của thanh điều hướng (Navigation Bar) ở dưới đáy
  double get bottomBarHeight => MediaQuery.paddingOf(this).bottom;

  // ==========================================
  // 4. BÀN PHÍM (Keyboard)
  // ==========================================

  /// Ẩn bàn phím ngay lập tức
  void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  /// Kiểm tra xem bàn phím có đang bật lên không
  bool get isKeyboardShowing => MediaQuery.viewInsetsOf(this).bottom > 0;
}