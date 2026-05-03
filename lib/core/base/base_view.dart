import 'package:flutter/material.dart';
import 'package:lms_app/core/extensions/context_extension.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool isLoading;

  // --- Thêm thuộc tính Gradient ---
  final Gradient? backgroundGradient;
  final Color? backgroundColor;

  final bool safeAreaTop;
  final bool safeAreaBottom;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const BaseView({
    super.key,
    required this.body,
    this.appBar,
    this.isLoading = false,
    this.backgroundGradient, // Truyền gradient vào đây
    this.backgroundColor,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Xử lý logic màu nền:
    // Nếu có Gradient -> Ép Scaffold thành trong suốt
    // Nếu không -> Lấy màu được truyền vào, hoặc màu mặc định của Theme
    final Color scaffoldBgColor = backgroundGradient != null
        ? Colors.transparent
        : (backgroundColor ?? context.colors.surface);

    // 2. Khung Scaffold chính
    Widget scaffold = Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          SafeArea(
            top: safeAreaTop,
            bottom: safeAreaBottom,
            child: body,
          ),

          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                color: context.colors.primary,
              ),
            ),
        ],
      ),
    );

    // 3. Nếu có Gradient thì bọc Scaffold bằng Container vẽ màu
    Widget content = backgroundGradient != null
        ? Container(
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: scaffold,
    )
        : scaffold;

    return GestureDetector(
      onTap: context.hideKeyboard,
      child: content,
    );
  }
}