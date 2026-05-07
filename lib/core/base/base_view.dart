import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Bắt buộc phải có để dùng SystemUiOverlayStyle
import 'package:lms_app/core/extensions/context_extension.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool isLoading;

  final Gradient? backgroundGradient;
  final Color? backgroundColor;

  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final bool safeAreaRight;

  final bool hideKeyboardOnTap;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool? resizeToAvoidBottomInset;

  final EdgeInsetsGeometry? padding;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final Color? loadingBarrierColor;
  final String? loadingSemanticsLabel;

  // --- THÊM 2 THUỘC TÍNH NÀY ---
  final bool transparentSystemUI;
  final SystemUiOverlayStyle? customOverlayStyle;

  const BaseView({
    super.key,
    required this.body,
    this.appBar,
    this.isLoading = false,
    this.backgroundGradient,
    this.backgroundColor,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.hideKeyboardOnTap = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.padding,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.loadingBarrierColor,
    this.loadingSemanticsLabel,
    this.transparentSystemUI = false, // Mặc định là false để an toàn cho các màn hình cũ
    this.customOverlayStyle,
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldBgColor = backgroundGradient != null
        ? Colors.transparent
        : (backgroundColor ?? context.colors.surface);

    final bodyContent = SafeArea(
      top: safeAreaTop,
      bottom: safeAreaBottom,
      left: safeAreaLeft,
      right: safeAreaRight,
      child: padding == null ? body : Padding(padding: padding!, child: body),
    );

    final scaffold = Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: appBar,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Stack(
        fit: StackFit.expand,
        children: [
          bodyContent,
          if (isLoading) ...[
            ModalBarrier(
              dismissible: false,
              color: loadingBarrierColor ?? Colors.black.withOpacity(0.3),
            ),
            Center(
              child: Semantics(
                label: loadingSemanticsLabel ?? 'Loading',
                liveRegion: true,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: context.colors.primary,
                ),
              ),
            ),
          ],
        ],
      ),
    );

    final content = backgroundGradient != null
        ? DecoratedBox(
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: scaffold,
    )
        : scaffold;

    Widget finalWidget = hideKeyboardOnTap
        ? GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: content,
    )
        : content;

    // --- LOGIC LÀM TRONG SUỐT STATUS BAR & NAVIGATION BAR ---
    if (transparentSystemUI || customOverlayStyle != null) {
      final overlayStyle = customOverlayStyle ??
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            // Tự động đổi màu icon (Pin, Giờ, Wifi) ngược lại với nền để luôn nhìn thấy
            statusBarIconBrightness: context.isDarkMode ? Brightness.light : Brightness.dark,
            systemNavigationBarIconBrightness: context.isDarkMode ? Brightness.light : Brightness.dark,
            // Thêm dành riêng cho iOS
            statusBarBrightness: context.isDarkMode ? Brightness.dark : Brightness.light,
          );

      finalWidget = AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: finalWidget,
      );
    }

    return finalWidget;
  }
}