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
      Get.snackbar('Error', 'Please enter your full name', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (phone.isEmpty) {
      Get.snackbar('Error', 'Please enter your phone number', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (address.isEmpty) {
      Get.snackbar('Error', 'Please enter your address', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (zipCode.isEmpty) {
      Get.snackbar('Error', 'Please enter your zip code', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password.isEmpty) {
      Get.snackbar('Error', 'Please enter a password', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (!agreeToTerms.value) {
      Get.snackbar('Error', 'Please agree to terms and conditions', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Navigate to register company screen
    Get.toNamed(Routes.REGISTER_COMPANY);
  }
}
