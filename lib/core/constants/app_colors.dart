import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/theme_service.dart';

class AppColors {
  static GameTheme get _theme => Get.find<ThemeService>().currentTheme.value;

  static Color get bgGradientTop => _theme.bgGradientTop;
  static Color get bgGradientBottom => _theme.bgGradientBottom;
  static Color get surface => _theme.surface;
  static Color get textPrimary => _theme.textPrimary;
  static Color get textSecondary => _theme.textSecondary;
  static Color get accent => _theme.accent;
  static Color get playerX => _theme.playerX;
  static Color get playerO => _theme.playerO;
  static Color get shadow => _theme.shadow;
  static Color get winningLine => _theme.winningLine;
}
