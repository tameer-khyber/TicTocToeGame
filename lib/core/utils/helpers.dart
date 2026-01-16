import '../constants/app_strings.dart';

class Helpers {
  // Add any utility functions here if needed in future
  static String formatGameResult(String winner) {
    if (winner == 'X') return AppStrings.winX;
    if (winner == 'O') return AppStrings.winO;
    return AppStrings.draw;
  }
}
