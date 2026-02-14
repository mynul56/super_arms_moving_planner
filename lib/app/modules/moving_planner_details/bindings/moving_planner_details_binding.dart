import 'package:get/get.dart';

import '../controllers/moving_planner_details_controller.dart';

class MovingPlannerDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovingPlannerDetailsController>(
      () => MovingPlannerDetailsController(),
    );
  }
}
