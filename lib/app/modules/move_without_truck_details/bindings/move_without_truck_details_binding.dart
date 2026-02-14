import 'package:get/get.dart';

import '../controllers/move_without_truck_details_controller.dart';

class MoveWithoutTruckDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoveWithoutTruckDetailsController>(
      () => MoveWithoutTruckDetailsController(),
    );
  }
}
