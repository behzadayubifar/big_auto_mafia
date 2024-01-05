import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

@riverpod
class AutoMafiaTheme extends _$AutoMafiaTheme {
  ThemeData _theme = ThemeData(
    colorScheme: ColorScheme(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.white,
      background: AppColors.white,
      error: AppColors.secondary,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.black,
      onBackground: AppColors.black,
      onError: AppColors.white,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyles.displayLarge,
      displayMedium: TextStyles.displayMedium,
      displaySmall: TextStyles.displaySmall,
      headlineLarge: TextStyles.headlineLarge,
      headlineMedium: TextStyles.headlineMedium,
      headlineSmall: TextStyles.headlineSmall,
      titleLarge: TextStyles.titleLarge,
      titleMedium: TextStyles.titleMedium,
      titleSmall: TextStyles.titleSmall,
      bodyLarge: TextStyles.bodyLarge,
      bodyMedium: TextStyles.bodyMedium,
      bodySmall: TextStyles.bodySmall,
      labelLarge: TextStyles.labelLarge,
      labelMedium: TextStyles.labelMedium,
      labelSmall: TextStyles.labelSmall,
    ),
  );

  ThemeData theme() => _theme;

  @override
  ThemeData build() {
    return theme();
  }

  void toggleDarkMode() {}
}
