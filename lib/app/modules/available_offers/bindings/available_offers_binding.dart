import 'package:get/get.dart';
import '../controllers/available_offers_controller.dart';

class AvailableOffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvailableOffersController>(() => AvailableOffersController());
  }
}
