import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/context_extension.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  // Dùng FocusNode để lắng nghe xem người dùng có đang bấm vào ô này không
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Màu nền ô nhập: Lúc bình thường xám siêu nhạt, lúc bấm vào thì trắng tinh
    final fillColor = _isFocused ? Colors.white : const Color(0xFFF8FAFC);
    // Màu Icon: Lúc bình thường màu xám, bấm vào thì lên màu Primary (Xanh)
    final iconColor = _isFocused ? context.colors.primary : Colors.grey.shade400;

    return TextField(
      focusNode: _focusNode,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      style: AppTextStyles.textLargeRegular.copyWith(
        color: const Color(0xFF1E293B), // Màu chữ tối, sang trọng
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.textLargeRegular.copyWith(color: Colors.grey.shade400),
        filled: true,
        fillColor: fillColor,
        // Padding rộng rãi để ô text nhìn mập mạp, dễ bấm
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),

        // Icon bên trái có đổi màu
        prefixIcon: Icon(widget.prefixIcon, size: 24.w, color: iconColor),

        // Icon con mắt bên phải (cho mật khẩu)
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.grey.shade400,
            size: 24.w,
          ),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        )
            : null,

        // --- TÙY CHỈNH VIỀN (BORDER) ---

        // 1. Viền mặc định: Trong suốt (chỉ thấy màu nền)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),

        // 2. Viền khi bấm vào: Nổi màu Primary
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: context.colors.primary, width: 1.5),
        ),

        // 3. Viền khi có lỗi (nếu sau này bạn làm validate)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
      ),
    );
  }
}