import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_shadows.dart';
import 'package:lms_app/core/extensions/context_extension.dart';
import 'package:lms_app/core/widgets/anim/bouncing_effect.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;
  final bool enableAnimation;
  final bool enableHaptic;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.onTap,
    this.enableAnimation = true,
    this.enableHaptic = false,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(AppDimens.grid3),
      decoration: BoxDecoration(
        color: color ?? context.colors.surface,
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppDimens.shapeExtraLarge),
        border: border,
        boxShadow: boxShadow ?? AppShadows.card,
      ),
      child: child,
    );

    if (onTap == null) return card;

    if (!enableAnimation) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: card,
      );
    }

    return BouncingEffect(
      onPressed: onTap,
      enableHaptic: enableHaptic,
      child: card,
    );
  }
}
