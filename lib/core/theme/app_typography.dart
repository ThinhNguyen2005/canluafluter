import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  // We use GoogleFonts to load 'Be Vietnam Pro' and 'Noto Sans' dynamically.
  // Standard TextStyles for Light Theme
  static TextStyle displayStyle({required bool isDark}) => GoogleFonts.beVietnamPro(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        height: 1.2,
      );

  static TextStyle headingStyle({required bool isDark}) => GoogleFonts.beVietnamPro(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        height: 1.3,
      );

  static TextStyle titleStyle({required bool isDark, bool isSemiBold = true}) => GoogleFonts.beVietnamPro(
        fontSize: 18,
        fontWeight: isSemiBold ? FontWeight.w600 : FontWeight.bold,
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        height: 1.4,
      );

  static TextStyle bodyStyle({required bool isDark, bool isMuted = false}) => GoogleFonts.beVietnamPro(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: isDark
            ? (isMuted ? AppColors.textSecondaryDark : AppColors.textPrimaryDark)
            : (isMuted ? AppColors.textSecondaryLight : AppColors.textPrimaryLight),
        height: 1.5,
      );

  static TextStyle captionStyle({required bool isDark, bool isMuted = true}) => GoogleFonts.beVietnamPro(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: isDark
            ? (isMuted ? AppColors.textSecondaryDark : AppColors.textPrimaryDark)
            : (isMuted ? AppColors.textSecondaryLight : AppColors.textPrimaryLight),
        height: 1.4,
      );

  // Numeric text style using Noto Sans for clean, uniform tabular digits alignment
  static TextStyle numberStyle({
    required bool isDark,
    required double fontSize,
    FontWeight fontWeight = FontWeight.bold,
    Color? customColor,
  }) =>
      GoogleFonts.notoSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: customColor ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
        fontFeatures: const [FontFeature.tabularFigures()], // Fixed width numbers
      );
}
