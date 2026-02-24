import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('SplashController initialized');
  }

  @override
  void onReady() {
    super.onReady();
    print('SplashController ready, starting 3s timer');
    // Navigate to Onboarding after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      print('Splash timer finished, navigating to Language screen');
      Get.offAllNamed(Routes.LANGUAGE);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
