import 'package:get/get.dart';

import '../controllers/select_mover_controller.dart';

class SelectMoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectMoverController>(
      () => SelectMoverController(),
    );
  }
}
