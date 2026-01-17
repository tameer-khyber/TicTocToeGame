import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../data/models/game_arguments.dart';
import '../../data/models/player_model.dart';

/// Navigation helper methods to eliminate duplicate navigation patterns
class NavigationHelpers {
  NavigationHelpers._(); // Private constructor to prevent instantiation

  /// Navigate to game screen with arguments
  static void navigateToGame(GameArguments arguments) {
    Get.offNamed(AppRoutes.game, arguments: arguments.toMap());
  }

  /// Navigate to game over screen
  static void navigateToGameOver({
    required String result,
    required GameArguments gameArguments,
    required Player lastStartingPlayer,
  }) {
    Get.offNamed(
      AppRoutes.gameOver,
      arguments: {
        'result': result,
        'mode': gameArguments.mode,
        'difficulty': gameArguments.difficulty,
        'player1Name': gameArguments.player1Name,
        'player2Name': gameArguments.player2Name,
        'lastStartingPlayer': lastStartingPlayer.index, // Store to toggle next time
      },
    );
  }

  /// Navigate with delay
  static Future<void> delayedNavigation({
    required String route,
    required Duration delay,
    Map<String, dynamic>? arguments,
    bool offNamed = false,
  }) {
    return Future.delayed(delay, () {
      if (offNamed) {
        Get.offNamed(route, arguments: arguments);
      } else {
        Get.toNamed(route, arguments: arguments);
      }
    });
  }

  /// Navigate to home (clear stack)
  static void navigateToHome() {
    Get.offAllNamed(AppRoutes.home);
  }
}
