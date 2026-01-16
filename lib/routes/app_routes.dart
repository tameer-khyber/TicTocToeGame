import 'package:get/get.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/game/views/game_view.dart';
import '../modules/game/bindings/game_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/game_over/views/game_over_view.dart';
import '../modules/game_over/bindings/game_over_binding.dart';
import '../modules/difficulty/views/difficulty_view.dart';
import '../modules/difficulty/bindings/difficulty_binding.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const difficulty = '/difficulty';
  static const String game = '/game';
  static const String gameOver = '/game_over';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: difficulty,
      page: () => const DifficultyView(),
      binding: DifficultyBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: game,
      page: () => const GameView(),
      binding: GameBinding(),
      transition: Transition.fadeIn, // Smooth transition
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: gameOver,
      page: () => const GameOverView(),
      binding: GameOverBinding(),
      transition: Transition.zoom,
    ),
  ];
}
