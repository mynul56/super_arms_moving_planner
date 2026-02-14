import 'package:get/get.dart';

class ClientProfileController extends GetxController {
  final client = Rxn<Map<String, dynamic>>();

  // Mock order history data matching the design
  final orderHistory = <Map<String, dynamic>>[
    {
      'id': '124769746ZX',
      'price': '€480',
      'date': 'Aug 28, Sat',
      'time': '9 Am',
      'distance': '504 Km',
      'status': 'Delivered',
    },
    {
      'id': '124769746ZX',
      'price': '€480',
      'date': 'Aug 28, Sat',
      'time': '9 Am',
      'distance': '504 Km',
      'status': 'On Move',
    },
    {
      'id': '124769746ZX',
      'price': '€480',
      'date': 'Aug 28, Sat',
      'time': '9 Am',
      'distance': '504 Km',
      'status': 'Pending',
    },
    {
      'id': '124769746ZX',
      'price': '€480',
      'date': 'Aug 28, Sat',
      'time': '9 Am',
      'distance': '504 Km',
      'status': 'Canceled',
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      client.value = Get.arguments as Map<String, dynamic>;
    }
  }

  void onViewDetails(Map<String, dynamic> order) {
    // TODO: Navigate to order details
    Get.snackbar('Order Details', 'View details for order ${order['id']}');
  }
}
