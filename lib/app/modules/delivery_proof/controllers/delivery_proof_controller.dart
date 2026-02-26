import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';

class DeliveryProofController extends GetxController {
  final selectedImage = Rxn<File>();
  final _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  void submitProof() {
    if (selectedImage.value == null) {
      Get.snackbar('Error'.tr, 'Please provide an image proof'.tr);
      return;
    }
    // Mock submission
    Get.offAllNamed(Routes.CONGRATULATIONS);
    Get.snackbar('Success'.tr, 'Delivery proof submitted successfully'.tr);
  }
}
