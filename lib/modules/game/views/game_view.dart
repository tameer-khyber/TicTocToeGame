import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/theme_config.dart';
import '../../../data/models/player_model.dart';
import '../viewmodels/game_viewmodel.dart';
import '../widgets/drawing_mark.dart';
import '../../../core/services/audio_service.dart';
import '../../../core/widgets/hover_scale_button.dart';
import '../../../core/widgets/base_scaffold.dart';

class GameView extends GetView<GameViewModel> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: FadeInDown(
          child: const Text(AppStrings.appTitle),
        ),

        automaticallyImplyLeading: false,
        leading: HoverScaleButton(
          onPressed: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: HoverScaleButton(
              onPressed: () => Get.find<AudioService>().toggleMute(),
              child: Obx(() {
                 final isMuted = Get.find<AudioService>().isMuted.value;
                 return Icon(
                   isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                   color: AppColors.textPrimary,
                 );
              }),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
              letterSpacing: 2.0,
              fontSize: 28, // Specific override for AppBar
            ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Replaced background Container and AnimatedBackground with BaseScaffold
          BaseScaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppThemeConfig.p24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Status Indicator
                    FadeInDown(
                      delay: const Duration(milliseconds: 200),
                      child: Obx(() => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppThemeConfig.p32,
                              vertical: AppThemeConfig.p16,
                            ),
                            decoration: AppThemeConfig.statusBadgeDecoration(controller.statusColor),
                            child: Text(
                              controller.gameStatus,
                              style: AppThemeConfig.h3Style(color: controller.statusColor).copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          )),
                    ),

                    const SizedBox(height: AppThemeConfig.p48),

                    // Game Board
                    Flexible(
                      child: ZoomIn(
                        duration: const Duration(milliseconds: 800),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: AppThemeConfig.gameBoardDecoration,
                            padding: const EdgeInsets.all(AppThemeConfig.p20),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: AppThemeConfig.p12,
                                crossAxisSpacing: AppThemeConfig.p12,
                              ),
                              itemCount: 9,
                              itemBuilder: (context, index) {
                                return FadeInUp(
                                  duration: const Duration(milliseconds: 600),
                                  delay: Duration(milliseconds: 100 * index), // Staggered delay
                                  child: GestureDetector(
                                    onTap: () => controller.makeMove(index),
                                    child: Obx(() {
                                      final player = controller.board[index];
                                      final isWinningCell = controller.winningLine.contains(index);
                                      
                                      return AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeInOutBack,
                                        decoration: AppThemeConfig.cellDecoration(isWinning: isWinningCell),
                                        child: Center(
                                          child: player == Player.none 
                                              ? const SizedBox.shrink()
                                              : DrawingMark(
                                                  player: player,
                                                  size: 50,
                                                  color: isWinningCell
                                                      ? AppColors.winningLine
                                                      : (player == Player.X 
                                                          ? AppColors.playerX 
                                                          : AppColors.playerO),
                                                ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppThemeConfig.p48),

                    // Restart Button removed
                  ],
                ),
              ),
            ),
          ),
          
          // Confetti Overlay
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller.confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false, 
              colors: [
                AppColors.success,
                AppColors.info,
                AppColors.error,
                AppColors.warning,
                AppColors.playerO,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
