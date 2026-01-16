import 'package:get/get.dart';
import '../../../core/enums/game_enums.dart';
import '../../../core/utils/navigation_helpers.dart';
import '../../../data/models/game_arguments.dart';

class DifficultyController extends GetxController {
  
  void selectDifficulty(GameDifficulty difficulty) {
    NavigationHelpers.navigateToGame(GameArguments.pvc(difficulty));
  }
  
  void onBack() {
    Get.back();
  }
}
