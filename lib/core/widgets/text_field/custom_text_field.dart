import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/context_extension.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;

  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;

  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  final String? labelText;
  final String? helperText;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.autofillHints,
    this.labelText,
    this.helperText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? _internalFocusNode;
  bool _isFocused = false;
  late bool _obscureText;

  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode!;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _initFocusNode();
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode?.removeListener(_handleFocusChanged);
      _internalFocusNode?.removeListener(_handleFocusChanged);
      _internalFocusNode?.dispose();
      _initFocusNode();
    }

    if (!oldWidget.isPassword && widget.isPassword) {
      _obscureText = true;
    }
  }

  void _initFocusNode() {
    _internalFocusNode = widget.focusNode == null ? FocusNode() : null;
    _focusNode.addListener(_handleFocusChanged);
    _isFocused = _focusNode.hasFocus;
  }

  void _handleFocusChanged() {
    if (!mounted) return;
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChanged);
    _internalFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fillColor = _resolveFillColor(context);
    final iconColor = _resolveIconColor(context);

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.controller == null ? widget.initialValue : null,
      focusNode: _focusNode,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      autofillHints: widget.autofillHints,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      style: AppTextStyles.textLargeRegular.copyWith(
        color: context.colors.onSurface,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        hintStyle: AppTextStyles.textLargeRegular.copyWith(
          color: context.colors.onSurface.withOpacity(0.35),
        ),
        filled: true,
        fillColor: fillColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimens.grid2,
          vertical: AppDimens.grid2,
        ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(
                widget.prefixIcon,
                size: AppDimens.iconMedium,
                color: iconColor,
              ),
        prefix: widget.prefix,
        suffixIcon: _buildSuffixIcon(context),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeLarge),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeLarge),
          borderSide: BorderSide(color: context.colors.primary, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeLarge),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeLarge),
          borderSide: BorderSide(color: context.colors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeLarge),
          borderSide: BorderSide(color: context.colors.error, width: 1.5),
        ),
      ),
    );
  }

  Color _resolveFillColor(BuildContext context) {
    if (!widget.enabled) return context.colors.onSurface.withOpacity(0.06);
    if (_isFocused) return context.colors.surface;
    return context.colors.surfaceContainerHighest.withOpacity(
      context.isDarkMode ? 0.7 : 1,
    );
  }

  Color _resolveIconColor(BuildContext context) {
    if (!widget.enabled) return context.colors.onSurface.withOpacity(0.24);
    if (_isFocused) return context.colors.primary;
    return context.colors.onSurface.withOpacity(0.35);
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (widget.isPassword) {
      return IconButton(
        tooltip: _obscureText ? 'Show password' : 'Hide password',
        icon: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: context.colors.onSurface.withOpacity(0.35),
          size: AppDimens.iconMedium,
        ),
        onPressed: widget.enabled
            ? () => setState(() => _obscureText = !_obscureText)
            : null,
      );
    }

    return widget.suffixIcon;
  }
}
