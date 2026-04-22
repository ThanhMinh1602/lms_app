import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/widgets/button/custom_button.dart';
import 'package:lms_app/core/widgets/button/custom_icon_button.dart';
import 'package:lms_app/gen/assets.gen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: AppDimens.grid2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.0,
          children: [
            CustomButton(text: "Thanh Minh", onPressed: () {},enableHaptic: true,),
            CustomButton(text: "Thanh Minh", iconPath: Assets.icons.icCalendar, onPressed: () {}, enableHaptic: true,),
            CustomIconButton(iconPath: Assets.icons.icDarhboard, onPressed: (){}, enableHaptic: true,)
          ],
        ),
      ),
    );
  }
}
