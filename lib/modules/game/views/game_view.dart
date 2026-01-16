import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/models/player_model.dart';
import '../viewmodels/game_viewmodel.dart';

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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              letterSpacing: 1.2,
            ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
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
                            color: Colors.white.withValues(alpha: 0.5), // Glassmorphism base
                            borderRadius: BorderRadius.circular(AppSizes.r24),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.6),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow, // Using shadow constant
                                blurRadius: 24,
                                offset: const Offset(0, 12),
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
                              return Obx(() {
                                final player = controller.board[index];
                                final isWinningCell = controller.winningLine.contains(index);
                                
                                return GestureDetector(
                                  onTap: () => controller.makeMove(index),
                                  child: AnimatedContainer(
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
                                          : ElasticIn( // Animate X/O entry
                                              child: Text(
                                                player == Player.X ? 'X' : 'O',
                                                style: TextStyle(
                                                  fontSize: 56, // Larger text
                                                  fontWeight: FontWeight.w900,
                                                  color: player == Player.X 
                                                      ? AppColors.playerX 
                                                      : AppColors.playerO,
                                                  shadows: [
                                                    Shadow(
                                                      color: (player == Player.X 
                                                          ? AppColors.playerX 
                                                          : AppColors.playerO).withValues(alpha: 0.4),
                                                      blurRadius: 12,
                                                      offset: const Offset(0, 4),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.p48),

                  // Restart Button
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56, // Taller button
                      child: ElevatedButton(
                        onPressed: () => controller.resetGame(),
                        child: const Text('RESTART GAME'), // Caps for style
                      ),
                    ),
                  ),
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
