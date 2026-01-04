import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/enums/game_enums.dart';
import '../../../core/widgets/animated_background.dart';
import '../../../core/widgets/hover_scale_button.dart';
import '../../../core/widgets/animated_scale_button.dart';
import '../controllers/difficulty_controller.dart';

class DifficultyView extends GetView<DifficultyController> {
  const DifficultyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: HoverScaleButton(
          onPressed: controller.onBack,
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
        ),
      ),
      body: Stack(
        children: [
           // Background
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
          const Positioned.fill(child: AnimatedBackground()),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.p24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   FadeInDown(
                    child: Text(
                      'Select Difficulty',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.textPrimary,
                          ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.p48),
                  
                  _buildDifficultyCard(
                    context, 
                    'EASY', 
                    GameDifficulty.easy, 
                    Colors.greenAccent, 
                    0
                  ),
                  const SizedBox(height: AppSizes.p24),
                  _buildDifficultyCard(
                    context, 
                    'NORMAL', 
                    GameDifficulty.medium, 
                    Colors.orangeAccent, 
                    200
                  ),
                  const SizedBox(height: AppSizes.p24),
                  _buildDifficultyCard(
                    context, 
                    'HARD', 
                    GameDifficulty.hard, 
                    Colors.redAccent, 
                    400
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifficultyCard(
      BuildContext context, String title, GameDifficulty difficulty, Color color, int delay) {
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: AnimatedScaleButton(
        onPressed: () => controller.selectDifficulty(difficulty),
         // Ensure default tapScale/hoverScale are used or customized
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: AppSizes.p20),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppSizes.r24),
             border: Border.all(
              color: color.withValues(alpha: 0.5),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.2),
                blurRadius: 15,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                  letterSpacing: 2,
                ),
          ),
        ),
      ),
    );
  }
}
