import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class GameOverController extends GetxController {
  late String result;

  @override
  void onInit() {
    super.onInit();
    result = Get.arguments as String;
  }

  void onRestart() {
    Get.offNamed(AppRoutes.game);
  }

  void onExit() {
    Get.offAllNamed(AppRoutes.home);
  }
}
