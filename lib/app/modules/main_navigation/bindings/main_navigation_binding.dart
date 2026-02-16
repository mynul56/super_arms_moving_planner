import 'package:get/get.dart';
import '../controllers/main_navigation_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../payment/controllers/payment_controller.dart';
import '../../schedule/controllers/schedule_controller.dart';
import '../../chat/controllers/chat_controller.dart';

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavigationController>(
      () => MainNavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(),
    );
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
