import 'package:get/get.dart';

import '../controllers/concierge_details_controller.dart';

class ConciergeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConciergeDetailsController>(() => ConciergeDetailsController());
  }
}
