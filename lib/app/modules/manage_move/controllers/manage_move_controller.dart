import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class ManageMoveController extends GetxController {
  // Tab management
  final selectedTabIndex = 0.obs;
  
  // Mock move data
  final List<Map<String, dynamic>> mockMoves = [
    {
      'id': 'MV001',
      'customerName': 'Sarah Johnson',
      'price': '250',
      'rating': 4.8,
      'route': {
        'from': 'Downtown Office',
        'to': 'Midtown Apartment',
      },
      'date': 'Feb 15, 2024 - 9:30 AM',
      'serviceType': 'Residential',
      'distance': '12 km',
      'status': 'onmove',
      'priority': 'High',
      'crew': '3 people',
      'truck': 'Large Truck',
    },
    {
      'id': 'MV002',
      'customerName': 'Tech Solutions Inc',
      'price': '480',
      'route': {
        'from': 'Business District',
        'to': 'Industrial Park',
      },
      'date': 'Feb 16, 2024 - 11:00 AM',
      'serviceType': 'Commercial',
      'distance': '25 km',
      'status': 'pending',
      'priority': 'Medium',
      'crew': '4 people',
      'truck': 'XL Truck',
    },
    {
      'id': 'MV003',
      'customerName': 'Maria Rodriguez',
      'price': '180',
      'rating': 4.9,
      'route': {
        'from': 'Sunset Villa',
        'to': 'Metro Center',
      },
      'date': 'Feb 16, 2024 - 2:00 PM',
      'serviceType': 'Residential',
      'distance': '8 km',
      'status': 'delivered',
      'priority': 'Low',
      'crew': '2 people',
      'truck': 'Medium Truck',
    },
    {
      'id': 'MV004',
      'customerName': 'Global Logistics',
      'price': '720',
      'route': {
        'from': 'Warehouse A',
        'to': 'Distribution Center',
      },
      'date': 'Feb 17, 2024 - 8:00 AM',
      'serviceType': 'Commercial',
      'distance': '45 km',
      'status': 'pending',
      'priority': 'High',
      'crew': '5 people',
      'truck': 'XXL Truck',
    },
    {
      'id': 'MV005',
      'customerName': 'Robert Chen',
      'price': '320',
      'rating': 4.7,
      'route': {
        'from': 'University District',
        'to': 'Suburban Heights',
      },
      'date': 'Feb 17, 2024 - 3:30 PM',
      'serviceType': 'Residential',
      'distance': '18 km',
      'status': 'onmove',
      'priority': 'Medium',
      'crew': '3 people',
      'truck': 'Large Truck',
    },
    {
      'id': 'MV006',
      'customerName': 'Emma Wilson',
      'price': '150',
      'route': {
        'from': 'City Center',
        'to': 'Airport Plaza',
      },
      'date': 'Feb 18, 2024 - 10:00 AM',
      'serviceType': 'Personal',
      'distance': '15 km',
      'status': 'canceled',
      'priority': 'Low',
      'crew': '2 people',
      'truck': 'Small Truck',
    },
  ];

  // Filter moves based on selected tab
  List<Map<String, dynamic>> get filteredMoves {
    switch (selectedTabIndex.value) {
      case 0: // All
        return mockMoves;
      case 1: // On Move
        return mockMoves.where((move) => move['status'] == 'onmove').toList();
      case 2: // Delivered
        return mockMoves.where((move) => move['status'] == 'delivered').toList();
      case 3: // Cancelled
        return mockMoves.where((move) => move['status'] == 'canceled').toList();
      default:
        return mockMoves;
    }
  }

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

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

  void viewAllMoves() {
    // TODO: Navigate to detailed moves list
    Get.snackbar(
      'Navigation'.tr,
      'View All Moves'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewMoveDetails(String moveId) {
    // TODO: Navigate to specific move details
    Get.snackbar(
      'Navigation',
      'View Details for Move $moveId',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> selectMover(String moveId) async {
    // Navigate to select mover page
    final result = await Get.toNamed(Routes.SELECT_MOVER);
    if (result != null) {
      // Handle the selected mover
      Get.snackbar(
        'Success',
        'Mover assigned to move $moveId',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
