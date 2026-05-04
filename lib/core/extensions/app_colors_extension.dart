import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color surfaceSoft;
  final Color textTertiary;
  final Color border;

  const AppColorsExtension({
    required this.surfaceSoft,
    required this.textTertiary,
    required this.border,
  });

  @override
  AppColorsExtension copyWith({
    Color? surfaceSoft,
    Color? textTertiary,
    Color? border,
  }) {
    return AppColorsExtension(
      surfaceSoft: surfaceSoft ?? this.surfaceSoft,
      textTertiary: textTertiary ?? this.textTertiary,
      border: border ?? this.border,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      surfaceSoft: Color.lerp(surfaceSoft, other.surfaceSoft, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}