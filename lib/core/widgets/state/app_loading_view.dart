import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/extensions/context_extension.dart';

class AppLoadingView extends StatelessWidget {
  final String? message;
  final double? indicatorSize;

  const AppLoadingView({super.key, this.message, this.indicatorSize});

  @override
  Widget build(BuildContext context) {
    final size = indicatorSize ?? AppDimens.iconLarge;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: context.colors.primary,
            ),
          ),
          if (message != null) ...[
            SizedBox(height: AppDimens.grid2),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}
