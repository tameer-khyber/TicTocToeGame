import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

import '../../../core/enums/game_enums.dart';

class GameOverController extends GetxController {
  late String result;
  late GameMode gameMode;
  late GameDifficulty difficulty;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      result = args['result'] ?? '';
      gameMode = args['mode'] ?? GameMode.pvp;
      difficulty = args['difficulty'] ?? GameDifficulty.easy;
    } else {
      // Fallback for safety (though normally we pass map now)
      result = args.toString();
      gameMode = GameMode.pvp;
      difficulty = GameDifficulty.easy;
    }
  }

  void onRestart() {
    Get.offNamed(
      AppRoutes.game, 
      arguments: {
        'mode': gameMode, 
        'difficulty': difficulty
      }
    );
  }

  void onExit() {
    Get.offAllNamed(AppRoutes.home);
  }
}
