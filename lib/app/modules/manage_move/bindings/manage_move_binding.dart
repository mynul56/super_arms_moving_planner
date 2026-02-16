import 'package:get/get.dart';

import '../controllers/manage_move_controller.dart';

class ManageMoveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageMoveController>(
      () => ManageMoveController(),
    );
  }
}
