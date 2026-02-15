import 'package:get/get.dart';

import '../controllers/installment_controller.dart';
import '../controllers/order_details_controller.dart';

class InstallmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstallmentController>(() => InstallmentController());
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
  }
}
