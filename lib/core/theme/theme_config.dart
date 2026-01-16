import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

/// Centralized Theme Configuration
/// Single source of truth for all theme-related styling constants
/// Edit this file to control the entire app's appearance
class AppThemeConfig {
  // Prevent instantiation
  AppThemeConfig._();

  // ============================================================================
  // SPACING
  // ============================================================================
  
  /// Padding values
  static const double p4 = 4.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
  static const double p32 = 32.0;
  static const double p48 = 48.0;
  static const double p64 = 64.0;

  // ============================================================================
  // BORDER RADIUS
  // ============================================================================
  
  static const double r8 = 8.0;
  static const double r12 = 12.0;
  static const double r16 = 16.0;
  static const double r24 = 24.0;
  static const double r30 = 30.0;
  static const double r48 = 48.0;

  // ============================================================================
  // FONT SIZES
  // ============================================================================
  
  static const double h1 = 32.0;
  static const double h2 = 28.0;
  static const double h3 = 24.0;
  static const double h4 = 20.0;
  static const double body = 16.0;
  static const double small = 14.0;
  static const double caption = 12.0;

  // ============================================================================
  // ANIMATION DURATIONS
  // ============================================================================
  
  static const Duration fastAnimation = Duration(milliseconds: 200);
  static const Duration normalAnimation = Duration(milliseconds: 300);
  static const Duration slowAnimation = Duration(milliseconds: 500);
  static const Duration extraSlowAnimation = Duration(milliseconds: 800);

  // ============================================================================
  // TYPOGRAPHY
  // ============================================================================
  
  /// Heading 1 - Extra large headings
  static TextStyle h1Style({Color? color}) => GoogleFonts.poppins(
        fontSize: h1,
        fontWeight: FontWeight.w900,
        letterSpacing: -1.0,
        color: color ?? AppColors.textPrimary,
      );

  /// Heading 2 - Large headings
  static TextStyle h2Style({Color? color}) => GoogleFonts.poppins(
        fontSize: h2,
        fontWeight: FontWeight.w800,
        letterSpacing: 2.0,
        color: color ?? AppColors.textPrimary,
      );

  /// Heading 3 - Medium headings
  static TextStyle h3Style({Color? color}) => GoogleFonts.poppins(
        fontSize: h3,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
        color: color ?? AppColors.textPrimary,
      );

  /// Heading 4 - Small headings
  static TextStyle h4Style({Color? color}) => GoogleFonts.poppins(
        fontSize: h4,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.textPrimary,
      );

  /// Body text - Regular body copy
  static TextStyle bodyStyle({Color? color, FontWeight? fontWeight}) => GoogleFonts.poppins(
        fontSize: body,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.textPrimary,
      );

  /// Small text - Supplementary information
  static TextStyle smallStyle({Color? color}) => GoogleFonts.poppins(
        fontSize: small,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textSecondary,
      );

  /// Caption text - Very small labels
  static TextStyle captionStyle({Color? color}) => GoogleFonts.poppins(
        fontSize: caption,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.textSecondary,
      );

  /// Button text - Text on buttons
  static TextStyle buttonStyle({Color? color}) => GoogleFonts.poppins(
        fontSize: body,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        color: color ?? AppColors.surface,
      );

  // ============================================================================
  // SHADOWS
  // ============================================================================
  
  /// Small shadow - Subtle elevation (cards, small elements)
  static List<BoxShadow> get smallShadow => [
        BoxShadow(
          color: AppColors.shadow.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  /// Medium shadow - Standard elevation (buttons, containers)
  static List<BoxShadow> get mediumShadow => [
        BoxShadow(
          color: AppColors.shadow.withValues(alpha: 0.15),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];

  /// Large shadow - High elevation (dialogs, popovers)
  static List<BoxShadow> get largeShadow => [
        BoxShadow(
          color: AppColors.shadow.withValues(alpha: 0.2),
          blurRadius: 30,
          offset: const Offset(0, 10),
        ),
      ];

  /// Extra large shadow - Maximum elevation (hero elements)
  static List<BoxShadow> get extraLargeShadow => [
        BoxShadow(
          color: AppColors.shadow.withValues(alpha: 0.25),
          blurRadius: 40,
          offset: const Offset(0, 16),
        ),
      ];

  /// Colored shadow - For accent elements
  static List<BoxShadow> coloredShadow(Color color, {double opacity = 0.3}) => [
        BoxShadow(
          color: color.withValues(alpha: opacity),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ];

  // ============================================================================
  // DECORATIONS
  // ============================================================================
  
  /// Glassy surface decoration - Translucent surface with subtle shadow
  static BoxDecoration get glassySurface => BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(r16),
        boxShadow: smallShadow,
      );

  static BoxDecoration get glassDecoration => glassySurface;

  /// Solid surface decoration - Opaque surface with medium shadow
  static BoxDecoration get solidSurface => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(r16),
        boxShadow: mediumShadow,
      );

  /// Card decoration - Standard card styling
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(r24),
        border: Border.all(
          color: AppColors.surface.withValues(alpha: 0.8),
          width: 2,
        ),
        boxShadow: mediumShadow,
      );

  /// Primary button decoration
  static BoxDecoration get primaryButtonDecoration => BoxDecoration(
        color: AppColors.playerX,
        borderRadius: BorderRadius.circular(r30),
        boxShadow: coloredShadow(AppColors.playerX, opacity: 0.5),
      );

  /// Secondary button decoration (outlined)
  static BoxDecoration get secondaryButtonDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(r30),
        border: Border.all(color: AppColors.playerO, width: 2),
        boxShadow: coloredShadow(AppColors.playerO, opacity: 0.2),
      );

  /// Icon button decoration - Circular glassy background
  static BoxDecoration get iconButtonDecoration => BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.8),
        shape: BoxShape.circle,
        boxShadow: smallShadow,
      );

  /// Circular decoration - For avatars, icons
  static BoxDecoration circularDecoration({Color? color, List<BoxShadow>? shadows}) => BoxDecoration(
        color: color ?? AppColors.surface.withValues(alpha: 0.9),
        shape: BoxShape.circle,
        boxShadow: shadows ?? largeShadow,
      );

  /// Game board decoration - Glassy elevated surface
  static BoxDecoration get gameBoardDecoration => BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(r24),
        border: Border.all(
          color: AppColors.surface.withValues(alpha: 0.8),
          width: 2,
        ),
        boxShadow: extraLargeShadow,
      );

  /// Game cell decoration - Individual cell in game board
  static BoxDecoration cellDecoration({bool isWinning = false}) => BoxDecoration(
        color: isWinning 
            ? AppColors.winningLine.withValues(alpha: 0.2)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(r16),
        boxShadow: isWinning
            ? coloredShadow(AppColors.winningLine, opacity: 0.3)
            : [
                BoxShadow(
                  color: AppColors.shadow.withValues(alpha: 0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
        border: isWinning
            ? Border.all(color: AppColors.winningLine, width: 3)
            : null,
      );

  /// Status badge decoration - For game status indicators
  static BoxDecoration statusBadgeDecoration(Color statusColor) => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(r48),
        boxShadow: coloredShadow(statusColor, opacity: 0.2),
      );

  // ============================================================================
  // GRADIENTS
  // ============================================================================
  
  /// Background gradient - Main app background
  static LinearGradient get backgroundGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.bgGradientTop,
          AppColors.bgGradientBottom,
        ],
      );

  /// Alternative background gradient - Diagonal variant
  static LinearGradient get diagonalBackgroundGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.bgGradientTop,
          AppColors.bgGradientBottom,
        ],
      );
}
