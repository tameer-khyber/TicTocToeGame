import 'package:get/get.dart';
import '../../../core/utils/navigation_helpers.dart';
import '../../../data/models/game_arguments.dart';

class GameOverController extends GetxController {
  late String result;
  late GameArguments gameArguments;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      result = args['result'] ?? '';
      gameArguments = GameArguments.fromMap(args);
    } else {
      // Fallback for safety
      result = args.toString();
      gameArguments = GameArguments.pvp();
    }
  }

  void onRestart() {
    NavigationHelpers.navigateToGame(gameArguments);
  }

  void onExit() {
    NavigationHelpers.navigateToHome();
  }
}
