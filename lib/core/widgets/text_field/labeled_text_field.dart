import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_constants.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/widgets/text_field/custom_text_field.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool isRequired;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: context.textStyles.bodyLarge?.copyWith(
                fontWeight: AppFontWeight.regular,
              ),
            ),
            if (isRequired)
              Text(
                " *",
                style: context.textStyles.bodyLarge?.copyWith(
                  color: context.colors.error,
                ),
              ),
          ],
        ),
        SizedBox(height: AppDimens.grid1),
        CustomTextField(
          controller: controller,
          hintText: hintText,
          prefixIcon: prefixIcon,
          isPassword: isPassword,
          validator: validator,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}