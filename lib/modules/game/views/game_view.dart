import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/models/player_model.dart';
import '../viewmodels/game_viewmodel.dart';
import '../widgets/drawing_mark.dart';
import '../../../core/widgets/animated_background.dart';

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
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.p24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Status Indicator
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    child: Obx(() => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.p32,
                            vertical: AppSizes.p16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(AppSizes.r48),
                            boxShadow: [
                              BoxShadow(
                                color: controller.statusColor.withValues(alpha: 0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Text(
                            controller.gameStatus,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: controller.statusColor,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        )),
                  ),

                  const SizedBox(height: AppSizes.p48),

                  // Game Board
                  Flexible(
                    child: ZoomIn(
                      duration: const Duration(milliseconds: 800),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.surface.withValues(alpha: 0.6), // Richer glass
                            borderRadius: BorderRadius.circular(AppSizes.r24),
                            border: Border.all(
                              color: AppColors.surface.withValues(alpha: 0.8),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow.withValues(alpha: 0.15),
                                blurRadius: 40, // Softer, further spread
                                offset: const Offset(0, 16),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(AppSizes.p20),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: AppSizes.p12,
                              crossAxisSpacing: AppSizes.p12,
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
                                      decoration: BoxDecoration(
                                        color: isWinningCell 
                                            ? AppColors.winningLine.withValues(alpha: 0.2)
                                            : AppColors.surface,
                                        borderRadius: BorderRadius.circular(AppSizes.r16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: isWinningCell 
                                                ? AppColors.winningLine.withValues(alpha: 0.3)
                                                : AppColors.shadow.withValues(alpha: 0.5),
                                            blurRadius: isWinningCell ? 12 : 4,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                        border: isWinningCell
                                            ? Border.all(
                                                color: AppColors.winningLine,
                                                width: 3,
                                              )
                                            : null,
                                      ),
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

                  const SizedBox(height: AppSizes.p48),

                  // Restart Button removed
                ],
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
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
            ),
          ),
        ],
      ),
    );
  }
}
