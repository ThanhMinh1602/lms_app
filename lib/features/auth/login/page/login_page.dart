// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lms_app/core/base/base_view.dart';
// import 'package:lms_app/core/constants/app_dimens.dart';
// import 'package:lms_app/core/constants/app_gradients.dart';
// import 'package:lms_app/core/constants/app_text_styles.dart';
// import 'package:lms_app/core/extensions/context_extension.dart';
// import 'package:lms_app/core/extensions/l10n_extension.dart';
// import 'package:lms_app/routes/app_routes.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseView(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           _AuthTopBar(
//             title: context.l10n.signInTitle,
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   SizedBox(height: AppDimens.grid3),
//
//                   _AuthTextField(
//                     label: context.l10n.emailLabel,
//                     hintText: context.l10n.emailPlaceholder,
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//
//                   SizedBox(height: AppDimens.grid3),
//
//                   _AuthTextField(
//                     label: context.l10n.passwordLabel,
//                     hintText: context.l10n.passwordPlaceholder,
//                     obscureText: true,
//                   ),
//
//                   SizedBox(height: AppDimens.grid1_5),
//
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: GestureDetector(
//                       behavior: HitTestBehavior.opaque,
//                       onTap: () => context.pushNamed(AppRoutes.forgotPassword.name),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: AppDimens.grid1),
//                         child: Text(
//                           context.l10n.forgotPassword,
//                           style: AppTextStyles.textSmallMedium.copyWith(
//                             color: context.colors.primary,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: AppDimens.grid2),
//
//                   _AuthPrimaryButton(
//                     text: context.l10n.loginButton,
//                     onPressed: () => context.goNamed(AppRoutes.home.name),
//                   ),
//
//                   SizedBox(height: AppDimens.grid3),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         context.l10n.dontHaveAccount,
//                         style: AppTextStyles.textSmallMedium.copyWith(
//                           color: context.colors.onSurface,
//                         ),
//                       ),
//                       GestureDetector(
//                         behavior: HitTestBehavior.opaque,
//                         onTap: () => context.pushNamed(AppRoutes.register.name),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: AppDimens.grid0_5,
//                             vertical: AppDimens.grid1,
//                           ),
//                           child: Text(
//                             context.l10n.registerNow,
//                             style: AppTextStyles.textSmallSemi.copyWith(
//                               color: context.colors.primary,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: AppDimens.grid3),
//
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: context.colors.outline.withOpacity(0.7),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: AppDimens.grid2),
//                         child: Text(
//                           context.l10n.orText.toUpperCase(),
//                           style: AppTextStyles.textSmallSemi.copyWith(
//                             color: context.colors.onSurface,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           color: context.colors.outline.withOpacity(0.7),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: AppDimens.grid3),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _SocialCircleButton(
//                         text: 'G',
//                         color: const Color(0xFF4285F4),
//                         onTap: () {},
//                       ),
//                       SizedBox(width: AppDimens.grid2),
//                       _SocialCircleButton(
//                         text: 'f',
//                         color: const Color(0xFF1877F2),
//                         onTap: () {},
//                       ),
//                       SizedBox(width: AppDimens.grid2),
//                       _SocialCircleButton(
//                         icon: Icons.apple_rounded,
//                         color: const Color(0xFF1F2937),
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }