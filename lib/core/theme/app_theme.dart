import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';
// Nhớ import các class AppColor, AppDimens, AppTextStyles của bạn vào đây

class AppTheme {
  AppTheme._();

  /// Giao diện Sáng (Light Theme) mặc định của App
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.background,
      colorScheme: const ColorScheme.light(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        surface: AppColor.surface,
        error: AppColor.error,
        // Màu chữ hiển thị trên nền primary (VD: Chữ trên nút bấm)
        onPrimary: Colors.white,
        // Màu chữ hiển thị trên nền secondary
        onSecondary: Colors.white,
        // Màu chữ hiển thị trên nền surface (VD: Chữ trên Card)
        onSurface: AppColor.textPrimary,
      ),

      // 3. Cấu hình Typography (Font chữ)
      // Ánh xạ AppTextStyles vào hệ thống TextTheme của Material
      textTheme: TextTheme(
        displayLarge: AppTextStyles.largeTitle.copyWith(color: AppColor.textPrimary),
        headlineLarge: AppTextStyles.title1.copyWith(color: AppColor.textPrimary),
        headlineMedium: AppTextStyles.title2.copyWith(color: AppColor.textPrimary),
        titleLarge: AppTextStyles.title3.copyWith(color: AppColor.textPrimary),

        bodyLarge: AppTextStyles.textLargeRegular.copyWith(color: AppColor.textPrimary),
        bodyMedium: AppTextStyles.textSmallRegular.copyWith(color: AppColor.textPrimary),
        bodySmall: AppTextStyles.textVerySmallRegular.copyWith(color: AppColor.textSecondary),

        labelLarge: AppTextStyles.textLargeSemi.copyWith(color: AppColor.textPrimary),
      ),

      // 4. Cấu hình Theme cho từng Component cụ thể

      // -- Nút bấm (ElevatedButton) --
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white, // Màu chữ/icon trên nút
          minimumSize: const Size.fromHeight(AppDimens.buttonHeight),
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.grid3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.shapeFull),
          ),
          textStyle: AppTextStyles.textLargeMedium,
          elevation: 0,
        ),
      ),

      // -- Thẻ (Card - Dùng cho Flashcard/Bài học) --
      cardTheme: CardThemeData(
        color: AppColor.surface,
        elevation: AppDimens.cardElevation,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeMedium),
          side: const BorderSide(color: AppColor.border, width: 1), // Viền mờ
        ),
      ),

      // -- Thanh điều hướng trên (AppBar) --
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.textPrimary, // Màu nút back và title
        elevation: 0,
        centerTitle: true,
        toolbarHeight: AppDimens.topAppBarHeight,
        titleTextStyle: AppTextStyles.title3.copyWith(color: AppColor.textPrimary),
        iconTheme: const IconThemeData(
          color: AppColor.textPrimary,
          size: AppDimens.iconMedium,
        ),
      ),

      // -- Khung nhập liệu (TextField) --
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.grid2,
          vertical: AppDimens.grid1_5,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: const BorderSide(color: AppColor.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: const BorderSide(color: AppColor.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: const BorderSide(color: AppColor.primary, width: 2),
        ),
        hintStyle: AppTextStyles.textSmallRegular.copyWith(color: AppColor.textSecondary),
      ),
    );
  }

  /// Cấu hình sẵn khung cho Dark Theme (Để sau này làm tính năng đổi nền)
  static ThemeData get darkTheme {
    // Tương tự lightTheme, nhưng bạn sẽ thay các mã màu trong ColorScheme
    // bằng các màu tối (VD: surface là màu xám đen, textPrimary là màu trắng...)
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // ... Cấu hình map màu Dark vào đây sau
    );
  }
}