import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/theme_service.dart';
import '../../../core/theme/theme_config.dart';
import '../../../core/widgets/base_scaffold.dart';
import '../../../core/widgets/theme_button.dart';
import '../../../core/widgets/theme_icon_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseScaffold(
      body: Stack(
        children: [
          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomIn(
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    padding: const EdgeInsets.all(AppThemeConfig.p24),
                    decoration: AppThemeConfig.circularDecoration(),
                    child: Pulse(
                      infinite: true,
                      duration: const Duration(seconds: 3),
                      child: Icon(
                        Icons.grid_view_rounded,
                        size: 80,
                        color: AppColors.playerX,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppThemeConfig.p48),
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Text(
                    'Tic Tac Toe',
                    style: AppThemeConfig.h2Style().copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
                const SizedBox(height: AppThemeConfig.p64),
                FadeInUp(
                  delay: const Duration(milliseconds: 600),
                  child: Column(
                    children: [
                      // PvC Button
                      ThemeButton(
                        text: 'VS COMPUTER',
                        onPressed: controller.onPlayPvC,
                        variant: ThemeButtonVariant.primary,
                        icon: Icons.computer,
                        width: 250,
                      ),
                      const SizedBox(height: AppThemeConfig.p24),
                      // PvP Button
                      ThemeButton(
                        text: 'VS PLAYER',
                        onPressed: controller.onPlayPvP,
                        variant: ThemeButtonVariant.secondary,
                        icon: Icons.people,
                        width: 250,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Controls
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: FadeInUp(
              delay: const Duration(milliseconds: 900),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Theme Toggle
                  ThemeIconButton(
                    onPressed: () => Get.find<ThemeService>().cycleTheme(),
                    icon: Icons.palette_outlined,
                    color: AppColors.playerX,
                  ),
                  const SizedBox(width: 24),
                  // Exit Button
                  ThemeIconButton(
                    onPressed: controller.onExitApp,
                    icon: Icons.exit_to_app,
                    color: AppColors.error,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
