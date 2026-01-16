import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/theme_config.dart';
import '../../../core/widgets/base_scaffold.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInDown(
              duration: const Duration(milliseconds: 1500),
              child: Container(
                padding: const EdgeInsets.all(AppThemeConfig.p32),
                decoration: AppThemeConfig.circularDecoration(
                  color: AppColors.surface,
                  shadows: AppThemeConfig.largeShadow,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElasticInLeft(
                      duration: const Duration(milliseconds: 2000),
                      child: Text(
                        'X',
                        style: AppThemeConfig.h1Style(color: AppColors.playerX).copyWith(
                          fontSize: 80,
                          shadows: [
                            Shadow(
                              color: AppColors.playerX.withValues(alpha: 0.5),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: AppThemeConfig.p16),
                    ElasticInRight(
                      duration: const Duration(milliseconds: 2000),
                      child: Text(
                        'O',
                        style: AppThemeConfig.h1Style(color: AppColors.playerO).copyWith(
                          fontSize: 80,
                          shadows: [
                            Shadow(
                              color: AppColors.playerO.withValues(alpha: 0.5),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppThemeConfig.p48),
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 1000),
              child: Text(
                AppStrings.appTitle,
                style: AppThemeConfig.h2Style(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
