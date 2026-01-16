import 'package:flutter/material.dart';
import '../theme/theme_config.dart';
import 'animated_background.dart';

/// Base scaffold with animated gradient background
/// Eliminates duplicate background pattern across all views
class BaseScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;
  final bool showAnimatedBackground;

  const BaseScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.extendBodyBehindAppBar = false,
    this.showAnimatedBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: AppThemeConfig.backgroundGradient,
            ),
          ),
          
          // Animated Shapes Background
          if (showAnimatedBackground)
            const Positioned.fill(child: AnimatedBackground()),
          
          // Main Content
          body,
        ],
      ),
    );
  }
}
