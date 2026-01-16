import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../theme/theme_config.dart';
import 'hover_scale_button.dart';

class ThemeIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color? color;
  final double size;
  final EdgeInsets padding;
  final BoxDecoration? decoration;

  const ThemeIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color,
    this.size = 32,
    this.padding = const EdgeInsets.all(AppThemeConfig.p16),
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScaleButton(
      onPressed: onPressed,
      child: Container(
        padding: padding,
        decoration: decoration ?? AppThemeConfig.iconButtonDecoration,
        child: Icon(
          icon,
          color: color ?? AppColors.textPrimary,
          size: size,
        ),
      ),
    );
  }
}
