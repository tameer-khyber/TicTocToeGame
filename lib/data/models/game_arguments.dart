import '../../core/enums/game_enums.dart';
import 'player_model.dart';

/// Type-safe model for game navigation arguments
/// Eliminates manual map creation and provides type safety
class GameArguments {
  final GameMode mode;
  final GameDifficulty difficulty;
  final String player1Name;
  final String player2Name;
  final Player? startingPlayer;

  const GameArguments({
    required this.mode,
    required this.difficulty,
    this.player1Name = 'Player X',
    this.player2Name = 'Player O',
    this.startingPlayer,
  });

  /// Convert to map for GetX navigation
  Map<String, dynamic> toMap() {
    return {
      'mode': mode,
      'difficulty': difficulty,
      'player1Name': player1Name,
      'player2Name': player2Name,
      'startingPlayer': startingPlayer?.index, // Store as enum index
    };
  }

  /// Create from map (for receiving arguments)
  factory GameArguments.fromMap(Map<String, dynamic> map) {
    return GameArguments(
      mode: map['mode'] as GameMode? ?? GameMode.pvp,
      difficulty: map['difficulty'] as GameDifficulty? ?? GameDifficulty.easy,
      player1Name: map['player1Name'] as String? ?? 'Player X',
      player2Name: map['player2Name'] as String? ?? 'Player O',
      startingPlayer: map['startingPlayer'] != null 
          ? Player.values[map['startingPlayer'] as int] 
          : null,
    );
  }

  /// Quick constructor for PvP mode
  factory GameArguments.pvp({String? player1Name, String? player2Name, Player? startingPlayer}) {
    return GameArguments(
      mode: GameMode.pvp,
      difficulty: GameDifficulty.easy,
      player1Name: player1Name ?? 'Player X',
      player2Name: player2Name ?? 'Player O',
      startingPlayer: startingPlayer,
    );
  }

  /// Quick constructor for PvC mode
  factory GameArguments.pvc(GameDifficulty difficulty, {Player? startingPlayer}) {
    return GameArguments(
      mode: GameMode.pvc,
      difficulty: difficulty,
      player1Name: 'You',
      player2Name: 'Computer',
      startingPlayer: startingPlayer,
    );
  }
}
