// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lms_app/core/base/base_view.dart';
// import 'package:lms_app/core/constants/app_dimens.dart';
// import 'package:lms_app/core/constants/app_gradients.dart';
// import 'package:lms_app/core/constants/app_text_styles.dart';
// import 'package:lms_app/core/extensions/context_extension.dart';
// import 'package:lms_app/core/extensions/l10n_extension.dart';
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});
//
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   bool _acceptedTerms = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseView(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           _AuthTopBar(
//             title: context.l10n.signUpTitle,
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: context.screenHeight -
//                       context.statusBarHeight -
//                       AppDimens.grid6 -
//                       AppDimens.grid2,
//                 ),
//                 child: IntrinsicHeight(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       SizedBox(height: AppDimens.grid3),
//
//                       _AuthTextField(
//                         label: context.l10n.nameLabel,
//                         hintText: context.l10n.namePlaceholder,
//                         keyboardType: TextInputType.name,
//                       ),
//
//                       SizedBox(height: AppDimens.grid3),
//
//                       _AuthTextField(
//                         label: context.l10n.emailLabel,
//                         hintText: context.l10n.emailPlaceholder,
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//
//                       SizedBox(height: AppDimens.grid3),
//
//                       _AuthTextField(
//                         label: context.l10n.passwordLabel,
//                         hintText: context.l10n.passwordPlaceholder,
//                         obscureText: true,
//                       ),
//
//                       SizedBox(height: AppDimens.grid3),
//
//                       _AuthTextField(
//                         label: context.l10n.phoneNumberLabel,
//                         hintText: context.l10n.phoneNumberPlaceholder,
//                         keyboardType: TextInputType.phone,
//                       ),
//
//                       SizedBox(height: AppDimens.grid2),
//
//                       _TermsAgreement(
//                         value: _acceptedTerms,
//                         onChanged: (value) {
//                           setState(() => _acceptedTerms = value ?? false);
//                         },
//                       ),
//
//                       const Spacer(),
//
//                       SizedBox(height: AppDimens.grid4),
//
//                       _AuthPrimaryButton(
//                         text: context.l10n.registerButton,
//                         onPressed: _acceptedTerms
//                             ? () {
//                           // TODO: Xử lý đăng ký
//                         }
//                             : null,
//                       ),
//
//                       SizedBox(height: AppDimens.grid3),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _TermsAgreement extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool?> onChanged;
//
//   const _TermsAgreement({
//     required this.value,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: AppDimens.grid3,
//           height: AppDimens.grid3,
//           child: Checkbox(
//             value: value,
//             onChanged: onChanged,
//             activeColor: context.colors.primary,
//             checkColor: Colors.white,
//             side: BorderSide(
//               color: context.colors.primary,
//               width: 1.5,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(AppDimens.shapeExtraSmall),
//             ),
//           ),
//         ),
//         SizedBox(width: AppDimens.grid2),
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               style: AppTextStyles.textSmallRegular.copyWith(
//                 color: const Color(0xFF64748B),
//                 height: 1.45,
//               ),
//               children: [
//                 TextSpan(text: context.l10n.termsAgreePrefix),
//                 TextSpan(
//                   text: context.l10n.termsAndConditions,
//                   style: AppTextStyles.textSmallMedium.copyWith(
//                     color: context.colors.primary,
//                   ),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       // TODO: Mở điều khoản
//                     },
//                 ),
//                 TextSpan(text: context.l10n.termsAgreeSuffix),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }