import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import 'theme_config.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.playerX,
      scaffoldBackgroundColor: AppColors.bgGradientTop,
      
      // Text Theme - Using centralized typography
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: AppThemeConfig.h1Style(),
        displayMedium: AppThemeConfig.h2Style(),
        headlineSmall: AppThemeConfig.h3Style(),
        titleLarge: AppThemeConfig.h4Style(),
        bodyLarge: AppThemeConfig.bodyStyle(),
        bodyMedium: AppThemeConfig.smallStyle(),
        bodySmall: AppThemeConfig.captionStyle(),
      ),
      
      // Card Theme - Using centralized decorations
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 8,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppThemeConfig.r16),
        ),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.onButtonPrimary,
          elevation: 6,
          shadowColor: AppColors.shadow.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeConfig.r12),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeConfig.p32,
            vertical: AppThemeConfig.p16,
          ),
          textStyle: AppThemeConfig.buttonStyle(),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.buttonSecondary,
          side: BorderSide(color: AppColors.buttonSecondary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeConfig.r12),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeConfig.p32,
            vertical: AppThemeConfig.p16,
          ),
          textStyle: AppThemeConfig.buttonStyle(color: AppColors.buttonSecondary),
        ),
      ),
      
      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppThemeConfig.h2Style(),
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      
      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColors.textPrimary,
        size: 24,
      ),
    );
  }
}
