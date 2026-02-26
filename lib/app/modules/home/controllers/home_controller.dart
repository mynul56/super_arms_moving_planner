import 'package:get/get.dart';

class HomeController extends GetxController {
  // User profile
  final userName = 'John Doe'.obs;
  final userType = 'Personal'.obs; // Personal, Business, Military

  // Balance
  final balance = 25000.0.obs;
  final isBalanceVisible = false.obs;

  // Statistics
  final totalMoves = 12.obs;
  final activeMoves = 2.obs;
  final completedMoves = 10.obs;
  final itemsInventoried = 145.obs;

  // Active moves list
  final RxList<Map<String, dynamic>> upcomingMoves = <Map<String, dynamic>>[
    {
      'id': '1',
      'destination': 'New York, NY',
      'date': 'Feb 15, 2026',
      'status': 'In Progress',
      'progress': 0.65,
      'items': 45,
    },
    {
      'id': '2',
      'destination': 'San Francisco, CA',
      'date': 'Mar 2, 2026',
      'status': 'Planning',
      'progress': 0.25,
      'items': 32,
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadUserData() {
    // TODO: Load actual user data from API/local storage
    // For now using mock data
  }

  void navigateToNewMove() {
    // TODO: Navigate to new move creation screen
    Get.snackbar(
      'Navigation'.tr,
      'Navigate to New Move'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToInventory() {
    // TODO: Navigate to inventory screen
    Get.snackbar(
      'Navigation'.tr,
      'Navigate to Inventory'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToSchedule() {
    // TODO: Navigate to schedule screen
    Get.snackbar(
      'Navigation'.tr,
      'Navigate to Schedule'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToDocuments() {
    // TODO: Navigate to documents screen
    Get.snackbar(
      'Navigation'.tr,
      'Navigate to Documents'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewMoveDetails(String moveId) {
    // TODO: Navigate to move details
    Get.snackbar(
      'Move Details',
      'Viewing move $moveId',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void toggleBalance() {
    isBalanceVisible.value = !isBalanceVisible.value;
  }
}
