import 'package:get/get.dart';
import '../controllers/payment_controller.dart';

class PaymentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
