import 'package:get/get.dart';

class AvailableOffersController extends GetxController {
  final selectedTab = 'All'.obs;
  final searchQuery = ''.obs;

  // List of filter tabs
  final tabs = ['All', 'Moves', 'Concierge', 'Move Planner', 'Truckfree'];

  // Sample offers data
  final RxList<Map<String, dynamic>> offers = <Map<String, dynamic>>[
    {
      'id': '124769746ZX',
      'price': '€480',
      'from': 'Paris',
      'to': 'Paris',
      'date': 'Aug 28, Sat',
      'time': '9 Am',
      'distance': '504 Km',
      'serviceType': 'Move',
      'serviceColor': 0xFFFF0004,
    },
    {
      'id': '124769746ZX',
      'price': '€480',
      'from': 'Paris',
      'to': 'Paris',
      'date': 'Aug 28, Sat',
      'time': '9 Am',
      'distance': '504 Km',
      'serviceType': 'Concierge',
      'serviceColor': 0xFF4A61FE,
    },
    {
      'id': '124769746ZX',
      'price': '€480',
      'from': 'Paris',
      'to': 'Paris',
      'date': 'Aug 28, Sat',
      'time': '9 Am',
      'distance': '504 Km',
      'serviceType': 'Truckfree',
      'serviceColor': 0xFFFBD182,
    },
    {
      'id': '124769746ZX',
      'price': '€480',
      'from': 'Paris',
      'to': 'Paris',
      'date': 'Aug 28, Sat',
      'time': '9 Am',
      'distance': '504 Km',
      'serviceType': 'Move Planner',
      'serviceColor': 0xFF00DBEE,
    },
  ].obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  List<Map<String, dynamic>> get filteredOffers {
    if (selectedTab.value == 'All') {
      return offers;
    }
    return offers
        .where((offer) => offer['serviceType'] == selectedTab.value)
        .toList();
  }

  void onViewDetails(Map<String, dynamic> offer) {
    // TODO: Navigate to offer details
    print('View details for offer: ${offer['id']}');
  }

  void onChat(Map<String, dynamic> offer) {
    // TODO: Navigate to chat
    print('Chat for offer: ${offer['id']}');
  }
}
