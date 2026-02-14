import 'package:get/get.dart';

import '../controllers/search_offers_controller.dart';

class SearchOffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchOffersController>(() => SearchOffersController());
  }
}
