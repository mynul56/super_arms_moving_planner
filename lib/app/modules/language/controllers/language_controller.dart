import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LanguageController extends GetxController {
  final selectedLanguage = 'English'.obs;

  void changeLanguage(String language) {
    selectedLanguage.value = language;
  }

  void onContinue() {
    // Navigate to the next screen based on the flow.
    if (Get.arguments != null && Get.arguments['from'] == 'drawer') {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.ONBOARDING);
    }
  }
}
