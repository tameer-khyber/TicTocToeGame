import 'package:get/get.dart';
import '../../../core/utils/navigation_helpers.dart';
import '../../../data/models/game_arguments.dart';
import '../../../data/models/player_model.dart';
import '../../../core/enums/game_enums.dart';

class GameOverController extends GetxController {
  late String result;
  late GameArguments gameArguments;
  late Player lastStartingPlayer;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      result = args['result'] ?? '';
      gameArguments = GameArguments.fromMap(args);
      // Get who started the last game, default to X if missing
      lastStartingPlayer = args['lastStartingPlayer'] != null 
          ? Player.values[args['lastStartingPlayer'] as int] 
          : Player.X;
    } else {
      // Fallback for safety
      result = args.toString();
      gameArguments = GameArguments.pvp();
      lastStartingPlayer = Player.X;
    }
  }

  void onRestart() {
    // Toggle starting player for the next game
    final nextStartingPlayer = lastStartingPlayer == Player.X ? Player.O : Player.X;
    
    // Create new arguments with the new starting player
    final newArgs = GameArguments(
      mode: gameArguments.mode,
      difficulty: gameArguments.difficulty,
      player1Name: gameArguments.player1Name,
      player2Name: gameArguments.player2Name,
      startingPlayer: nextStartingPlayer,
    );
    
    NavigationHelpers.navigateToGame(newArgs);
  }

  void onExit() {
    NavigationHelpers.navigateToHome();
  }
}
