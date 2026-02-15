import 'package:get/get.dart';

class InventoryController extends GetxController {
  // Tab selection
  final selectedTabIndex = 0.obs;

  // Filter types
  static const int filterAll = 0;
  static const int filterOnMove = 1;
  static const int filterDelivered = 2;
  static const int filterCancelled = 3;

  // Mock order data - this would normally come from an API
  final List<Map<String, dynamic>> _allOrders = [
    {
      'id': '124769746ZX',
      'price': 480,
      'route': {'from': 'Paris', 'to': 'Paris'},
      'date': '9 am, Aug 28',
      'distance': '504 km',
      'status': 'delivered',
      'serviceType': 'Move',
      'rating': 5,
    },
    {
      'id': '124769746ZX',
      'price': 480,
      'route': {'from': 'Paris', 'to': 'Paris'},
      'date': '9 am, Aug 28',
      'distance': '504 km',
      'status': 'onMove',
      'serviceType': 'Move',
      'rating': 5,
    },
    {
      'id': '124769746ZX',
      'price': 480,
      'route': {'from': 'Paris', 'to': 'Paris'},
      'date': '9 am, Aug 28',
      'distance': '504 km',
      'status': 'canceled',
      'serviceType': 'Move',
      'rating': 5,
    },
    {
      'id': '124769746ZX',
      'price': 480,
      'route': {'from': 'Paris', 'to': 'Paris'},
      'date': '9 am, Aug 28',
      'distance': '504 km',
      'status': 'pending',
      'serviceType': 'Move',
      'rating': 5,
    },
  ];

  // Filtered orders based on selected tab
  List<Map<String, dynamic>> get filteredOrders {
    switch (selectedTabIndex.value) {
      case filterOnMove:
        return _allOrders
            .where((order) => order['status'] == 'onMove')
            .toList();
      case filterDelivered:
        return _allOrders
            .where((order) => order['status'] == 'delivered')
            .toList();
      case filterCancelled:
        return _allOrders
            .where((order) => order['status'] == 'canceled')
            .toList();
      default:
        return _allOrders;
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

  void viewAllOrders() {
    // TODO: Navigate to detailed orders list
    Get.snackbar(
      'Navigation',
      'View All Orders',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewOrderDetails(String orderId) {
    // TODO: Navigate to specific order details
    Get.snackbar(
      'Navigation',
      'View Details for Order $orderId',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
