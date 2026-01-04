import 'package:get/get.dart';
import '../../../core/enums/game_enums.dart';
import '../../../routes/app_routes.dart';

class DifficultyController extends GetxController {
  
  void selectDifficulty(GameDifficulty difficulty) {
    Get.toNamed(
      AppRoutes.game, 
      arguments: {
        'mode': GameMode.pvc, 
        'difficulty': difficulty
      }
    );
  }
  
  void onBack() {
    Get.back();
  }
}
