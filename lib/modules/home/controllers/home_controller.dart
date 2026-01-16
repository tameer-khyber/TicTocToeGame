import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

import '../../../core/enums/game_enums.dart';

class HomeController extends GetxController {
  
  void onPlayPvP() {
    Get.toNamed(
      AppRoutes.game, 
      arguments: {
        'mode': GameMode.pvp, 
        'difficulty': GameDifficulty.easy // Doesn't matter for PvP
      }
    );
  }

  void onPlayPvC() {
    Get.toNamed(AppRoutes.difficulty);
  }

  void onExitApp() {
    SystemNavigator.pop();
  }
}
