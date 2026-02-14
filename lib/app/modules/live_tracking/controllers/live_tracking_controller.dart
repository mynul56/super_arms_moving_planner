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

  final expandedMoveId = RxnString();

  void toggleExpanded(String id) {
    if (expandedMoveId.value == id) {
      expandedMoveId.value = null; // Collapse if already expanded
    } else {
      expandedMoveId.value = id; // Expand
    }
  }

  void updateStatus(String id, String status) {
    final index = moves.indexWhere((m) => m['id'] == id);
    if (index != -1) {
      moves[index]['status'] = status;
      moves.refresh(); // Force UI update
    }
    // Collapse after status update? Or keep expanded?
    // Usually keep expanded or collapse. Let's keep it for now or collapse if 'Delivered'.
    if (status == 'Delivered') {
      expandedMoveId.value = null;
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
}
