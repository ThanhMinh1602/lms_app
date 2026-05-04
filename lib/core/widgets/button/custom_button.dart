import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/widgets/anim/bouncing_effect.dart';
import 'package:lms_app/core/widgets/image/custom_image.dart';

enum ButtonVariant { primary, outlined, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonVariant variant;
  final String? iconPath;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final bool enableAnimation;
  final bool enableHaptic;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.variant = ButtonVariant.primary,
    this.iconPath,
    this.width,
    this.height,
    this.gradient,
    this.enableAnimation = true,
    this.enableHaptic = false,
  });

  bool get isDisabled => isLoading || onPressed == null;

  Color _getContentColor(BuildContext context) {
    if (isDisabled && !isLoading) {
      return context.colors.onSurface.withOpacity(0.35);
    }

    if (variant == ButtonVariant.primary) {
      return Colors.white;
    }

    return context.colors.primary;
  }

  Color _getBackgroundColor(BuildContext context) {
    if (variant == ButtonVariant.primary) {
      if (isDisabled && !isLoading) {
        return context.colors.onSurface.withOpacity(0.08);
      }

      if (gradient != null) {
        return Colors.transparent;
      }

      return context.colors.primary;
    }

    return Colors.transparent;
  }

  Gradient? _getGradient() {
    if (variant != ButtonVariant.primary) return null;
    if (isDisabled && !isLoading) return null;
    return gradient;
  }

  Border? _getBorder(BuildContext context) {
    if (variant == ButtonVariant.outlined) {
      return Border.all(
        color: isDisabled && !isLoading
            ? context.colors.onSurface.withOpacity(0.12)
            : context.colors.primary,
        width: 1.5,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final contentColor = _getContentColor(context);

    final Widget childContent = AnimatedSwitcher(
      duration: const Duration(milliseconds: 180),
      child: isLoading
          ? SizedBox(
        key: const ValueKey('loading'),
        height: AppDimens.iconMedium,
        width: AppDimens.iconMedium,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: contentColor,
        ),
      )
          : Row(
        key: const ValueKey('content'),
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null) ...[
            CustomImage(
              imagePath: iconPath!,
              width: AppDimens.iconMedium,
              height: AppDimens.iconMedium,
              color: contentColor,
            ),
            SizedBox(width: AppDimens.grid1),
          ],
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textLargeSemi.copyWith(
                color: contentColor,
              ),
            ),
          ),
        ],
      ),
    );

    final Widget buttonUI = AnimatedContainer(
      duration: enableAnimation
          ? const Duration(milliseconds: 200)
          : Duration.zero,
      curve: Curves.easeInOut,
      width: width ?? double.infinity,
      height: height ?? AppDimens.buttonHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        gradient: _getGradient(),
        border: _getBorder(context),
        borderRadius: BorderRadius.circular(AppDimens.shapeMedium),
        boxShadow: gradient != null && !isDisabled
            ? [
          BoxShadow(
            color: context.colors.primary.withOpacity(0.28),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ]
            : null,
      ),
      child: childContent,
    );

    if (isDisabled) return buttonUI;

    if (!enableAnimation) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (enableHaptic) HapticFeedback.lightImpact();
          onPressed!();
        },
        child: buttonUI,
      );
    }

    return BouncingEffect(
      onPressed: onPressed,
      enableHaptic: enableHaptic,
      child: buttonUI,
    );
  }
}