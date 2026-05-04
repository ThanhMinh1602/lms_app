// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lms_app/core/constants/app_dimens.dart';
// import 'package:lms_app/core/constants/app_gradients.dart';
// import 'package:lms_app/core/constants/app_text_styles.dart';
// import 'package:lms_app/core/extensions/context_extension.dart';
// import 'package:lms_app/core/extensions/l10n_extension.dart';
// import 'package:lms_app/core/widgets/button/custom_button.dart';
// import 'package:lms_app/core/widgets/card/custom_card.dart';
// import 'package:lms_app/core/widgets/text_field/custom_text_field.dart';
// import 'package:lms_app/features/auth/widgets/auth_layout.dart';
//
// class ForgotPasswordPage extends StatelessWidget {
//   const ForgotPasswordPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AuthLayout(
//       title: context.l10n.forgotPasswordTitle,
//       subtitle: context.l10n.forgotPasswordSubtitle,
//       headerIcon: Icons.mark_email_read_rounded,
//       bottomContent: _BackToLoginButton(context: context),
//       child: CustomCard(
//         padding: EdgeInsets.all(AppDimens.grid3),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               context.l10n.forgotPasswordInstruction,
//               textAlign: TextAlign.center,
//               style: AppTextStyles.textSmallRegular.copyWith(
//                 color: context.colors.onSurface.withOpacity(0.55),
//               ),
//             ),
//
//             SizedBox(height: AppDimens.grid3),
//
//             CustomTextField(
//               hintText: context.l10n.enterEmailHint,
//               prefixIcon: Icons.email_outlined,
//               keyboardType: TextInputType.emailAddress,
//             ),
//
//             SizedBox(height: AppDimens.grid4),
//
//             CustomButton(
//               text: context.l10n.sendResetCodeButton,
//               gradient: AppGradients.authButton,
//               enableHaptic: true,
//               onPressed: () => context.pop(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _BackToLoginButton extends StatelessWidget {
//   final BuildContext context;
//
//   const _BackToLoginButton({
//     required this.context,
//   });
//
//   @override
//   Widget build(BuildContext _) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () => context.pop(),
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: AppDimens.grid2,
//           vertical: AppDimens.grid1,
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Icons.arrow_back_rounded,
//               size: AppDimens.iconSmall,
//               color: context.colors.primary,
//             ),
//             SizedBox(width: AppDimens.grid0_5),
//             Text(
//               context.l10n.backToLogin,
//               style: AppTextStyles.textSmallSemi.copyWith(
//                 color: context.colors.primary,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }