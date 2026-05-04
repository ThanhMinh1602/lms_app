import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';

class AppEmptyView extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String? message;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const AppEmptyView({
    super.key,
    this.icon,
    required this.title,
    this.message,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimens.screenMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ??
                Icon(
                  Icons.inbox_outlined,
                  size: AppDimens.iconExtraLarge,
                  color: context.colors.onSurface.withOpacity(0.35),
                ),
            SizedBox(height: AppDimens.grid2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textStyles.titleLarge,
            ),
            if (message != null) ...[
              SizedBox(height: AppDimens.grid1),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: context.textStyles.bodySmall,
              ),
            ],
            if (actionText != null && onActionPressed != null) ...[
              SizedBox(height: AppDimens.grid3),
              CustomButton(
                text: actionText!,
                onPressed: onActionPressed,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
