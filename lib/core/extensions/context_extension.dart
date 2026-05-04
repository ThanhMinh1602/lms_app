import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textStyles => Theme.of(this).textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);
  double get statusBarHeight => screenPadding.top;
  double get bottomBarHeight => screenPadding.bottom;

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  bool get isKeyboardShowing => viewInsets.bottom > 0;

  bool get isDarkMode => theme.brightness == Brightness.dark;
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
  bool get isTablet => screenWidth >= 600;

  void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}
