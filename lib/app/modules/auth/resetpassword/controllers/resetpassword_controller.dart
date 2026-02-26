import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';

class ResetpasswordController extends GetxController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    // passwordController.dispose();
    // confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void savePassword() {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error'.tr,
        'Please fill all fields'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error'.tr,
        'Passwords do not match'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: Implement API call to reset password

    // Mock success
    Get.snackbar(
      'Success'.tr,
      'Password reset successfully'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );

    // Navigate to Sign In or Home
    Get.offAllNamed(Routes.SIGNIN);
  }
}
