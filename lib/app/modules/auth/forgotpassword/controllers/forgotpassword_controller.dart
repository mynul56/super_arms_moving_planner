import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../routes/app_pages.dart';

class ForgotpasswordController extends GetxController {
  final count = 0.obs;
  late TextEditingController emailController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void resetPassword() {
    // Implement reset password logic here
    if (emailController.text.isNotEmpty) {
      Get.toNamed(Routes.OTP_VERIFICATION);
      Get.snackbar(
        'Success',
        'Password reset link sent to ${emailController.text}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error'.tr,
        'Please enter your email'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
