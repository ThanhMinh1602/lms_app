import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/extensions/context_extension.dart'; // Sử dụng extension mới của bạn

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
    // Tận dụng tối đa context extension để lấy màu và kiểu chữ
    final borderRadius = BorderRadius.circular(12.r);

    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      style: context.textStyles.bodyLarge, // Dùng từ context extension
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: context.textStyles.bodyLarge?.copyWith(
          color: context.appColors.textTertiary, // Dùng màu từ ThemeExtension
        ),
        filled: true,
        // Logic đổi màu nền khi focus cực sạch
        fillColor: _isFocused ? context.colors.surface : context.appColors.surfaceSoft,

        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),

        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(
          widget.prefixIcon,
          color: _isFocused ? context.colors.primary : context.appColors.textTertiary,
        ),

        suffixIcon: _buildSuffixIcon(context),

        // Hệ thống Border tự động ăn theo Theme
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: context.appColors.border,
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: context.colors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: context.colors.error, width: 1.5),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: context.appColors.textTertiary,
        ),
        onPressed: widget.enabled ? () => setState(() => _obscureText = !_obscureText) : null,
      );
    }
    return widget.suffixIcon;
  }
}