import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../theme/theme_config.dart';

class ThemeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final Color color;
  final RxnString? errorText;
  final String hintText;

  const ThemeTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.color,
    this.errorText,
    this.hintText = 'Enter name...',
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppThemeConfig.bodyStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: AppThemeConfig.bodyStyle(),
          cursorColor: color,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: color),
            filled: true,
            fillColor: AppColors.surface.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppThemeConfig.r12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppThemeConfig.r12),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppThemeConfig.r12),
              borderSide: BorderSide(color: color, width: 2),
            ),
            errorText: errorText?.value,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.5)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    ));
  }
}
