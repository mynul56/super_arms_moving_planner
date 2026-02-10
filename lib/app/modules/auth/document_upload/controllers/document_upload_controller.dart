import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../routes/app_pages.dart';

class DocumentUploadController extends GetxController {
  // Text Controller
  final truckSizeController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // File paths
  var idFilePath = ''.obs;
  var businessRegistrationFilePath = ''.obs;
  var licenseFilePath = ''.obs;
  var insuranceFilePath = ''.obs;
  var socialSecurityFilePath = ''.obs;
  var bankAccountFilePath = ''.obs;
  var truckPhotoFilePath = ''.obs;

  @override
  void onClose() {
    truckSizeController.dispose();
    super.onClose();
  }

  Future<void> openCamera(String documentType) async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (photo != null) {
        _updateFilePath(documentType, photo.path);

        // Check file size (10 MB limit)
        final file = File(photo.path);
        final fileSize = await file.length();
        final fileSizeInMB = fileSize / (1024 * 1024);

        if (fileSizeInMB > 10) {
          Get.snackbar(
            'Error',
            'File size exceeds 10 MB limit. Please choose a smaller file.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red,
          );
          _updateFilePath(documentType, '');
          return;
        }

        Get.snackbar(
          'Success',
          '$documentType captured successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFEFB94C).withOpacity(0.1),
          colorText: const Color(0xFF212529),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open camera: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  Future<void> uploadFile(String documentType) async {
    try {
      // Use file_picker to allow multiple file types (images and PDFs)
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final filePath = result.files.single.path!;
        final file = File(filePath);

        // Check file size (10 MB limit)
        final fileSize = await file.length();
        final fileSizeInMB = fileSize / (1024 * 1024);

        if (fileSizeInMB > 10) {
          Get.snackbar(
            'Error',
            'File size exceeds 10 MB limit. Please choose a smaller file.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red,
          );
          return;
        }

        _updateFilePath(documentType, filePath);
        Get.snackbar(
          'Success',
          '$documentType uploaded successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFEFB94C).withOpacity(0.1),
          colorText: const Color(0xFF212529),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick file: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  void _updateFilePath(String documentType, String path) {
    switch (documentType) {
      case 'ID':
        idFilePath.value = path;
        break;
      case 'Business Registration':
        businessRegistrationFilePath.value = path;
        break;
      case 'License':
        licenseFilePath.value = path;
        break;
      case 'Insurance':
        insuranceFilePath.value = path;
        break;
      case 'Social Security':
        socialSecurityFilePath.value = path;
        break;
      case 'Bank Account':
        bankAccountFilePath.value = path;
        break;
      case 'Truck Photo':
        truckPhotoFilePath.value = path;
        break;
    }
  }

  String getFileName(String path) {
    if (path.isEmpty) return '';
    return path.split('/').last;
  }

  void submit() {
    // Validation
    if (idFilePath.value.isEmpty) {
      Get.snackbar('Error', 'Please upload your ID', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (businessRegistrationFilePath.value.isEmpty) {
      Get.snackbar('Error', 'Please upload business registration certificate', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (licenseFilePath.value.isEmpty) {
      Get.snackbar('Error', 'Please upload your license', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (insuranceFilePath.value.isEmpty) {
      Get.snackbar('Error', 'Please upload insurance document', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (socialSecurityFilePath.value.isEmpty) {
      Get.snackbar('Error', 'Please upload social security document', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (bankAccountFilePath.value.isEmpty) {
      Get.snackbar('Error', 'Please upload bank account details', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (truckPhotoFilePath.value.isEmpty) {
      Get.snackbar('Error', 'Please upload truck photo', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (truckSizeController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter truck size', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // TODO: Implement document upload API call
    // For now, navigate to submission complete screen
    Get.toNamed(Routes.SUBMISSION_COMPLETE);
  }
}
