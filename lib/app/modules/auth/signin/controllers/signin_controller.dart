import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;

  @override
  void onClose() {
    // emailController.dispose();
    // passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void signIn() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Error'.tr,
        'Please enter your email address'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Error'.tr,
        'Please enter a valid email address'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (password.isEmpty) {
      Get.snackbar(
        'Error'.tr,
        'Please enter your password'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: Implement sign in logic
    Get.snackbar(
      'Success'.tr,
      'Sign in successful'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void signInWithGoogle() {
    // TODO: Implement Google sign in logic
    Get.snackbar(
      'Info'.tr,
      'Google sign in coming soon'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
