import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms_app/core/constants/app_constants.dart';
import 'package:lms_app/gen/assets.gen.dart';
class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppDimens.grid2, // Tăng khoảng cách giữa các icon
      children: [
        _buildSocialButton(Assets.icons.icGoogle),
        _buildSocialButton(Assets.icons.icFacebook),
        _buildSocialButton(Assets.icons.icApple),
      ],
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return InkWell(
      onTap: () {}, // Thêm logic xử lý social login sau
      borderRadius: BorderRadius.circular(AppDimens.shapeFull),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE2E8F0)), // Viền xám nhạt
          color: Colors.white,
        ),
        child: SvgPicture.asset(
          assetPath,
          width: 32.w, // Tổng kích thước vòng tròn sẽ lớn hơn (~56.w)
          height: 32.w,
        ),
      ),
    );
  }
}