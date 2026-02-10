import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void OTP_Verification() {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter your email address', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email address', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    // Navigate to OTP verification
    Get.toNamed(Routes.OTP_VERIFICATION);
  }
}
