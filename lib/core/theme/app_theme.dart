import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
import 'package:lms_app/core/extensions/app_colors_extension.dart';
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final colorScheme = const ColorScheme.light(
      primary: AppColor.primary,
      onPrimary: Colors.white,
      secondary: AppColor.secondary,
      onSecondary: Colors.white,
      surface: AppColor.surface,
      onSurface: AppColor.textPrimary,
      error: AppColor.error,
      onError: Colors.white,
      outline: AppColor.border,
      surfaceContainerHighest: AppColor.surfaceSoft,
    );

    return _buildTheme(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColor.background,
      cardColor: AppColor.surface,
      inputFillColor: AppColor.surfaceSoft, // Màu mặc định cho TextField
      textPrimaryColor: AppColor.textPrimary,
      textSecondaryColor: AppColor.textSecondary,
      borderColor: AppColor.border,
    ).copyWith(
      // QUAN TRỌNG: Đăng ký Extension ở đây để tránh lỗi Null check
      extensions: [
        const AppColorsExtension(
          surfaceSoft: AppColor.surfaceSoft,
          textTertiary: AppColor.textTertiary,
          border: AppColor.border,
        ),
      ],
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = const ColorScheme.dark(
      primary: AppColor.primary,
      onPrimary: Colors.white,
      secondary: AppColor.secondary,
      onSecondary: Colors.white,
      surface: AppColor.darkSurface,
      onSurface: AppColor.darkTextPrimary,
      error: AppColor.error,
      onError: Colors.white,
      outline: AppColor.darkBorder,
      surfaceContainerHighest: AppColor.darkSurfaceSoft,
    );

    return _buildTheme(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColor.darkBackground,
      cardColor: AppColor.darkSurface,
      inputFillColor: AppColor.darkSurfaceSoft,
      textPrimaryColor: AppColor.darkTextPrimary,
      textSecondaryColor: AppColor.darkTextSecondary,
      borderColor: AppColor.darkBorder,
    ).copyWith(
      // QUAN TRỌNG: Đăng ký Extension cho Dark Mode
      extensions: [
        const AppColorsExtension(
          surfaceSoft: AppColor.darkSurfaceSoft,
          textTertiary: AppColor.darkTextSecondary,
          border: AppColor.darkBorder,
        ),
      ],
    );
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color cardColor,
    required Color inputFillColor,
    required Color textPrimaryColor,
    required Color textSecondaryColor,
    required Color borderColor,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: colorScheme,
      dividerColor: borderColor,

      // Cấu hình TextTheme đồng bộ từ AppTextStyles của bạn
      textTheme: TextTheme(
        displayLarge: AppTextStyles.largeTitle.copyWith(color: textPrimaryColor),
        titleLarge: AppTextStyles.title3.copyWith(color: textPrimaryColor),
        bodyLarge: AppTextStyles.textLargeRegular.copyWith(color: textPrimaryColor),
        bodyMedium: AppTextStyles.textSmallRegular.copyWith(color: textPrimaryColor),
        bodySmall: AppTextStyles.textVerySmallRegular.copyWith(color: textSecondaryColor),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: textPrimaryColor,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTextStyles.title3.copyWith(color: textPrimaryColor),
      ),

      // Tối ưu Input Decoration cho toàn App giống hình mẫu
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFillColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        hintStyle: AppTextStyles.textLargeRegular.copyWith(color: textSecondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: borderColor, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: borderColor, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: Size.fromHeight(AppDimens.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.shapeFull)),
        ),
      ),
    );
  }
}