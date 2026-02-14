import 'package:get/get.dart';

import '../controllers/concoerge_details_controller.dart';

class ConciergeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConciergeDetailsController>(() => ConciergeDetailsController());
  }
}
