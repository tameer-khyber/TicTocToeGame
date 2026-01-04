import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.playerX,
      scaffoldBackgroundColor: AppColors.bgGradientTop, // Fallback
      
      // Text Theme
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppSizes.h1,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppSizes.h2,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppSizes.body,
        ),
        bodyMedium: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: AppSizes.small,
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 8,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r16),
        ),
      ),
      
      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.playerX,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: AppColors.playerX.withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.r12),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.p32,
            vertical: AppSizes.p16,
          ),
          textStyle: const TextStyle(
            fontSize: AppSizes.body,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
