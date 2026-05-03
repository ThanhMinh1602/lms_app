import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/base/base_view.dart';

import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/extensions/l10n_extension.dart';
import 'package:lms_app/gen/assets.gen.dart';
import 'package:lms_app/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToMain();
  }

  Future<void> _navigateToMain() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    if (mounted) {
      context.goNamed(AppRoutes.login.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      safeAreaTop: false,
      safeAreaBottom: false,
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colors.primary,
              context.colors.primary.withOpacity(0.6),
              AppColor.secondary,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(28.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 24.r,
                      offset: Offset(0, 12.h),
                    ),
                  ],
                ),
                child: Assets.images.imgSplash.image(
                  width: 80.w,
                  height: 80.w,
                ),
              ),

              SizedBox(height: AppDimens.grid3),

              Text(
                context.l10n.appName,
                style: AppTextStyles.largeTitle.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 1.2.w,
                ),
              ),

              SizedBox(height: AppDimens.grid1),
              Text(
                context.l10n.splashSlogan,
                textAlign: TextAlign.center,
                style: AppTextStyles.textLargeRegular.copyWith(
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}