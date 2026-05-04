import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/core/constants/app_dimens.dart';
import 'package:lms_app/core/constants/app_text_styles.dart';

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
      inputFillColor: AppColor.surface,
      textPrimaryColor: AppColor.textPrimary,
      textSecondaryColor: AppColor.textSecondary,
      borderColor: AppColor.border,
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
      textTheme: TextTheme(
        displayLarge: AppTextStyles.largeTitle.copyWith(
          color: textPrimaryColor,
        ),
        headlineLarge: AppTextStyles.title1.copyWith(color: textPrimaryColor),
        headlineMedium: AppTextStyles.title2.copyWith(color: textPrimaryColor),
        titleLarge: AppTextStyles.title3.copyWith(color: textPrimaryColor),
        bodyLarge: AppTextStyles.textLargeRegular.copyWith(
          color: textPrimaryColor,
        ),
        bodyMedium: AppTextStyles.textSmallRegular.copyWith(
          color: textPrimaryColor,
        ),
        bodySmall: AppTextStyles.textVerySmallRegular.copyWith(
          color: textSecondaryColor,
        ),
        labelLarge: AppTextStyles.textLargeSemi.copyWith(
          color: textPrimaryColor,
        ),
        labelMedium: AppTextStyles.textSmallSemi.copyWith(
          color: textPrimaryColor,
        ),
        labelSmall: AppTextStyles.textVerySmallSemi.copyWith(
          color: textSecondaryColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: textPrimaryColor,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: AppDimens.topAppBarHeight,
        titleTextStyle: AppTextStyles.title3.copyWith(color: textPrimaryColor),
        iconTheme: IconThemeData(
          color: textPrimaryColor,
          size: AppDimens.iconMedium,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
          disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
          minimumSize: Size.fromHeight(AppDimens.buttonHeight),
          padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.shapeFull),
          ),
          textStyle: AppTextStyles.textLargeMedium,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary, width: 1.5),
          minimumSize: Size.fromHeight(AppDimens.buttonHeight),
          padding: EdgeInsets.symmetric(horizontal: AppDimens.grid3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.shapeFull),
          ),
          textStyle: AppTextStyles.textLargeMedium,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: AppTextStyles.textLargeMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.shapeFull),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: AppDimens.cardElevation,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeMedium),
          side: BorderSide(
            color: borderColor,
            width: AppDimens.dividerThickness,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardColor,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: textSecondaryColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: cardColor,
        indicatorColor: colorScheme.primary.withOpacity(0.12),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          final color = states.contains(MaterialState.selected)
              ? colorScheme.primary
              : textSecondaryColor;
          return AppTextStyles.textVerySmallMedium.copyWith(color: color);
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFillColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimens.grid2,
          vertical: AppDimens.grid1_5,
        ),
        hintStyle: AppTextStyles.textSmallRegular.copyWith(
          color: textSecondaryColor,
        ),
        errorStyle: AppTextStyles.textVerySmallRegular.copyWith(
          color: colorScheme.error,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: BorderSide(color: borderColor.withOpacity(0.6)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.shapeSmall),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
      ),
    );
  }
}
