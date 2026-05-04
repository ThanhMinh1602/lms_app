import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/base/base_view.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/extensions/l10n_extension.dart';
import 'package:lms_app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:lms_app/core/widgets/bottom_bar/auth_bottom_bar.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';
import 'package:lms_app/core/widgets/text_field/labeled_text_field.dart';
import 'package:lms_app/features/auth/login/widgets/social_login_widget.dart';
import 'package:lms_app/routes/app_routes.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: ""), // Để trống title appBar để dùng header to bên dưới
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho header
                children: [
                  // --- Header Welcome ---
                  Text(
                    "Welcome Back! 👋",
                    style: AppTextStyles.title1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                    ),
                  ),
                  SizedBox(height: AppDimens.grid1),
                  Text(
                    "Sign in to continue your learning journey.",
                    style: context.textStyles.bodyMedium?.copyWith(
                      color: context.appColors.textTertiary,
                    ),
                  ),
                  SizedBox(height: AppDimens.grid5), // Khoảng cách lớn trước khi vào form

                  // --- Form Fields ---
                  Column(
                    spacing: AppDimens.grid2,
                    children: [
                      LabeledTextField(
                        hintText: "Enter your email",
                        label: 'Email',
                        prefixIcon: Icons.email_outlined,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: AppDimens.grid1,
                        children: [
                          LabeledTextField(
                            hintText: "Enter your password",
                            label: 'Password',
                            isPassword: true,
                            prefixIcon: Icons.lock_outline,
                          ),
                          InkWell(
                            onTap: () => context.pushNamed(AppRoutes.forgotPassword.name),
                            child: Text(
                              'Forgot your password?',
                              style: AppTextStyles.textSmallMedium.copyWith(
                                color: context.colors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: AppDimens.grid4),

                  // --- Divider "Or" ---
                  Row(
                    children: [
                      Expanded(child: Divider(color: context.appColors.border, thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppDimens.grid2),
                        child: Text(
                          context.l10n.or,
                          style: context.textStyles.bodySmall?.copyWith(
                            color: context.appColors.textTertiary,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: context.appColors.border, thickness: 1)),
                    ],
                  ),

                  SizedBox(height: AppDimens.grid4),

                  // --- Social Login ---
                  const SocialLoginWidget(),
                ],
              ),
            ),
          ),

          // --- Bottom Bar ---
          AuthBottomBar(
            buttonText: context.l10n.signIn,
            onButtonPressed: () => context.goNamed(AppRoutes.home.name),
            promptText: "Don't have an account? ",
            linkText: "Sign Up",
            onLinkPressed: () => context.pushNamed(AppRoutes.register.name),
          ),
        ],
      ),
    );
  }
}