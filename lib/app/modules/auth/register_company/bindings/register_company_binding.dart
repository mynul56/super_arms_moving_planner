import 'package:get/get.dart';

import '../controllers/register_company_controller.dart';

class RegisterCompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCompanyController>(() => RegisterCompanyController());
  }
}
