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
        displayLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppSizes.h1,
          fontWeight: FontWeight.w900, // Extra Bold
          letterSpacing: -1.0,
        ),
        displayMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppSizes.h2,
          fontWeight: FontWeight.w800,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppSizes.body,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
          fontSize: AppSizes.small,
          fontWeight: FontWeight.w500,
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
          backgroundColor: AppColors.playerX, // Dark Coffee
          foregroundColor: AppColors.bgGradientTop, // Cream text
          elevation: 6,
          shadowColor: AppColors.playerX.withValues(alpha: 0.5),
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
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
