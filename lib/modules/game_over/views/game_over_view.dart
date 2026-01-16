import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/animated_background.dart';
import '../controllers/game_over_controller.dart';

class GameOverView extends GetView<GameOverController> {
  const GameOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(

      body: Stack(
        children: [
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

          Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  controller.result,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                        fontSize: 64,
                      ),
                ),
              ),
              const SizedBox(height: AppSizes.p64),
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: SizedBox(
                  width: 220,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: controller.onRestart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.playerX,
                      foregroundColor: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'RESTART GAME',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.p20),
              FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: 220,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: controller.onExit,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: BorderSide(color: AppColors.textPrimary, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'GO TO HOME',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    ));
  }
}
