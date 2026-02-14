import 'package:get/get.dart';

import '../controllers/delivery_proof_controller.dart';

class DeliveryProofBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryProofController>(() => DeliveryProofController());
  }
}
