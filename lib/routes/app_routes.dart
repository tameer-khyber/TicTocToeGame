import 'package:get/get.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/game/views/game_view.dart';
import '../modules/game/bindings/game_binding.dart';

class AppRoutes {
  static const String splash = '/';
  static const String game = '/game';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: game,
      page: () => const GameView(),
      binding: GameBinding(),
      transition: Transition.fadeIn, // Smooth transition
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
