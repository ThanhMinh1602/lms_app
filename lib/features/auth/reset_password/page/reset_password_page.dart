import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/base/base_view.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/l10n_extension.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';
import 'package:lms_app/core/widgets/text_field/custom_text_field.dart';
import 'package:lms_app/routes/app_routes.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, leading: const BackButton(color: Colors.black), elevation: 0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.forgotPasswordTitle, style: AppTextStyles.largeTitle),
            SizedBox(height: 8.h),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.", style: AppTextStyles.textLargeRegular.copyWith(color: Colors.grey)),
            SizedBox(height: 32.h),
            Text("New Password", style: AppTextStyles.textSmallMedium),
            SizedBox(height: 8.h),
            const CustomTextField(hintText: "••••••", prefixIcon: Icons.lock_outline, isPassword: true),
            SizedBox(height: 16.h),
            Text("Confirm Password", style: AppTextStyles.textSmallMedium),
            SizedBox(height: 8.h),
            const CustomTextField(hintText: "••••••", prefixIcon: Icons.lock_reset_outlined, isPassword: true),
            SizedBox(height: 32.h),
            CustomButton(
              text: "Create Password",
              onPressed: () => context.goNamed(AppRoutes.login.name),
            ),
          ],
        ),
      ),
    );
  }
}