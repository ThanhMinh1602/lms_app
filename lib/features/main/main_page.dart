import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/base/base_view.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/widgets/button/custom_icon_button.dart';
import 'package:lms_app/gen/assets.gen.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage({super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: context.colors.surface,
          border: Border(
            top: BorderSide(
              color: context.appColors.border.withOpacity(0.5),
              width: 0.5,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: AppDimens.grid1_5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Truyền thêm context vào để xử lý đổi màu cục bộ
                _buildNavButton(context, index: 0, iconPath: Assets.icons.icDashboard),
                _buildNavButton(context, index: 1, iconPath: Assets.icons.icCalendar),
                _buildNavButton(context, index: 2, iconPath: Assets.icons.icMessage),
                _buildNavButton(context, index: 3, iconPath: Assets.icons.icProfile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Cập nhật hàm này: Thêm BuildContext và bọc Theme cục bộ
  Widget _buildNavButton(
      BuildContext context, {
        required int index,
        required String iconPath,
      }) {
    final isSelected = navigationShell.currentIndex == index;

    return Theme(
      data: context.theme.copyWith(
        colorScheme: context.colors.copyWith(
          onSurface: isSelected ? context.colors.primary : context.appColors.textTertiary,
        ),
      ),
      child: CustomIconButton(
        iconPath: iconPath,
        onPressed: () => _goBranch(index),
        variant: IconButtonVariant.ghost,
        buttonSize: 48.w,
        iconSize: 26.w,
        enableHaptic: true,
        enableAnimation: true,
      ),
    );
  }
}