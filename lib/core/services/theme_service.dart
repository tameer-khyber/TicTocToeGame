import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameTheme {
  final String name;
  final Color bgGradientTop;
  final Color bgGradientBottom;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color accent;
  final Color playerX;
  final Color playerO;
  final Color shadow;
  final Color winningLine;

  GameTheme({
    required this.name,
    required this.bgGradientTop,
    required this.bgGradientBottom,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.accent,
    required this.playerX,
    required this.playerO,
    required this.shadow,
    required this.winningLine,
  });
}

class ThemeService extends GetxService {
  static ThemeService get to => Get.find();

  final Rx<GameTheme> currentTheme = _classicTheme.obs;

  // Classic Theme (Amber Mirage)
  static final _classicTheme = GameTheme(
    name: 'Classic',
// ... rest matches ...
    bgGradientTop: const Color(0xFFFFF5E1),
    bgGradientBottom: const Color(0xFFEBC176),
    surface: Colors.white,
    textPrimary: const Color(0xFF5A3C0B),
    textSecondary: const Color(0xFF8D6E63),
    accent: const Color(0xFFC48B28),
    playerX: const Color(0xFF5A3C0B),
    playerO: const Color(0xFFC48B28),
    shadow: const Color(0x2F5A3C0B),
    winningLine: const Color(0xFF2E7D32),
  );

  // Sapphire Veil Theme
  static final _sapphireTheme = GameTheme(
    name: 'Sapphire',
    bgGradientTop: const Color(0xFFE7F0FA),
    bgGradientBottom: const Color(0xFF7BA4D0),
    surface: const Color(0xFFFFFFFF),
    textPrimary: const Color(0xFF0D2440),
    textSecondary: const Color(0xFF2E5E99),
    accent: const Color(0xFF2E5E99),
    playerX: const Color(0xFF0D2440),
    playerO: const Color(0xFF2E5E99), // Using accent for O to differentiate
    shadow: const Color(0x2F0D2440),
    winningLine: const Color(0xFFC48B28), // Contrasting Orange/Gold
  );

  // Obsidian Rose Theme
  static final _obsidianTheme = GameTheme(
    name: 'Obsidian',
    bgGradientTop: const Color(0xFFF7E8EC),
    bgGradientBottom: const Color(0xFFC57C8A),
    surface: const Color(0xFFFFFFFF),
    textPrimary: const Color(0xFF1A0B12),
    textSecondary: const Color(0xFF732C3F),
    accent: const Color(0xFF732C3F),
    playerX: const Color(0xFF1A0B12),
    playerO: const Color(0xFF732C3F),
    shadow: const Color(0x2F1A0B12),
    winningLine: const Color(0xFF00C853), // Contrasting Green
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
