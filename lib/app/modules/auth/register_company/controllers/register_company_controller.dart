import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class RegisterCompanyController extends GetxController {
  // Text Controllers
  final companyNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final employeeCountController = TextEditingController();

  // Employee Details Controllers
  final employee1NameController = TextEditingController();
  final employee1RoleController = TextEditingController();
  final employee2NameController = TextEditingController();
  final employee2RoleController = TextEditingController();
  final employee3NameController = TextEditingController();
  final employee3RoleController = TextEditingController();
  final employee4NameController = TextEditingController();
  final employee4RoleController = TextEditingController();

  // Reactive Variables
  var selectedState = 'New York'.obs;
  var agreeToTerms = false.obs;

  // State List
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
    companyNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    employeeCountController.dispose();
    employee1NameController.dispose();
    employee1RoleController.dispose();
    employee2NameController.dispose();
    employee2RoleController.dispose();
    employee3NameController.dispose();
    employee3RoleController.dispose();
    employee4NameController.dispose();
    employee4RoleController.dispose();
    super.onClose();
  }

  void toggleTerms() {
    agreeToTerms.value = !agreeToTerms.value;
  }

  void register() {
    // Validation
    if (companyNameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter company name', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter phone number', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (addressController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter address', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (zipCodeController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter zip code', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (employeeCountController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter number of employees', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (!agreeToTerms.value) {
      Get.snackbar('Error', 'Please agree to terms and conditions', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Navigate to document upload screen
    Get.toNamed(Routes.DOCUMENT_UPLOAD);
  }
}
