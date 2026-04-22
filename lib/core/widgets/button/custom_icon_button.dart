import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_app/core/widgets/anim/bouncing_effect.dart';
import 'package:lms_app/core/widgets/image/custom_image.dart';

enum IconButtonVariant { primary, outlined, ghost }

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onPressed;
  final IconButtonVariant variant;
  final bool isLoading;
  final double buttonSize;
  final double iconSize;
  final bool enableAnimation;
  final bool enableHaptic;

  const CustomIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
    this.variant = IconButtonVariant.ghost,
    this.isLoading = false,
    this.buttonSize = 48.0,
    this.iconSize = 24.0,
    this.enableAnimation = true,
    this.enableHaptic = false,
  });

  bool get isDisabled => isLoading || onPressed == null;

  Color _getIconColor() {
    if (isDisabled) return Colors.grey.shade400;
    if (variant == IconButtonVariant.primary) return Colors.white;
    return const Color(0xFF0F172A);
  }

  Color _getBackgroundColor() {
    if (variant == IconButtonVariant.primary) {
      return isDisabled && !isLoading
          ? Colors.grey.shade200
          : const Color(0xFF0EA5E9);
    }
    return Colors.transparent;
  }

  Border? _getBorder() {
    if (variant == IconButtonVariant.outlined) {
      return Border.all(
        color: isDisabled && !isLoading
            ? Colors.grey.shade300
            : Colors.grey.shade300,
        width: 1.5,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = _getIconColor();

    final Widget childContent = isLoading
        ? SizedBox(
      height: iconSize * 0.8,
      width: iconSize * 0.8,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: iconColor,
      ),
    )
        : CustomImage(
      imagePath: iconPath,
      width: iconSize,
      height: iconSize,
      color: iconColor,
    );

    final Widget buttonUI = AnimatedContainer(
      duration: enableAnimation
          ? const Duration(milliseconds: 200)
          : Duration.zero,
      curve: Curves.easeInOut,
      width: buttonSize,
      height: buttonSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        border: _getBorder(),
        shape: BoxShape.circle,
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
      enableHaptic: enableHaptic, // Giao quyền rung cho BouncingEffect
      scaleFactor: 0.90,
      child: buttonUI,
    );
  }
}