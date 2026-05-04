import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';

class AuthBottomBar extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String promptText;
  final String linkText;
  final VoidCallback onLinkPressed;
  final bool isLoading;

  const AuthBottomBar({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
    required this.promptText,
    required this.linkText,
    required this.onLinkPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.grid3,
        vertical: AppDimens.grid1_5,
      ).copyWith(bottom: context.screenPadding.bottom + AppDimens.grid1),
      child: Column(
        spacing: AppDimens.grid1,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            text: buttonText,
            onPressed: isLoading ? () {} : onButtonPressed,
          ),
          RichText(
            text: TextSpan(
              text: promptText,
              style: context.textStyles.bodyMedium?.copyWith(
                color: context.appColors.textTertiary,
              ),
              children: [
                TextSpan(
                  text: linkText,
                  style: context.textStyles.bodyMedium?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onLinkPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
