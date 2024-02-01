import 'package:auto_mafia/constants/app_colors.dart';
import 'package:auto_mafia/constants/my_text_styles.dart';
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
      displayLarge: MyTextStyles.displayLarge,
      displayMedium: MyTextStyles.displayMedium,
      displaySmall: MyTextStyles.displaySmall,
      headlineLarge: MyTextStyles.headlineLarge,
      headlineMedium: MyTextStyles.headlineMedium,
      headlineSmall: MyTextStyles.headlineSmall,
      titleLarge: MyTextStyles.titleLarge,
      titleMedium: MyTextStyles.titleMedium,
      titleSmall: MyTextStyles.titleSmall,
      bodyLarge: MyTextStyles.bodyLarge,
      bodyMedium: MyTextStyles.bodyMedium,
      bodySmall: MyTextStyles.bodySmall,
      labelLarge: MyTextStyles.labelLarge,
      labelMedium: MyTextStyles.labelMedium,
      labelSmall: MyTextStyles.labelSmall,
    ),
  );

  ThemeData theme() => _theme;

  @override
  ThemeData build() {
    return theme();
  }

  void toggleDarkMode() {}
}
