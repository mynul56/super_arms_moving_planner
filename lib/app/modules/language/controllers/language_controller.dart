import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LanguageController extends GetxController {
  final selectedLanguage = 'English'.obs;

  void changeLanguage(String language) {
    selectedLanguage.value = language;
    if (language == 'English') {
      Get.updateLocale(const Locale('en', 'US'));
    } else if (language == 'Français') {
      Get.updateLocale(const Locale('fr', 'FR'));
    }
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
