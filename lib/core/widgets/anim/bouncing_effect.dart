import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_app/core/constants/app_curves.dart';
import 'package:lms_app/core/constants/app_durations.dart';

class BouncingEffect extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double scaleFactor;
  final bool enableHaptic;
  final Duration duration;
  final Curve curve;

  const BouncingEffect({
    super.key,
    required this.child,
    this.onPressed,
    this.scaleFactor = 0.95,
    this.enableHaptic = false,
    this.duration = AppDurations.fast,
    this.curve = AppCurves.defaultCurve,
  });

  @override
  State<BouncingEffect> createState() => _BouncingEffectState();
}

class _BouncingEffectState extends State<BouncingEffect> {
  bool _isPressed = false;

  void _setPressed(bool value) {
    if (!mounted || _isPressed == value) return;
    setState(() => _isPressed = value);
  }

  void _handleTapUp(TapUpDetails details) {
    _setPressed(false);
    if (widget.enableHaptic) HapticFeedback.lightImpact();
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.onPressed == null ? null : (_) => _setPressed(true),
      onTapUp: widget.onPressed == null ? null : _handleTapUp,
      onTapCancel: widget.onPressed == null ? null : () => _setPressed(false),
      child: AnimatedScale(
        scale: _isPressed ? widget.scaleFactor : 1,
        duration: widget.duration,
        curve: widget.curve,
        child: widget.child,
      ),
    );
  }
}
