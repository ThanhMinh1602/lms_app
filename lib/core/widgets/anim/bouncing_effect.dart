import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BouncingEffect extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double scaleFactor;

  final bool enableHaptic;

  const BouncingEffect({
    super.key,
    required this.child,
    this.onPressed,
    this.scaleFactor = 0.95,
    this.enableHaptic = false,
  });

  @override
  State<BouncingEffect> createState() => _BouncingEffectState();
}

class _BouncingEffectState extends State<BouncingEffect> {
  bool _isPressed = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        if (widget.onPressed != null) {
          if (widget.enableHaptic) {
            SystemChannels.platform.invokeMethod('HapticFeedback.vibrate');
          }
          widget.onPressed!();
        }
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? widget.scaleFactor : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
