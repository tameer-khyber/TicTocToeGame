import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/theme_service.dart';

class AppColors {
  static GameTheme get _theme => Get.find<ThemeService>().currentTheme.value;

  // Background colors
  static Color get bgGradientTop => _theme.bgGradientTop;
  static Color get bgGradientBottom => _theme.bgGradientBottom;
  
  // Surface colors
  static Color get surface => _theme.surface;
  static Color get surfaceLight => _theme.surfaceLight;
  static Color get surfaceDark => _theme.surfaceDark;
  
  // Text colors
  static Color get textPrimary => _theme.textPrimary;
  static Color get textSecondary => _theme.textSecondary;
  
  // Accent colors
  static Color get accent => _theme.accent;
  
  // Player colors
  static Color get playerX => _theme.playerX;
  static Color get playerO => _theme.playerO;
  
  // Utility colors
  static Color get shadow => _theme.shadow;
  static Color get winningLine => _theme.winningLine;
  
  // Button colors
  static Color get buttonPrimary => _theme.buttonPrimary;
  static Color get buttonSecondary => _theme.buttonSecondary;
  static Color get onButtonPrimary => _theme.onButtonPrimary;
  static Color get onButtonSecondary => _theme.onButtonSecondary;
  
  // Semantic colors
  static Color get onSurface => _theme.onSurface;
  static Color get border => _theme.border;
  static Color get divider => _theme.divider;
  
  // Status colors
  static Color get success => _theme.success;
  static Color get error => _theme.error;
  static Color get warning => _theme.warning;
  static Color get info => _theme.info;
}
