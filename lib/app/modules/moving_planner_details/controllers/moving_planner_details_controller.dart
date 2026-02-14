import 'package:get/get.dart';
import 'package:super_arms_moving_planner/app/utils/waybill_pdf_generator.dart';

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

  final selectedMainTab = 0.obs;
  final consignmentNote = 'Move Carefully'.obs;

  void selectMainTab(int index) {
    selectedMainTab.value = index;
  }

  void updateConsignmentNote(String note) {
    consignmentNote.value = note;
  }

  Future<void> downloadWaybill() async {
    await WaybillPdfGenerator.generatePdf();
  }

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
