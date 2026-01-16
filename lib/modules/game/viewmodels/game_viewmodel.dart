import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import '../../../routes/app_routes.dart';
import '../../../data/models/player_model.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/audio_service.dart';
import '../../../core/enums/game_enums.dart';
import '../../../core/utils/ai_utils.dart';
import 'package:flutter/material.dart';

class GameViewModel extends GetxController {
  // Observables
  var board = List<Player>.filled(9, Player.none).obs;
  var currentPlayer = Player.X.obs;
  var winner = Player.none.obs;
  var isDraw = false.obs;
  var winningLine = <int>[].obs; // Indices of winning cells for different styling
  
  final AudioService _audioService = Get.find<AudioService>();
  
  late ConfettiController confettiController;

  // Game Config
  late GameMode gameMode;
  late GameDifficulty difficulty;
  bool get isPvC => gameMode == GameMode.pvc;

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController(duration: const Duration(seconds: 3));
    
    // Parse arguments
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    gameMode = args['mode'] ?? GameMode.pvp;
    difficulty = args['difficulty'] ?? GameDifficulty.easy;
  }



  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }

  // Computed Properties
  String get turnText => currentPlayer.value == Player.X ? AppStrings.turnX : AppStrings.turnO;
  
  Color get turnColor => currentPlayer.value == Player.X ? AppColors.playerX : AppColors.playerO;

  String get gameStatus {
    if (winner.value != Player.none) {
      return winner.value == Player.X ? AppStrings.winX : AppStrings.winO;
    }
    if (isDraw.value) {
      return AppStrings.draw;
    }
    return turnText;
  }
  
  Color get statusColor {
     if (winner.value != Player.none) {
      return winner.value == Player.X ? AppColors.playerX : AppColors.playerO;
    }
    if (isDraw.value) {
      return AppColors.textSecondary;
    }
     return turnColor;
  }

  // Logic
  void makeMove(int index) {
    if (board[index] != Player.none || winner.value != Player.none || isDraw.value) {
      return;
    }
    
    // If it's Bot's turn (O) in PvC, block user click
    if (isPvC && currentPlayer.value == Player.O) return;

    _executeMove(index);
  }
  
  void _executeMove(int index) {
    board[index] = currentPlayer.value;
    _audioService.playMove();

    if (_checkWinner(currentPlayer.value)) {
      winner.value = currentPlayer.value;
      confettiController.play();
      _audioService.playWin();
      Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(AppRoutes.gameOver, arguments: {
          'result': winner.value == Player.X ? AppStrings.winX : AppStrings.winO,
          'mode': gameMode,
          'difficulty': difficulty
        });
      });
    } else if (!board.contains(Player.none)) {
      isDraw.value = true;
      _audioService.playDraw();
      Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(AppRoutes.gameOver, arguments: {
          'result': AppStrings.draw,
          'mode': gameMode,
          'difficulty': difficulty
        });
      });
    } else {
      currentPlayer.value = currentPlayer.value == Player.X ? Player.O : Player.X;
      _checkBotTurn();
    }
  }
  
  void _checkBotTurn() {
    if (isPvC && currentPlayer.value == Player.O && winner.value == Player.none && !isDraw.value) {
      Future.delayed(const Duration(milliseconds: 600), () {
         final aiMove = TicTacToeAI.getBestMove(board, difficulty);
         if (aiMove != -1) {
           _executeMove(aiMove);
         }
      });
    }
  }

  void resetGame() {
    board.assignAll(List<Player>.filled(9, Player.none));
    currentPlayer.value = Player.X;
    winner.value = Player.none;
    isDraw.value = false;
    winningLine.clear();
    confettiController.stop();
  }

  bool _checkWinner(Player player) {
    const List<List<int>> winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Cols
      [0, 4, 8], [2, 4, 6]             // Diagonals
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        winningLine.assignAll(pattern);
        return true;
      }
    }
    return false;
  }
}
