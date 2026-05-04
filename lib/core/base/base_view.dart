import 'package:flutter/material.dart';
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
    this.resizeToAvoidBottomInset,
    this.padding,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.loadingBarrierColor,
    this.loadingSemanticsLabel,
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

    if (!hideKeyboardOnTap) return content;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: content,
    );
  }
}
