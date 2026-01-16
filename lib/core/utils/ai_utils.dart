import 'dart:math';
import '../../data/models/player_model.dart';
import '../enums/game_enums.dart';

class TicTacToeAI {
  static int getBestMove(List<Player> board, GameDifficulty difficulty) {
    // 1. Check for valid moves
    List<int> availableMoves = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == Player.none) {
        availableMoves.add(i);
      }
    }

    if (availableMoves.isEmpty) return -1;

    // 2. Difficulty Logic
    int move = -1;
    switch (difficulty) {
      case GameDifficulty.easy:
        // 40% - 70% range -> Let's aim for ~60% accuracy
        // It tries to be smart, but makes frequent mistakes
        if (Random().nextDouble() <= 0.60) {
           move = _getBestMoveMinimax(board, availableMoves);
        } else {
           move = _getRandomMove(availableMoves);
        }
        break;
      case GameDifficulty.medium:
        // 71% - 90% range -> Aim for ~85% accuracy
        // Strong player, occasional slips
        if (Random().nextDouble() <= 0.85) {
           move = _getBestMoveMinimax(board, availableMoves);
        } else {
           move = _getRandomMove(availableMoves);
        }
        break;
      case GameDifficulty.hard:
         // 91% - 98% range -> Aim for ~96% accuracy
         // Nearly unbeatable, very rare mistakes
         if (Random().nextDouble() <= 0.96) {
            move = _getBestMoveMinimax(board, availableMoves);
         } else {
            move = _getRandomMove(availableMoves);
         }
        break;
    }
    
    // Fallback if something fails
    if(move == -1 && availableMoves.isNotEmpty) {
      return availableMoves.first;
    }

    return move;
  }

  static int _getRandomMove(List<int> moves) {
    return moves[Random().nextInt(moves.length)];
  }

  static int _getBestMoveMinimax(List<Player> board, List<int> availableMoves) {
    int bestScore = -1000;
    int bestMove = -1;

    for (int move in availableMoves) {
      board[move] = Player.O; // Assume AI is always Player.O
      int score = _minimax(board, 0, false);
      board[move] = Player.none; // Undo move

      if (score > bestScore) {
        bestScore = score;
        bestMove = move;
      }
    }
    return bestMove != -1 ? bestMove : availableMoves.first;
  }

  static int _minimax(List<Player> board, int depth, bool isMaximizing) {
    final result = _checkWinner(board);
    if (result != null) {
      if (result == Player.O) return 10 - depth;
      if (result == Player.X) return depth - 10;
      return 0; // Draw
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == Player.none) {
          board[i] = Player.O;
          int score = _minimax(board, depth + 1, false);
          board[i] = Player.none;
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == Player.none) {
          board[i] = Player.X;
          int score = _minimax(board, depth + 1, true);
          board[i] = Player.none;
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  static Player? _checkWinner(List<Player> board) {
    const List<List<int>> winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] != Player.none &&
          board[pattern[0]] == board[pattern[1]] &&
          board[pattern[0]] == board[pattern[2]]) {
        return board[pattern[0]];
      }
    }

    if (!board.contains(Player.none)) return Player.none; // Draw logic handled externally mostly but useful here for recursion
    
    // Explicit null return implies game not over
    if(board.contains(Player.none)) return null;
    
    return Player.none; // Draw
  }
}
