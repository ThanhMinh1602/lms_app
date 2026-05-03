import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/extensions/l10n_extension.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';
import 'package:lms_app/core/widgets/card/custom_card.dart';
import 'package:lms_app/core/widgets/text_field/custom_text_field.dart';
import 'package:lms_app/features/auth/widgets/auth_layout.dart';
import 'package:lms_app/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: context.l10n.loginTitle,
      subtitle: context.l10n.loginSubtitle,
      bottomContent: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.l10n.dontHaveAccount,
              style: AppTextStyles.textSmallRegular.copyWith(color: Colors.grey.shade600)),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.register.name),
            child: Text(context.l10n.registerNow,
                style: AppTextStyles.textSmallSemi.copyWith(color: context.colors.primary)),
          ),
        ],
      ),
      child: CustomCard(
        child: Column(
          children: [
            CustomTextField(
              hintText: context.l10n.emailHint,
              prefixIcon: Icons.email_outlined,
            ),
            SizedBox(height: AppDimens.grid2),
            CustomTextField(
              hintText: context.l10n.passwordHint,
              prefixIcon: Icons.lock_outline,
              isPassword: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.pushNamed(AppRoutes.forgotPassword.name),
                child: Text(context.l10n.forgotPassword,
                    style: AppTextStyles.textSmallMedium.copyWith(color: context.colors.primary)),
              ),
            ),
            SizedBox(height: AppDimens.grid2),
            CustomButton(
              text: context.l10n.loginButton,
              enableHaptic: true,
              onPressed: () => context.goNamed(AppRoutes.home.name),
            ),
          ],
        ),
      ),
    );
  }
}