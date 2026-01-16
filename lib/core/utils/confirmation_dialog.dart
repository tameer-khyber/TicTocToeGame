import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../theme/theme_config.dart';
import '../widgets/theme_button.dart';

/// Reusable confirmation dialog widget with animations
/// Eliminates duplicate dialog code across the app
class ConfirmationDialog {
  ConfirmationDialog._(); // Private constructor

  /// Show animated confirmation dialog
  static Future<bool?> show({
    required String title,
    required String message,
    required IconData icon,
    Color? iconColor,
    String confirmText = 'YES',
    String cancelText = 'NO',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return Get.dialog<bool>(
      ZoomIn(
        duration: const Duration(milliseconds: 300),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.surface,
                  AppColors.surface.withValues(alpha: 0.9),
                ],
              ),
              borderRadius: BorderRadius.circular(AppThemeConfig.r24),
              boxShadow: AppThemeConfig.extraLargeShadow,
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppThemeConfig.p32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animated Icon
                  Bounce(
                    delay: const Duration(milliseconds: 100),
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      padding: const EdgeInsets.all(AppThemeConfig.p20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            (iconColor ?? AppColors.error).withValues(alpha: 0.1),
                            (iconColor ?? AppColors.error).withValues(alpha: 0.05),
                          ],
                        ),
                        boxShadow: AppThemeConfig.coloredShadow(
                          iconColor ?? AppColors.error,
                          opacity: 0.3,
                        ),
                      ),
                      child: Icon(
                        icon,
                        color: iconColor ?? AppColors.error,
                        size: 64,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: AppThemeConfig.p24),
                  
                  // Animated Title
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      title,
                      style: AppThemeConfig.h3Style(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(height: AppThemeConfig.p16),
                  
                  // Animated Message
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      message,
                      style: AppThemeConfig.bodyStyle(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(height: AppThemeConfig.p32),
                  
                  // Animated Buttons
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        Expanded(
                          child: ThemeButton(
                            text: cancelText,
                            onPressed: () {
                              Get.back(result: false);
                              onCancel?.call();
                            },
                            variant: ThemeButtonVariant.outlined,
                          ),
                        ),
                        const SizedBox(width: AppThemeConfig.p16),
                        Expanded(
                          child: ThemeButton(
                            text: confirmText,
                            onPressed: () {
                              Get.back(result: true);
                              onConfirm?.call();
                            },
                            variant: ThemeButtonVariant.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Quick method for exit confirmation
  static Future<bool?> showExitConfirmation({
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return show(
      title: 'Exit Game?',
      message: 'Are you sure you want to exit the game?',
      icon: Icons.exit_to_app_rounded,
      iconColor: AppColors.error,
      confirmText: 'EXIT',
      cancelText: 'CANCEL',
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  /// Quick method for game restart confirmation
  static Future<bool?> showRestartConfirmation({
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return show(
      title: 'Restart Game?',
      message: 'Do you want to start a new game?',
      icon: Icons.refresh_rounded,
      iconColor: AppColors.warning,
      confirmText: 'RESTART',
      cancelText: 'CANCEL',
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  /// Quick method for generic confirmation
  static Future<bool?> showGenericConfirmation({
    required String title,
    required String message,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return show(
      title: title,
      message: message,
      icon: Icons.help_outline_rounded,
      iconColor: AppColors.info,
      confirmText: 'YES',
      cancelText: 'NO',
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }
}
