import 'package:auto_mafia/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextStyles {
  ///display1
  static TextStyle displayLarge = TextStyle(
    fontFamily: 'lemonada',
    color: const Color(0xFF070E25),
    fontSize: 64,
    fontWeight: FontWeight.w600,
    height: 0.02,
  );

  ///display2
  static TextStyle displayMedium = TextStyle(
    fontFamily: 'lemonada',
    color: const Color(0xFF070E25),
    fontSize: 56,
    fontWeight: FontWeight.w600,
    height: 0.02,
  );

  ///H1
  static TextStyle displaySmall = TextStyle(
    fontFamily: 'lemonada',
    color: const Color(0xFF070E25),
    fontSize: 44,
    fontWeight: FontWeight.w600,
    height: 0.03,
  );

  ///H2
  static TextStyle headlineLarge = TextStyle(
    fontFamily: 'lemonada',
    color: const Color(0xFF070E25),
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 0.03,
  );

  ///H3
  static TextStyle headlineMedium = TextStyle(
    fontFamily: 'lemonada',
    color: const Color(0xFF070E25),
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 0.04,
  );

  ///H4
  static TextStyle headlineSmall = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xFF070E25),
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 0.06,
  );

  ///H5
  static TextStyle titleLarge = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xFF070E25),
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 0.07,
  );

  ///H6
  static TextStyle titleMedium = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xFF070E25),
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 0.09,
  );

  ///Body - XL
  static TextStyle bodyLarge = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xB2070E25),
    fontSize: 20,
    fontWeight: FontWeight.w400,
    // height: 0.09,
  );

  ///Body - LG
  static TextStyle bodyMedium = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xB2070E25),
    fontSize: 18,
    fontWeight: FontWeight.w300,
    height: 0.10,
  );

  ///Body - MD
  static TextStyle bodyMD = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xB2070E25),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 0.11,
  );

  ///Body - SM
  static TextStyle bodySmall = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xB2070E25),
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 0.13,
  );

  ///Body - XS
  static TextStyle bodyXS = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xB2070E25),
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 0.15,
  );

  ///Caption - md
  static TextStyle titleSmall = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xB2070E25),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 0.15,
  );

  ///Button - LG
  static TextStyle labelLarge = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xFF070E25),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 0,
  );

  ///Button - SM
  static TextStyle labelMedium = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xFF070E25),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 0.12,
  );

  ///Overline - LG
  static TextStyle labelSmall = TextStyle(
    fontFamily: 'ibm_plex_sans_arabic',
    color: const Color(0xFF5A38FF),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 0.12,
  );

  static TextStyle rolePanel = MyTextStyles.headlineSmall.copyWith(
    color: AppColors.secondaries[4],
  );
}
