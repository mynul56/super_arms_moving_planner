import 'package:get/get.dart';

class MovingPlannerDetailsController extends GetxController {
  // Data Observables
  final orderId = '124769746ZX'.obs;
  final serviceType = 'Moving Planner'.obs;
  final moveDate = 'Aug 28, Sat'.obs;
  final moveTime = '9 Am'.obs;
  final boxCount = '03'.obs;
  final status = 'Pending'.obs;

  final clientName = 'Al Muntakim'.obs;
  final pickupAddress = '270/2 Paris, France'.obs;
  final deliveryAddress = '23/2 Paris, France'.obs;
  final distance = '512KM Distance'.obs;

  final specialRequirements = 'Move very Carefully.'.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChatWithClient() {
    // Navigate to chat or show action
    print('Chat with client');
  }
}
