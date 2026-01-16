import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/enums/game_enums.dart';
import '../../../core/theme/theme_config.dart';
import '../../../core/widgets/base_scaffold.dart';
import '../../../core/widgets/animated_scale_button.dart';
import '../../../core/widgets/theme_back_button.dart';
import '../controllers/difficulty_controller.dart';

class DifficultyView extends GetView<DifficultyController> {
  const DifficultyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: ThemeBackButton(onPressed: controller.onBack),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppThemeConfig.p24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               FadeInDown(
                child: Text(
                  'Select Difficulty',
                  style: AppThemeConfig.h2Style(),
                ),
              ),
              const SizedBox(height: AppThemeConfig.p48),
              
              _buildDifficultyCard(
                context, 
                'EASY', 
                GameDifficulty.easy, 
                AppColors.success, 
                0
              ),
              const SizedBox(height: AppThemeConfig.p24),
              _buildDifficultyCard(
                context, 
                'NORMAL', 
                GameDifficulty.medium, 
                AppColors.warning, 
                200
              ),
              const SizedBox(height: AppThemeConfig.p24),
              _buildDifficultyCard(
                context, 
                'HARD', 
                GameDifficulty.hard, 
                AppColors.error, 
                400
              ),
            ],
          ),
        ),
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
          padding: const EdgeInsets.symmetric(vertical: AppThemeConfig.p20),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppThemeConfig.r24),
             border: Border.all(
              color: color.withValues(alpha: 0.5),
              width: 2,
            ),
            boxShadow: AppThemeConfig.coloredShadow(color, opacity: 0.2),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppThemeConfig.h3Style(color: color).copyWith(
                  letterSpacing: 2,
                ),
          ),
        ),
      ),
    );
  }
}
