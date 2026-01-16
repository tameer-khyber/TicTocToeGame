import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/utils/confirmation_dialog.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/theme_config.dart';
import '../../../core/widgets/base_scaffold.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  
  void onPlayPvP() {
    Get.toNamed(AppRoutes.playerSetup);
  }

  void onPlayPvC() {
    Get.toNamed('/difficulty');
  }

  void onExitApp() {
    // Use reusable confirmation dialog
    ConfirmationDialog.showExitConfirmation(
      onConfirm: () {
        if (kIsWeb) {
          // Web platform - show exit screen
          Get.offAll(() => const ExitScreen());
        } else {
          // Android platform - close app
          SystemNavigator.pop();
        }
      },
    );
  }
}

// Exit screen for web testing
class ExitScreen extends StatelessWidget {
  const ExitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.success,
              size: 100,
            ),
            const SizedBox(height: AppThemeConfig.p32),
            Text(
              'Thanks for Playing!',
              style: AppThemeConfig.h2Style(),
            ),
            const SizedBox(height: AppThemeConfig.p16),
            Text(
              'You can close this tab now',
              style: AppThemeConfig.bodyStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
