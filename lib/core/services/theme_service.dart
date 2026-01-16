import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameTheme {
  final String name;
  
  // Background colors
  final Color bgGradientTop;
  final Color bgGradientBottom;
  
  // Surface colors
  final Color surface;
  final Color surfaceLight;
  final Color surfaceDark;
  
  // Text colors
  final Color textPrimary;
  final Color textSecondary;
  
  // Accent colors
  final Color accent;
  
  // Player colors
  final Color playerX;
  final Color playerO;
  
  // Utility colors
  final Color shadow;
  final Color winningLine;
  
  // Button colors
  final Color buttonPrimary;
  final Color buttonSecondary;
  final Color onButtonPrimary;
  final Color onButtonSecondary;
  
  // Semantic colors
  final Color onSurface;
  final Color border;
  final Color divider;
  
  // Status colors
  final Color success;
  final Color error;
  final Color warning;
  final Color info;

  GameTheme({
    required this.name,
    required this.bgGradientTop,
    required this.bgGradientBottom,
    required this.surface,
    required this.surfaceLight,
    required this.surfaceDark,
    required this.textPrimary,
    required this.textSecondary,
    required this.accent,
    required this.playerX,
    required this.playerO,
    required this.shadow,
    required this.winningLine,
    required this.buttonPrimary,
    required this.buttonSecondary,
    required this.onButtonPrimary,
    required this.onButtonSecondary,
    required this.onSurface,
    required this.border,
    required this.divider,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
  });
}

class ThemeService extends GetxService {
  static ThemeService get to => Get.find();

  final Rx<GameTheme> currentTheme = _classicTheme.obs;

  // Classic Theme (Amber Mirage)
  static final _classicTheme = GameTheme(
    name: 'Classic',
    bgGradientTop: const Color(0xFFFFF5E1),
    bgGradientBottom: const Color(0xFFEBC176),
    surface: Colors.white,
    surfaceLight: const Color(0xFFFFFBF5),
    surfaceDark: const Color(0xFFF5F5F0),
    textPrimary: const Color(0xFF5A3C0B),
    textSecondary: const Color(0xFF8D6E63),
    accent: const Color(0xFFC48B28),
    playerX: const Color(0xFF5A3C0B),
    playerO: const Color(0xFFC48B28),
    shadow: const Color(0x2F5A3C0B),
    winningLine: const Color(0xFF2E7D32),
    buttonPrimary: const Color(0xFF5A3C0B),
    buttonSecondary: const Color(0xFFC48B28),
    onButtonPrimary: Colors.white,
    onButtonSecondary: Colors.white,
    onSurface: const Color(0xFF5A3C0B),
    border: const Color(0xFFE0D5C0),
    divider: const Color(0xFFE0D5C0),
    success: const Color(0xFF2E7D32),
    error: const Color(0xFFC62828),
    warning: const Color(0xFFF57C00),
    info: const Color(0xFF1976D2),
  );

  // Sapphire Veil Theme
  static final _sapphireTheme = GameTheme(
    name: 'Sapphire',
    bgGradientTop: const Color(0xFFE7F0FA),
    bgGradientBottom: const Color(0xFF7BA4D0),
    surface: const Color(0xFFFFFFFF),
    surfaceLight: const Color(0xFFF5F9FC),
    surfaceDark: const Color(0xFFE8EEF5),
    textPrimary: const Color(0xFF0D2440),
    textSecondary: const Color(0xFF2E5E99),
    accent: const Color(0xFF2E5E99),
    playerX: const Color(0xFF0D2440),
    playerO: const Color(0xFF2E5E99),
    shadow: const Color(0x2F0D2440),
    winningLine: const Color(0xFFC48B28),
    buttonPrimary: const Color(0xFF0D2440),
    buttonSecondary: const Color(0xFF2E5E99),
    onButtonPrimary: Colors.white,
    onButtonSecondary: Colors.white,
    onSurface: const Color(0xFF0D2440),
    border: const Color(0xFFD0E0F0),
    divider: const Color(0xFFD0E0F0),
    success: const Color(0xFF2E7D32),
    error: const Color(0xFFC62828),
    warning: const Color(0xFFF57C00),
    info: const Color(0xFF1565C0),
  );

  // Obsidian Rose Theme
  static final _obsidianTheme = GameTheme(
    name: 'Obsidian',
    bgGradientTop: const Color(0xFFF7E8EC),
    bgGradientBottom: const Color(0xFFC57C8A),
    surface: const Color(0xFFFFFFFF),
    surfaceLight: const Color(0xFFFCF6F8),
    surfaceDark: const Color(0xFFF0E5E8),
    textPrimary: const Color(0xFF1A0B12),
    textSecondary: const Color(0xFF732C3F),
    accent: const Color(0xFF732C3F),
    playerX: const Color(0xFF1A0B12),
    playerO: const Color(0xFF732C3F),
    shadow: const Color(0x2F1A0B12),
    winningLine: const Color(0xFF00C853),
    buttonPrimary: const Color(0xFF1A0B12),
    buttonSecondary: const Color(0xFF732C3F),
    onButtonPrimary: Colors.white,
    onButtonSecondary: Colors.white,
    onSurface: const Color(0xFF1A0B12),
    border: const Color(0xFFE8D5DA),
    divider: const Color(0xFFE8D5DA),
    success: const Color(0xFF00C853),
    error: const Color(0xFFC62828),
    warning: const Color(0xFFF57C00),
    info: const Color(0xFF1976D2),
  );



  void switchTheme(String themeName) {
    switch (themeName) {
      case 'Classic':
        currentTheme.value = _classicTheme;
        break;
      case 'Sapphire':
        currentTheme.value = _sapphireTheme;
        break;
      case 'Obsidian':
        currentTheme.value = _obsidianTheme;
        break;

      default:
        currentTheme.value = _classicTheme;
    }
  }

  void cycleTheme() {
    if (currentTheme.value.name == 'Classic') {
      switchTheme('Sapphire');
    } else if (currentTheme.value.name == 'Sapphire') {
      switchTheme('Obsidian');
    } else {
      switchTheme('Classic');
    }
  }
}
