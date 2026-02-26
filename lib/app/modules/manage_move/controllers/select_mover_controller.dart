import 'package:get/get.dart';

class SelectMoverController extends GetxController {
  // Selected mover ID
  final selectedMoverId = Rxn<String>();
  
  // Mock mover data
  final List<Map<String, dynamic>> movers = [
    {
      'id': 'MVR001',
      'name': 'Al Muntaqim',
      'role': 'Mover',
      'rating': 4.8,
      'completedMoves': 156,
      'availability': 'Available',
    },
    {
      'id': 'MVR002',
      'name': 'Al Muntaqim',
      'role': 'Mover',
      'rating': 4.9,
      'completedMoves': 203,
      'availability': 'Available',
    },
    {
      'id': 'MVR003',
      'name': 'Al Muntaqim',
      'role': 'Mover',
      'rating': 4.7,
      'completedMoves': 98,
      'availability': 'Available',
    },
    {
      'id': 'MVR004',
      'name': 'Al Muntaqim',
      'role': 'Mover',
      'rating': 4.6,
      'completedMoves': 142,
      'availability': 'Available',
    },
    {
      'id': 'MVR005',
      'name': 'Al Muntaqim',
      'role': 'Mover',
      'rating': 4.8,
      'completedMoves': 178,
      'availability': 'Available',
    },
    {
      'id': 'MVR006',
      'name': 'Al Muntaqim',
      'role': 'Mover',
      'rating': 4.9,
      'completedMoves': 221,
      'availability': 'Available',
    },
    {
      'id': 'MVR007',
      'name': 'Al Muntaqim',
      'role': 'Mover',
      'rating': 4.7,
      'completedMoves': 134,
      'availability': 'Available',
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void selectMover(String moverId) {
    selectedMoverId.value = moverId;
  }

  void confirmMover() {
    if (selectedMoverId.value != null) {
      // TODO: Implement mover confirmation logic
      Get.back(result: selectedMoverId.value);
      Get.snackbar(
        'Success'.tr,
        'Mover confirmed successfully'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error'.tr,
        'Please select a mover first'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
