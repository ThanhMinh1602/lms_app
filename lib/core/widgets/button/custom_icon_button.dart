import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_curves.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_durations.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/widgets/anim/bouncing_effect.dart';
import 'package:lms_app/core/widgets/image/custom_image.dart';

enum IconButtonVariant { primary, outlined, ghost }

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onPressed;
  final IconButtonVariant variant;
  final bool isLoading;
  final double? buttonSize;
  final double? iconSize;
  final bool enableAnimation;
  final bool enableHaptic;
  final String? semanticsLabel;

  const CustomIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
    this.variant = IconButtonVariant.ghost,
    this.isLoading = false,
    this.buttonSize,
    this.iconSize,
    this.enableAnimation = true,
    this.enableHaptic = false,
    this.semanticsLabel,
  });

  bool get isDisabled => isLoading || onPressed == null;

  Color _iconColor(BuildContext context) {
    if (isLoading && variant == IconButtonVariant.primary)
      return context.colors.onPrimary;
    if (isDisabled) return context.colors.onSurface.withOpacity(0.38);
    if (variant == IconButtonVariant.primary) return context.colors.onPrimary;
    return context.colors.onSurface;
  }

  Color _backgroundColor(BuildContext context) {
    if (variant != IconButtonVariant.primary) return Colors.transparent;
    if (isDisabled && !isLoading)
      return context.colors.onSurface.withOpacity(0.12);
    return context.colors.primary;
  }

  Border? _border(BuildContext context) {
    if (variant != IconButtonVariant.outlined) return null;
    return Border.all(color: context.colors.outline, width: 1.5);
  }

  @override
  Widget build(BuildContext context) {
    final resolvedIconSize = iconSize ?? AppDimens.iconMedium;
    final resolvedButtonSize = buttonSize ?? AppDimens.minTouchTarget;
    final iconColor = _iconColor(context);

    final childContent = AnimatedSwitcher(
      duration: AppDurations.normal,
      switchInCurve: AppCurves.defaultCurve,
      switchOutCurve: AppCurves.defaultCurve,
      child: isLoading
          ? SizedBox(
              key: const ValueKey('loading'),
              height: resolvedIconSize * 0.8,
              width: resolvedIconSize * 0.8,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: iconColor,
              ),
            )
          : CustomImage(
              key: const ValueKey('icon'),
              imagePath: iconPath,
              width: resolvedIconSize,
              height: resolvedIconSize,
              color: iconColor,
            ),
    );

    final buttonUI = AnimatedContainer(
      duration: enableAnimation ? AppDurations.normal : Duration.zero,
      curve: AppCurves.defaultCurve,
      width: resolvedButtonSize,
      height: resolvedButtonSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _backgroundColor(context),
        border: _border(context),
        shape: BoxShape.circle,
      ),
      child: childContent,
    );

    final semanticButton = Semantics(
      button: true,
      enabled: !isDisabled,
      label: semanticsLabel,
      child: buttonUI,
    );

    if (isDisabled) return semanticButton;

    if (!enableAnimation) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: semanticButton,
      );
    }

    return BouncingEffect(
      onPressed: onPressed,
      enableHaptic: enableHaptic,
      scaleFactor: 0.9,
      child: semanticButton,
    );
  }
}
