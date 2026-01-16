import '../../core/enums/game_enums.dart';

/// Type-safe model for game navigation arguments
/// Eliminates manual map creation and provides type safety
class GameArguments {
  final GameMode mode;
  final GameDifficulty difficulty;
  final String player1Name;
  final String player2Name;

  const GameArguments({
    required this.mode,
    required this.difficulty,
    this.player1Name = 'Player X',
    this.player2Name = 'Player O',
  });

  /// Convert to map for GetX navigation
  Map<String, dynamic> toMap() {
    return {
      'mode': mode,
      'difficulty': difficulty,
      'player1Name': player1Name,
      'player2Name': player2Name,
    };
  }

  /// Create from map (for receiving arguments)
  factory GameArguments.fromMap(Map<String, dynamic> map) {
    return GameArguments(
      mode: map['mode'] as GameMode? ?? GameMode.pvp,
      difficulty: map['difficulty'] as GameDifficulty? ?? GameDifficulty.easy,
      player1Name: map['player1Name'] as String? ?? 'Player X',
      player2Name: map['player2Name'] as String? ?? 'Player O',
    );
  }

  /// Quick constructor for PvP mode
  factory GameArguments.pvp({String? player1Name, String? player2Name}) {
    return GameArguments(
      mode: GameMode.pvp,
      difficulty: GameDifficulty.easy, // Doesn't matter for PvP
      player1Name: player1Name ?? 'Player X',
      player2Name: player2Name ?? 'Player O',
    );
  }

  /// Quick constructor for PvC mode
  factory GameArguments.pvc(GameDifficulty difficulty) {
    return GameArguments(
      mode: GameMode.pvc,
      difficulty: difficulty,
      player1Name: 'You',
      player2Name: 'Computer',
    );
  }
}
