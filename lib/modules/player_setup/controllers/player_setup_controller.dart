import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/navigation_helpers.dart';
import '../../../data/models/game_arguments.dart';

class PlayerSetupController extends GetxController {
  final player1Controller = TextEditingController();
  final player2Controller = TextEditingController();
  
  // Validation error messages
  final player1Error = RxnString();
  final player2Error = RxnString();

  void onStartGame() {
    bool isValid = true;
    
    // Simple validation
    if (player1Controller.text.trim().isEmpty) {
      player1Error.value = "Please enter Player 1 name";
      isValid = false;
    } else {
      player1Error.value = null;
    }

    if (player2Controller.text.trim().isEmpty) {
      player2Error.value = "Please enter Player 2 name";
      isValid = false;
    } else {
      player2Error.value = null;
    }

    if (isValid) {
      NavigationHelpers.navigateToGame(
        GameArguments.pvp(
          player1Name: player1Controller.text.trim(),
          player2Name: player2Controller.text.trim(),
        ),
      );
    }
  }

  @override
  void onClose() {
    player1Controller.dispose();
    player2Controller.dispose();
    super.onClose();
  }
}
