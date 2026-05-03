import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/base/base_view.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/gen/assets.gen.dart';

class AuthLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final Widget bottomContent;

  const AuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.bottomContent,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Nút Quay lại
          Align(
            alignment: Alignment.centerLeft,
            child: context.canPop()
                ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1E293B)),
              padding: EdgeInsets.all(AppDimens.grid3),
              onPressed: () => context.pop(),
            )
                : SizedBox(height: 80.h),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
              child: Column(
                children: [
                  // Logo
                  Assets.images.imgSplash.image(width: 64.w, height: 64.w),
                  SizedBox(height: 32.h),

                  // Header Section
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.largeTitle.copyWith(
                      color: const Color(0xFF1E293B),
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textLargeRegular.copyWith(
                      color: Colors.grey.shade500,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // Form Content (Bọc trong CustomCard)
                  child,
                ],
              ),
            ),
          ),

          // Bottom Action
          Padding(
            padding: EdgeInsets.only(bottom: 24.h, top: 16.h),
            child: bottomContent,
          ),
        ],
      ),
    );
  }
}