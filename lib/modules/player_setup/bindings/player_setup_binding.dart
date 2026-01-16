import 'package:get/get.dart';
import '../controllers/player_setup_controller.dart';

class PlayerSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerSetupController>(
      () => PlayerSetupController(),
    );
  }
}
