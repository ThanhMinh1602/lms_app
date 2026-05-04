import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/extensions/context_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final double? elevation;
  final VoidCallback? onLeadingPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 0,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? context.colors.surface,
      elevation: elevation,
      scrolledUnderElevation: 0, // <--- Chặn hiệu ứng nổi lên khi cuộn
      surfaceTintColor: Colors.transparent, // <--- Chặn đổi màu theo Material 3
      centerTitle: centerTitle,
      leading: leading ?? (Navigator.canPop(context)
          ? IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        iconSize: AppDimens.iconSmall,
        onPressed: onLeadingPressed ?? () => Navigator.maybePop(context),
      )
          : null),
      title: titleWidget ?? (title != null
          ? Text(title!)
          : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDimens.topAppBarHeight);
}