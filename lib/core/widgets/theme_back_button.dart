import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import 'theme_icon_button.dart';

class ThemeBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;

  const ThemeBackButton({
    super.key,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeIconButton(
      onPressed: onPressed ?? () => Get.back(),
      icon: Icons.arrow_back_ios_new_rounded,
      color: color ?? AppColors.textPrimary,
      decoration: const BoxDecoration(
        color: Colors.transparent, // Often back buttons don't have backgrounds in AppBars
      ), 
      padding: EdgeInsets.zero, // Adjust padding as needed for AppBar
    );
  }
}
