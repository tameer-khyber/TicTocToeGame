import 'package:flutter/material.dart';
import '../theme/theme_config.dart';
import '../constants/app_colors.dart';
import 'animated_scale_button.dart';

/// Standardized theme button widget
/// Eliminates duplicate button structures across views
class ThemeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ThemeButtonVariant variant;
  final IconData? icon;
  final double? width;
  final double? height;

  const ThemeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ThemeButtonVariant.primary,
    this.icon,
    this.width,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AnimatedScaleButton(
        onPressed: onPressed,
        child: Container(
          decoration: _getDecoration(),
          alignment: Alignment.center,
          child: _buildContent(),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    switch (variant) {
      case ThemeButtonVariant.primary:
        return AppThemeConfig.primaryButtonDecoration;
      case ThemeButtonVariant.secondary:
        return AppThemeConfig.secondaryButtonDecoration;
      case ThemeButtonVariant.outlined:
        return BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppThemeConfig.r30),
          border: Border.all(color: AppColors.textPrimary, width: 2),
        );
    }
  }

  Widget _buildContent() {
    final textStyle = variant == ThemeButtonVariant.primary
        ? AppThemeConfig.buttonStyle()
        : variant == ThemeButtonVariant.secondary
            ? AppThemeConfig.buttonStyle(color: AppColors.playerO)
            : AppThemeConfig.buttonStyle(color: AppColors.textPrimary);

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: variant == ThemeButtonVariant.primary
                ? AppColors.onButtonPrimary
                : variant == ThemeButtonVariant.secondary
                    ? AppColors.playerO
                    : AppColors.textPrimary,
            size: 28,
          ),
          const SizedBox(width: 12),
          Text(text, style: textStyle),
        ],
      );
    }

    return Text(text, style: textStyle);
  }
}

/// Button style variants
enum ThemeButtonVariant {
  primary,   // Filled with primary color
  secondary, // Outlined with secondary color
  outlined,  // Outlined with text color
}
