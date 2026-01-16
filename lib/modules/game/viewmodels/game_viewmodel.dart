import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import '../../../data/models/player_model.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/audio_service.dart';
import '../../../core/enums/game_enums.dart';
import '../../../core/utils/ai_utils.dart';
import '../../../core/utils/navigation_helpers.dart';
import '../../../data/models/game_arguments.dart';

class GameViewModel extends GetxController {
  // Observables
  var board = List<Player>.filled(9, Player.none).obs;
  var currentPlayer = Player.X.obs;
  var winner = Player.none.obs;
  var isDraw = false.obs;
  var winningLine = <int>[].obs; // Indices of winning cells for different styling
  var isProcessingMove = false.obs; // Prevent double-clicks during animations
  
  final AudioService _audioService = Get.find<AudioService>();
  
  late ConfettiController confettiController;

  // Game Config
  late GameArguments gameArguments;
  bool get isPvC => gameArguments.mode == GameMode.pvc;

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController(duration: const Duration(seconds: 3));
    
    // Parse arguments
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    gameArguments = GameArguments.fromMap(args);
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }

  // Computed Properties
  String get turnText => currentPlayer.value == Player.X 
      ? "${gameArguments.player1Name}'s Turn" 
      : "${gameArguments.player2Name}'s Turn";
  
  Color get turnColor => currentPlayer.value == Player.X ? AppColors.playerX : AppColors.playerO;

  String get gameStatus {
    if (winner.value != Player.none) {
      return winner.value == Player.X 
          ? "${gameArguments.player1Name} Wins!" 
          : "${gameArguments.player2Name} Wins!";
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
    // Prevent moves if:
    // - Cell is already occupied
    // - Game is over
    // - Currently processing another move
    if (board[index] != Player.none || 
        winner.value != Player.none || 
        isDraw.value ||
        isProcessingMove.value) {
      return;
    }
    
    // If it's Bot's turn (O) in PvC, block user click
    if (isPvC && currentPlayer.value == Player.O) return;

    // Lock moves during processing
    isProcessingMove.value = true;
    _executeMove(index);
  }
  
  void _executeMove(int index) {
    board[index] = currentPlayer.value;
    _audioService.playMove();

    if (_checkWinner(currentPlayer.value)) {
      winner.value = currentPlayer.value;
      confettiController.play();
      _audioService.playWin();
      final result = winner.value == Player.X 
          ? "${gameArguments.player1Name} Wins!" 
          : "${gameArguments.player2Name} Wins!";
      _navigateToGameOver(result);
      // Keep move locked until navigation
    } else if (!board.contains(Player.none)) {
      isDraw.value = true;
      _audioService.playDraw();
      _navigateToGameOver(AppStrings.draw);
      // Keep move locked until navigation
    } else {
      // Switch player
      currentPlayer.value = currentPlayer.value == Player.X ? Player.O : Player.X;
      
      // Unlock moves after a brief delay for animation
      Future.delayed(const Duration(milliseconds: 150), () {
        isProcessingMove.value = false;
        _checkBotTurn();
      });
    }
  }
  
  /// Navigate to game over screen with delay
  void _navigateToGameOver(String result) {
    Future.delayed(const Duration(seconds: 2), () {
      NavigationHelpers.navigateToGameOver(
        result: result,
        gameArguments: gameArguments,
      );
    });
  }
  
  void _checkBotTurn() {
    if (isPvC && currentPlayer.value == Player.O && winner.value == Player.none && !isDraw.value) {
      // Lock moves during AI thinking
      isProcessingMove.value = true;
      
      // Reduced delay from 600ms to 250ms for faster response
      Future.delayed(const Duration(milliseconds: 250), () {
         final aiMove = TicTacToeAI.getBestMove(board, gameArguments.difficulty);
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
    isProcessingMove.value = false;
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
