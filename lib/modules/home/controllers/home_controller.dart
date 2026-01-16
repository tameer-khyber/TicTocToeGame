import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  
  void onPlayGame() {
    Get.toNamed(AppRoutes.game);
  }

  void onExitApp() {
    SystemNavigator.pop();
  }
}
