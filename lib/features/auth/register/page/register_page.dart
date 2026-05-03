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
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: context.l10n.registerTitle,
      subtitle: context.l10n.registerSubtitle,
      bottomContent: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.l10n.alreadyHaveAccount,
              style: AppTextStyles.textSmallRegular.copyWith(color: Colors.grey.shade600)),
          GestureDetector(
            onTap: () => context.pop(),
            child: Text(context.l10n.loginNow,
                style: AppTextStyles.textSmallSemi.copyWith(color: context.colors.primary)),
          ),
        ],
      ),
      child: CustomCard(
        child: Column(
          children: [
            CustomTextField(hintText: context.l10n.fullNameHint, prefixIcon: Icons.person_outline),
            SizedBox(height: AppDimens.grid2),
            CustomTextField(hintText: context.l10n.emailHint, prefixIcon: Icons.email_outlined),
            SizedBox(height: AppDimens.grid2),
            CustomTextField(hintText: context.l10n.passwordHint, prefixIcon: Icons.lock_outline, isPassword: true),
            SizedBox(height: AppDimens.grid2),
            CustomTextField(hintText: context.l10n.confirmPasswordHint, prefixIcon: Icons.lock_reset_outlined, isPassword: true),
            SizedBox(height: AppDimens.grid4),
            CustomButton(
              text: context.l10n.registerButton,
              enableHaptic: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}