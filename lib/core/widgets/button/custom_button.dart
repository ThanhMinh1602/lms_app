import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.enableAnimation = true,
    this.enableHaptic = false,
  });

  bool get isDisabled => isLoading || onPressed == null;

  Color _getContentColor() {
    if (isDisabled) return Colors.grey.shade400;
    if (variant == ButtonVariant.primary) return Colors.white;
    return const Color(0xFF0EA5E9);
  }

  Color _getBackgroundColor() {
    if (variant == ButtonVariant.primary) {
      return isDisabled && !isLoading
          ? Colors.grey.shade200
          : const Color(0xFF0EA5E9);
    }
    return Colors.transparent;
  }

  Border? _getBorder() {
    if (variant == ButtonVariant.outlined) {
      return Border.all(
        color: isDisabled && !isLoading
            ? Colors.grey.shade300
            : const Color(0xFF0EA5E9),
        width: 1.5,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final contentColor = _getContentColor();

    final Widget childContent = isLoading
        ? SizedBox(
            height: 24.0,
            width: 24.0,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: contentColor,
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconPath != null) ...[
                CustomImage(
                  imagePath: iconPath!,
                  width: 24.0,
                  height: 24.0,
                  color: contentColor,
                ),
                const SizedBox(width: 8.0),
              ],
              Text(
                text,
                style: TextStyle(
                  color: contentColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );

    final Widget buttonUI = AnimatedContainer(
      duration: enableAnimation
          ? const Duration(milliseconds: 200)
          : Duration.zero,
      curve: Curves.easeInOut,
      width: width ?? double.infinity,
      height: 48.0,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        border: _getBorder(),
        borderRadius: BorderRadius.circular(999.0),
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
