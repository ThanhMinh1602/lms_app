import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/base/base_view.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/extensions/l10n_extension.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';
import 'package:lms_app/core/widgets/card/custom_card.dart';
import 'package:lms_app/core/widgets/text_field/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isAgree = false;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(context.l10n.signUp, style: AppTextStyles.title3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("Name"),
                  CustomTextField(hintText: "Your name", prefixIcon: Icons.person_outline),
                  SizedBox(height: 16.h),
                  _label("Email"),
                  CustomTextField(hintText: "study@email.com", prefixIcon: Icons.email_outlined),
                  SizedBox(height: 16.h),
                  _label("Password"),
                  CustomTextField(hintText: "Your password", prefixIcon: Icons.lock_outline, isPassword: true),
                  SizedBox(height: 16.h),
                  _label("Phone Number"),
                  CustomTextField(hintText: "0334 xxxx xxxx", prefixIcon: Icons.phone_outlined),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Checkbox(
                        value: _isAgree,
                        onChanged: (v) => setState(() => _isAgree = v ?? false),
                        activeColor: context.colors.primary,
                      ),
                      Expanded(child: Text(context.l10n.termsAndConditions, style: AppTextStyles.textVerySmallRegular)),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(text: "Sign Up", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Text(text, style: AppTextStyles.textSmallMedium),
  );
}