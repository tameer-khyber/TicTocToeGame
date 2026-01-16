import 'package:get/get.dart';
import '../controllers/game_over_controller.dart';

class GameOverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameOverController>(
      () => GameOverController(),
    );
  }
}
