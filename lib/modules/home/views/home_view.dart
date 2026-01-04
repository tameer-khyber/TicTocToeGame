import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/services/theme_service.dart';
import '../../../core/widgets/animated_background.dart';
import '../../../core/widgets/animated_scale_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.bgGradientTop,
                  AppColors.bgGradientBottom,
                ],
              ),
            ),
          ),
          
          // Animated Shapes Background
          const Positioned.fill(child: AnimatedBackground()),
          
          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomIn(
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    padding: const EdgeInsets.all(AppSizes.p24),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: 0.9), // Glassy
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow.withValues(alpha: 0.2),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.grid_view_rounded,
                      size: 80,
                      color: AppColors.playerX,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.p48),
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Text(
                    'Tic Tac Toe',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.textPrimary,
                          letterSpacing: 2,
                        ),
                  ),
                ),
                const SizedBox(height: AppSizes.p64),
                FadeInUp(
                  delay: const Duration(milliseconds: 600),
                  child: Column(
                    children: [
                      // PvC Button
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: AnimatedScaleButton(
                          onPressed: controller.onPlayPvC,
                          child: Container(
                            decoration: BoxDecoration(
                               color: AppColors.playerX,
                               borderRadius: BorderRadius.circular(30),
                               boxShadow: [
                                 BoxShadow(
                                   color: AppColors.playerX.withValues(alpha: 0.5),
                                   blurRadius: 15,
                                   offset: const Offset(0, 8),
                                 )
                               ]
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.computer, color: Colors.white, size: 28),
                                const SizedBox(width: 12),
                                const Text(
                                  'VS COMPUTER',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.p24),
                      // PvP Button
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: AnimatedScaleButton(
                          onPressed: controller.onPlayPvP,
                          child: Container(
                            decoration: BoxDecoration(
                               color: AppColors.surface,
                               borderRadius: BorderRadius.circular(30),
                               border: Border.all(color: AppColors.playerO, width: 2),
                               boxShadow: [
                                 BoxShadow(
                                   color: AppColors.playerO.withValues(alpha: 0.2),
                                   blurRadius: 15,
                                   offset: const Offset(0, 8),
                                 )
                               ]
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.people_alt_rounded, color: AppColors.playerO, size: 28),
                                const SizedBox(width: 12),
                                Text(
                                  'VS FRIEND',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    color: AppColors.playerO,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Top Controls
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.p16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   FadeInDown(
                    delay: const Duration(milliseconds: 800),
                    child: AnimatedScaleButton(
                      onPressed: () => Get.find<ThemeService>().cycleTheme(),
                      tapScale: 0.9,
                      child: _buildIconButtonContent(
                        icon: Icons.palette_outlined,
                        color: AppColors.playerX,
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 900),
                    child: AnimatedScaleButton(
                      onPressed: controller.onExitApp,
                      tapScale: 0.9,
                      child: _buildIconButtonContent(
                        icon: Icons.exit_to_app_rounded,
                        color: AppColors.playerX,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildIconButtonContent({
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }
}
