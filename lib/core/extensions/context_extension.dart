import 'package:flutter/material.dart';
import 'package:lms_app/core/extensions/app_colors_extension.dart';

extension ContextExtension on BuildContext {
  // --- Theme & Colors ---
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme; // Thêm tên chuẩn của Flutter
  TextTheme get textStyles => theme.textTheme;

  /// Truy cập nhanh vào các màu tùy chỉnh từ ThemeExtension
  AppColorsExtension get appColors => theme.extension<AppColorsExtension>()!;

  // --- Screen Size & Responsive ---
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);
  double get statusBarHeight => screenPadding.top;
  double get bottomBarHeight => screenPadding.bottom;

  // --- Keyboard & Focus ---
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  bool get isKeyboardShowing => viewInsets.bottom > 0;
  void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  // --- Device & State Info ---
  bool get isDarkMode => theme.brightness == Brightness.dark;
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
  bool get isTablet => screenWidth >= 600;
}