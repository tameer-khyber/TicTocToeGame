import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/animated_background.dart';
import '../../../core/widgets/animated_scale_button.dart';
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
                  child: AnimatedScaleButton(
                    onPressed: controller.onRestart,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.playerX,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                            BoxShadow(
                              color: AppColors.playerX.withValues(alpha: 0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                        ]
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'RESTART GAME',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Colors.white,
                        ),
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
                  child: AnimatedScaleButton(
                    onPressed: controller.onExit,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.textPrimary, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'GO TO HOME',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: AppColors.textPrimary,
                        ),
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
