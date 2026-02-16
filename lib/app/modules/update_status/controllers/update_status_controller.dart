import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  // Receive move data as parameters
  late Map<String, dynamic> moveData;

  // Selected status
  final selectedStatus = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Get move data from navigation arguments
    moveData = Get.arguments ?? {};

    // Set initial selected status (default to first option)
    selectedStatus.value = 'On The Way To Pickup';
  }

  void selectStatus(String status) {
    selectedStatus.value = status;
    print('Status selected: $status for order ${moveData['id']}');

    // If "Delivered" is selected, navigate to delivery proof
    if (status == 'Delivered') {
      _showDeliveredDialog();
    }
  }

  void _showDeliveredDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Mark this consignment\nas delivered?',
                textAlign: TextAlign.center,
                style: Get.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF212529),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back(); // Close dialog
                        Get.back(); // Go back to live tracking
                        Get.toNamed('/delivery-proof');
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFB94C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFAAAAAA)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212529),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
