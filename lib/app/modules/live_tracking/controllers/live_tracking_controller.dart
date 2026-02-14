import 'package:get/get.dart';

class LiveTrackingController extends GetxController {
  final moves = <Map<String, dynamic>>[
    {
      'id': '1',
      'date': 'Aug 28',
      'time': '9 am',
      'date_time': '9 am, Aug 28',
      'items': 3,
      'status': 'On Move',
      'price': '480',
      'distance': '504 Km',
      'serviceType': 'Move',
      'from': 'Paris',
      'to': 'Paris',
    },
    {
      'id': '2',
      'date': 'Aug 30',
      'time': '10 am',
      'date_time': '10 am, Aug 30',
      'items': 5,
      'status': 'On Move',
      'price': '480',
      'distance': '504 Km',
      'serviceType': 'Move',
      'from': 'Paris',
      'to': 'Paris',
    },
  ].obs;

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
}
