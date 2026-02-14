import 'package:get/get.dart';

class ClientsController extends GetxController {
  final selectedTab = 'All'.obs;

  // List of filter tabs matching the design
  final tabs = ['All', 'On Move', 'Delivered', 'Cancelled', 'Price Offered'];

  // Mock clients data
  final RxList<Map<String, dynamic>> clients = <Map<String, dynamic>>[
    {
      'name': 'Al Muntakim',
      'address': '270/2 Paris, France',
      'serviceType': 'Concierge',
      'image': 'assets/images/user.jpg', // Placeholder
      'status': 'On Move',
    },
    {
      'name': 'Al Muntakim',
      'address': '270/2 Paris, France',
      'serviceType': 'Move',
      'image': 'assets/images/user.jpg', // Placeholder
      'status': 'Delivered',
    },
    {
      'name': 'Al Muntakim',
      'address': '270/2 Paris, France',
      'serviceType': 'Moving Planner',
      'image': 'assets/images/user.jpg', // Placeholder
      'status': 'Cancelled',
    },
    {
      'name': 'Al Muntakim',
      'address': '270/2 Paris, France',
      'serviceType': 'Truckfree',
      'image': 'assets/images/user.jpg', // Placeholder
      'status': 'Price Offered',
    },
  ].obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }

  List<Map<String, dynamic>> get filteredClients {
    if (selectedTab.value == 'All') {
      return clients;
    }
    // Simple mapping for demo purposes.
    // In a real app, 'status' might match tabs exactly or have a mapping.
    // Here we assume status matches tab name for simplicity, based on design labels.
    return clients
        .where((client) => client['status'] == selectedTab.value)
        .toList();
  }

  void onViewProfile(Map<String, dynamic> client) {
    Get.toNamed('/client-profile', arguments: client);
  }
}
