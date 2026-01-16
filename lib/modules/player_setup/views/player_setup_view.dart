import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/theme_config.dart';
import '../../../core/widgets/base_scaffold.dart';
import '../../../core/widgets/theme_button.dart';
import '../../../core/widgets/theme_text_field.dart';
import '../../../core/widgets/theme_back_button.dart';
import '../controllers/player_setup_controller.dart';

class PlayerSetupView extends GetView<PlayerSetupController> {
  const PlayerSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showAnimatedBackground: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const ThemeBackButton(),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppThemeConfig.p24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Before we start',
                  style: AppThemeConfig.h2Style(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppThemeConfig.p8),
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Enter Player Names',
                  style: AppThemeConfig.bodyStyle(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppThemeConfig.p48),
              
              // Input Container
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Container(
                  padding: const EdgeInsets.all(AppThemeConfig.p24),
                  decoration: AppThemeConfig.glassDecoration,
                  child: Column(
                    children: [
                      // Player 1 Input
                      ThemeTextField(
                        controller: controller.player1Controller,
                        label: 'Player X Name',
                        icon: Icons.person,
                        color: AppColors.playerX,
                        errorText: controller.player1Error,
                      ),
                      const SizedBox(height: AppThemeConfig.p24),
                      
                      // Player 2 Input
                      ThemeTextField(
                        controller: controller.player2Controller,
                        label: 'Player O Name',
                        icon: Icons.person_outline,
                        color: AppColors.playerO,
                        errorText: controller.player2Error,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppThemeConfig.p48),

              // Start Button
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 800),
                child: ThemeButton(
                  text: "LET'S PLAY!",
                  onPressed: controller.onStartGame,
                  variant: ThemeButtonVariant.primary,
                  icon: Icons.play_arrow_rounded,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
