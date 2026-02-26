import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final agreeToTerms = false.obs;
  final selectedState = 'California'.obs;

  final List<String> states = [
    'California',
    'Texas',
    'Florida',
    'New York',
    'Pennsylvania',
    'Illinois',
    'Ohio',
    'Georgia',
    'North Carolina',
    'Michigan',
  ];

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleTerms() {
    agreeToTerms.value = !agreeToTerms.value;
  }

  void register() {
    final fullName = fullNameController.text.trim();
    final phone = phoneController.text.trim();
    final address = addressController.text.trim();
    final zipCode = zipCodeController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (fullName.isEmpty) {
      Get.snackbar('Error'.tr, 'Please enter your full name'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (phone.isEmpty) {
      Get.snackbar('Error'.tr, 'Please enter your phone number'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (address.isEmpty) {
      Get.snackbar('Error'.tr, 'Please enter your address'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (zipCode.isEmpty) {
      Get.snackbar('Error'.tr, 'Please enter your zip code'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password.isEmpty) {
      Get.snackbar('Error'.tr, 'Please enter a password'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password.length < 6) {
      Get.snackbar('Error'.tr, 'Password must be at least 6 characters'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar('Error'.tr, 'Passwords do not match'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (!agreeToTerms.value) {
      Get.snackbar('Error'.tr, 'Please agree to terms and conditions'.tr, snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Navigate to register company screen
    Get.toNamed(Routes.REGISTER_COMPANY);
  }
}
