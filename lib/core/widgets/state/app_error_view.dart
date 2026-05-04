import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';

class AppErrorView extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String? message;
  final String? retryText;
  final VoidCallback? onRetry;

  const AppErrorView({
    super.key,
    this.icon,
    this.title = 'Đã có lỗi xảy ra',
    this.message,
    this.retryText,
    this.onRetry,
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
                  Icons.error_outline_rounded,
                  size: AppDimens.iconExtraLarge,
                  color: context.colors.error,
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
            if (onRetry != null) ...[
              SizedBox(height: AppDimens.grid3),
              CustomButton(
                text: retryText ?? 'Thử lại',
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
