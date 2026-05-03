import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/base/base_view.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/extensions/l10n_extension.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';
import 'package:lms_app/core/widgets/card/custom_card.dart';
import 'package:lms_app/core/widgets/text_field/custom_text_field.dart';
import 'package:lms_app/features/auth/widgets/auth_layout.dart';
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: context.l10n.forgotPasswordTitle,
      subtitle: context.l10n.forgotPasswordSubtitle,
      bottomContent: GestureDetector(
        onTap: () => context.pop(),
        child: Text(context.l10n.backToLogin,
            style: AppTextStyles.textSmallSemi.copyWith(color: context.colors.primary)),
      ),
      child: CustomCard(
        child: Column(
          children: [
            CustomTextField(hintText: context.l10n.enterEmailHint, prefixIcon: Icons.email_outlined),
            SizedBox(height: AppDimens.grid4),
            CustomButton(
              text: context.l10n.sendResetCodeButton,
              enableHaptic: true,
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}