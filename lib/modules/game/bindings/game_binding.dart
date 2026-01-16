import 'package:get/get.dart';
import '../viewmodels/game_viewmodel.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameViewModel>(() => GameViewModel());
  }
}
