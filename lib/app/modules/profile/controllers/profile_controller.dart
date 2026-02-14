import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  final ImagePicker _picker = ImagePicker();

  // Map to store document paths: key is document title, value is file path
  final uploadedDocuments = <String, String>{}.obs;

  // Truck size controller
  final truckSize = ''.obs;

  // Company Details Controllers
  final companyNameController = TextEditingController(text: 'Al Muntakim');
  final companyPhoneController = TextEditingController(text: '+4364654557');
  final companyAddressController = TextEditingController(text: '270/7, Paris');
  final companyZipController = TextEditingController(text: '13463');

  // Employee Management
  final employees = <Map<String, String>>[
    {'name': 'Al Muntakim', 'role': 'Mover'},
    {'name': 'Al Muntakim', 'role': 'Mover'},
    {'name': 'Al Muntakim', 'role': 'Mover'},
    {'name': 'Al Muntakim', 'role': 'Mover'},
  ].obs;

  final employeeNameController = TextEditingController();
  final employeeRoleController = TextEditingController();

  void addEmployee() {
    if (employeeNameController.text.isNotEmpty &&
        employeeRoleController.text.isNotEmpty) {
      employees.add({
        'name': employeeNameController.text,
        'role': employeeRoleController.text,
      });
      employeeNameController.clear();
      employeeRoleController.clear();
      Get.back(); // Go back to Manage Company page
      Get.snackbar(
        'Success',
        'Employee added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFEFB84B),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeEmployee(int index) {
    employees.removeAt(index);
  }

  @override
  void onClose() {
    companyNameController.dispose();
    companyPhoneController.dispose();
    companyAddressController.dispose();
    companyZipController.dispose();
    employeeNameController.dispose();
    employeeRoleController.dispose();
    super.onClose();
  }

  var selectedCountry = 'United State'.obs;
  final countries = [
    'United State',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'India',
    'Japan',
  ].obs;

  Future<void> pickImage(String documentType, ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        uploadedDocuments[documentType] = image.path;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void updateTruckSize(String size) {
    truckSize.value = size;
  }

  void submitDocuments() {
    // Mock submission
    if (uploadedDocuments.isEmpty && truckSize.value.isEmpty) {
      Get.snackbar(
        'Alert',
        'Please fill in at least one field',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.snackbar(
      'Success',
      'Documents submitted successfully!\nTruck Size: ${truckSize.value}\nFiles: ${uploadedDocuments.length}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFEFB84B),
      colorText: Colors.white,
    );
  }
}
