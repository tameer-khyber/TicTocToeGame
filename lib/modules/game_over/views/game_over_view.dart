import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/theme/theme_config.dart';
import '../../../core/widgets/base_scaffold.dart';
import '../../../core/widgets/theme_button.dart';
import '../controllers/game_over_controller.dart';

class GameOverView extends GetView<GameOverController> {
  const GameOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              duration: const Duration(milliseconds: 800),
              child: Text(
                controller.result,
                textAlign: TextAlign.center,
                style: AppThemeConfig.h1Style().copyWith(
                      fontSize: 64,
                    ),
              ),
            ),
            const SizedBox(height: AppThemeConfig.p64),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: ThemeButton(
                text: 'RESTART GAME',
                onPressed: controller.onRestart,
                variant: ThemeButtonVariant.primary,
                width: 220,
              ),
            ),
            const SizedBox(height: AppThemeConfig.p20),
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: ThemeButton(
                text: 'GO TO HOME',
                onPressed: controller.onExit,
                variant: ThemeButtonVariant.outlined,
                width: 220,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
