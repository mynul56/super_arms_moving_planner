import 'package:get/get.dart';

import '../controllers/route_offers_controller.dart';

class RouteOffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouteOffersController>(() => RouteOffersController());
  }
}
